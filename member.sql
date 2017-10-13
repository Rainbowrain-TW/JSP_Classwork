USE [member]
GO
/****** Object:  Table [dbo].[memberData]    Script Date: 2017/10/13 下午 01:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[memberData](
	[member_id] [int] IDENTITY(1,1) NOT NULL,
	[member_name] [nvarchar](50) NOT NULL,
	[member_Email] [varchar](50) NOT NULL,
	[member_password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_memberData] PRIMARY KEY CLUSTERED 
(
	[member_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
