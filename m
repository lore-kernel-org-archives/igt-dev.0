Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2167C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 05:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA5A10E074;
	Fri, 18 Apr 2025 05:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2nOBg8uX";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3078A10E074
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 05:25:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zTcdPWkwr8vhiNmTgfPnEmtu2yHCU8pu7pinaYQ2Sf7qZv/Y+ufl9Ka8axb+Xo0US+biUeMWv5A6zlcj+x+7rZofWVZI5/ntDwerixFJyUSOz4YlVCmhQm6VGLvFnsjAhJB09okv97vXkGTzcRZwGWa3pco5/P4WHou624/GYX9iq3+hDXl6mVYaIIWy/Lc9pRjqSiNsem4XB+YVv9A8gzfJDvEjOtsPg/JNOhDA1DsNsgbcxDaIIj/itRRdrNEFezQElJRv28rMS5Qhr/h2PEiiYTIUXno7LnrlWPpCp2eMuQ2vOpRu1OocoVGO4dVVWk7Rf6LiemD2RIyGFfmxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TKbGlA1SZLitxpf8LSYlM6M/F5iaVQQEiLcGnKqlFQ=;
 b=xo2BafBi9PFI3Oy01QSDohHiJiB6bhZJdcX3Wbq+iFKLN8fBTYoJgktIq9tj7K1KGUMQ06S+jAUQAgFYRey+Lt8JwEwEsU+DxfRBi0qyK9mQPmFy3scIBNMsyqKTc3ZOLQLekN6GZxZy4Lb/B38ZNcQGIe/h/agXdDUjqipPXvDLpoLiWe+0ByUqHzEPYlnEnJR9x5D9c+dPyd3QQlm2u5yQyq9kAqSojxivELA2sH9Q8eWON+AXCem6wDIW7hGxWxZVeh5IJI5Eq+a4Xx2De2bNJogepiAzw3dau3D88dp3wjmlTdAdWrNdJ8S4DtEbPMZD9RRxIdsiIBb+tZpqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TKbGlA1SZLitxpf8LSYlM6M/F5iaVQQEiLcGnKqlFQ=;
 b=2nOBg8uXG1WLd8vV6IbG+/YNtoL1hvDYiuxdF5QWVHpPhqDLSyMggDwUx2FCNdk4+UwR+JUT2ZoNQUX6FltKfSSO4AyAux7RBCkfHlty36y8IAgKXjq/hOBlThGwfm7DK0AsH7WVb9jJN6ltCQCJPIUSA7uomKgqjb8yF5MhYsU=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SA1PR12MB6680.namprd12.prod.outlook.com (2603:10b6:806:253::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Fri, 18 Apr
 2025 05:25:43 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Fri, 18 Apr 2025
 05:25:43 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Zhang, Jesse(Jie)"
 <Jesse.Zhang@amd.com>
Subject: RE: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure
 flags for user queues
Thread-Topic: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure
 flags for user queues
Thread-Index: AQHbsAm7pohBkfMuhkGq7BoIUEuBQLOo5DMg
Date: Fri, 18 Apr 2025 05:25:43 +0000
Message-ID: <BL1PR12MB5753125833A13069BEEEE9F793BF2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250418022918.623643-1-jesse.zhang@amd.com>
 <20250418022918.623643-2-jesse.zhang@amd.com>
In-Reply-To: <20250418022918.623643-2-jesse.zhang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=118472fb-42c7-4daf-bed7-c73cacec0e94;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-18T05:24:20Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|SA1PR12MB6680:EE_
x-ms-office365-filtering-correlation-id: 609de6e6-92ee-4d57-8338-08dd7e39772e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?S5Z6PO8wVa6DpBa0/xiJGGYHlKe9ThKqtSnFMuMIb6J5mIfrJ44DfTmJY7PB?=
 =?us-ascii?Q?1X+8SHlQ8WncjBp7u420z9/jOVT7XXUM6j+t2TMsaklRW9K/4tX+QWSTkzOj?=
 =?us-ascii?Q?5hYzKX3aZ/OW85tQfdmKgi2PMJ1DsOVPIBO3kbRYJ5prbJAkwT3abuwkdeGR?=
 =?us-ascii?Q?oju4Mo9sYcCLbcr5jyAiVyhsuhJaQmtmVVGT1QS439i9z2UB3tE7sFTNsTTA?=
 =?us-ascii?Q?6LCXKA8EXP7Rob19zMojZzJs/TY/MZiyLimfJlzWyLd22Rd8CEyy58CWNpSR?=
 =?us-ascii?Q?9Ecrmck8ou1ZJzM2O/WPp0nzb0Jf04//BMd2l9w70kMSynhsA/HP1AiU2R91?=
 =?us-ascii?Q?V1HvKxss3iTNM/YANnivDAKl2MuwnIze4JR6JO6ct47Db6JmfOinTyngyz1H?=
 =?us-ascii?Q?DhuimunnUGWzhrTgqbLmyajfgx76jrCX5E8OPVh3z8A5MaD5BwVTVTiXEUig?=
 =?us-ascii?Q?kVlr5XPvhG7rBZ/RM+TECD1yi3aEGAzOlRotxHhxDDJ5rvAfew+d6bz7DQ4N?=
 =?us-ascii?Q?bqeIzcGIKRctVjbBxg7TOQ2ZtPjWvF2Sj7dmRjS1QxrgOm1kfNzZq636r8jP?=
 =?us-ascii?Q?2jFmKzNxxR0mPE2HtPeL9UH+fMTepbKcoDF6o6qOYKIGytXJD9omLKNW7o6F?=
 =?us-ascii?Q?3zhRcB/gbmisXiQ5vyLZYnZhVTvICK706k9GPlyFKwbEOqUaNGPPhJGaZEQw?=
 =?us-ascii?Q?jFI3gMt/4GBJz5q9mpianOGJEAHVwTJDJPHqSsaNwRh3602KjGMOGynZs22Y?=
 =?us-ascii?Q?hoi1fx4URJ/RCOLnSM6kiBDvUXIZcpht0uRTTdzHrk7N8MeCE4odrXUwBdqq?=
 =?us-ascii?Q?QSXoasv7zFS7aDZyCMHpVT8l6e/A2tyr+afyRIPSL2J6rPRg0Wd1CioX2fGR?=
 =?us-ascii?Q?d1nysxNo6AaCRD315ZwajkEb/kOKSbfQVfjjIUyq04oNq9TCn5Gjq0RiHkAx?=
 =?us-ascii?Q?/DlrLcJsvRPCUcsde+tf1oflVzMC4+JwBsp0+3cFVOHUepvqAXW0/1RVNB/T?=
 =?us-ascii?Q?PkdUWtQRyVQMQhYEvu/zYDe2FO+RNU5DWTeaC0/uANIk2u5RIW7U6+3nX4ZS?=
 =?us-ascii?Q?AsMCfR3oMw/p4vNjW/YJE4OXrKsq/9gIgkYb8LXetnb8Pnx+85F8X3k2ULsN?=
 =?us-ascii?Q?C4WVWQ94e0tJJrwwVNl6OOn/qj4gPzwfZikudUf03F2lZndfcrMFT4OcIRIr?=
 =?us-ascii?Q?vvOWwmd1kqkUxtv6RQEA90KIDVk/MSkFoZ1R3nkUsHSdDbpNLWzcEdQ80zn4?=
 =?us-ascii?Q?KF3uy1V+aBdUOuiQBHntBtJ5iyErX7/eXYnb+stetBe58ovqwEImOvYp/MlQ?=
 =?us-ascii?Q?C3seS4r6N+2Qqoz8RckuH/bPL9TxEKLqL2XamQLISge02bdeSlLAHbdBXVU1?=
 =?us-ascii?Q?kXT2FdnfjV8NvYtf+jrZ0FdSdI8JPMEYtBnloUnPm5rru/RPtmorGAJw24zI?=
 =?us-ascii?Q?1DRRfCNeC0uu/reTD+tLzX1fRCOO8jo2W7mwIAlsxIA86XoYOgO4KpxOU0FU?=
 =?us-ascii?Q?UclZZPn87om7yN4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/ydTJSDTsBj7Gz2+zkAaXKC9X7i0lfOdEBdQ8RY5DvX8Vv3JZDsrTRUBParJ?=
 =?us-ascii?Q?sYNp7bjf37u2W462qdGLWH9gIhrN7fNFM4X6rgZhD20+PcjhmlucKvq+hFoq?=
 =?us-ascii?Q?v5QtH7EDrxp3aYtNd9sEoEGl1DyM9liruhbg1aKhoeP23aqixy68oXIKFqsC?=
 =?us-ascii?Q?rpBYd3IOEycRYt7pKFPpMsQ6uWmWH3COU+JUVK+CEfybXTJcmnpR7jqtrpMU?=
 =?us-ascii?Q?Mu1UHHzc5ZbKkJht6ZoPi4x7W82QVeg4pQTlUgWnz0s4wsqGDSXJDcwZSBsV?=
 =?us-ascii?Q?D9IvclJ3SVf6pPcMyNxtaALYzJy5n5P96jWdPleexpX3v4b847xYoETR5O5r?=
 =?us-ascii?Q?zFVZdhuxPOSVks9tebYqMhi5UOAU+et5l5MfdPRZwTIIR0Qgzu53BtN6v8Ys?=
 =?us-ascii?Q?qL701bOGpWn+wIC/YXx1LIWhRQjUTwNXOGYKuDHRe9K12WDZ2em+kcMNZhof?=
 =?us-ascii?Q?CFBngMsGN9tDSmPb92XwZtKK7MoO6wZJEo0dQOL8nqh2FvYtqCobD1hIQ4MT?=
 =?us-ascii?Q?C2rq670RQ6yk9A+9uPHSMIfj0vMx3Z3Goy8qXUYP8kMnSbJDlR//cOsphonz?=
 =?us-ascii?Q?qqlpUdqFFKKR/0jGepp0aUIRgLsSGesGNetbUdf6haqZwvP3IKqBCmDUIz1k?=
 =?us-ascii?Q?lM4hYgDBTcCA+WfQjQxTi8O7CMx4AhC7wHqEDJsY0XlPWDuRp18jlHvKYMtb?=
 =?us-ascii?Q?bUkCLwsNnvrTBr+iyOqQXK+y57RF83JeZGbxAp1FVxHSCYRTc8mCO8GbaxBJ?=
 =?us-ascii?Q?Mcx/PBDEYc1ijMTR5d+Xd4GJIbVMcBqNNyK0YvaBGAcGHcTbycBY36RsSz/M?=
 =?us-ascii?Q?EJfzl/4nZrorxIUq2mjuBKUlGQaZh2ENU3GAjpTh3GHE7d/UWhVTv6OdGh9g?=
 =?us-ascii?Q?HqjclcJSruF5/JWJptqhalmbwe8+OyRgbO9Wq38i05dRuNjiZJzf4ONFVnuQ?=
 =?us-ascii?Q?lnbU3gVJEp6HKMq70SaleLubetZwf0yj0+gEUpwV4hbJ5+swtvZmkP/NADSe?=
 =?us-ascii?Q?6Z57LyLs1qacsAKp8aW2Re96QiaEoBbWT82EU3F5GWOA1cvwlD50wERtf9f6?=
 =?us-ascii?Q?t+W7mQxGVpA7e8UlfhAHFLldpYG3FnuZ79TZN1bVJA9Gb/IFXn2CyMNQk8Z1?=
 =?us-ascii?Q?eGmBMjBtlQS9iF5yOCyDLkEUyYpulgF+PZxIarmUWl9ZfU21Yt6zY2WsY/1m?=
 =?us-ascii?Q?lewTeSmPlmlTlRyz1pwyWuLpbP4o9pme3ZyuztwiuGAcpCo1M6185E/dGGMT?=
 =?us-ascii?Q?u5fw3gp3tm5r8zP/rHV7knV3/YI5QuGbuqCQnSSkcB0aREu1CLnaztc800vI?=
 =?us-ascii?Q?/SecAzkIxaaOs/kPy+p8FdQHx8HuzjHbkzl8DTYUb6OompLxcSwZYbdJK6BG?=
 =?us-ascii?Q?9m5DSzI9Ul5znyUxxBS2uLDFzpP6b3IVwOwo0yXr34nxOdkRFcNcciKFH5+H?=
 =?us-ascii?Q?XzPKhEXQj4LmJgCLi26JnBpNMmBOgX55fgOX64YSsY6GYK/C3onqXrOzCa/I?=
 =?us-ascii?Q?PiRli8DX3aMnT4dqeVQq++3RsAHYGWpjZzSvyDakW+1C+ivaJ1Jq8+75UWVi?=
 =?us-ascii?Q?hZNgDMDUQi4Jb8oiXG4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609de6e6-92ee-4d57-8338-08dd7e39772e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 05:25:43.4079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o2iwEPYycSsWfYVtn56XnpOPucSKFnVFn9tUaPSG5JebFntDT1dKNTS2I0LcfLWoO55YDANOIlJJSnRIoxGa+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6680
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

[AMD Official Use Only - AMD Internal Distribution Only]

-----Original Message-----
From: Jesse.zhang@amd.com <jesse.zhang@amd.com>
Sent: Friday, April 18, 2025 7:59 AM
To: igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander=
.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Kamil Koni=
eczny <kamil.konieczny@linux.intel.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd=
.com>; Khatri, Sunil <Sunil.Khatri@amd.com>
Subject: [PATCH i-g-t v2 2/2] lib/amdgpu: Implement priority and secure fla=
gs for user queues

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

This patch adds support for queue priority levels and secure queue creation=
 flags in the user queue interface. The changes include:

1. Extended the amdgpu_ring_context struct to store queue priority

2. Modified amdgpu_user_queue_create() to:
   - Parse and pass through priority flags from context
   - Handle secure queue flag
   - Include flags in queue creation IOCTL calls

The priority levels allow workloads to specify different scheduling priorit=
ies, with HIGH priority restricted to admin-only use. The secure flag enabl=
es creation of queues that can access protected content.

This matches the corresponding libdrm changes in commit fdf384d4b546
("amdgpu: add priority and secure flags for user queues").

add both the conditions under one if (ctxt->secure) (Sunil)

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
Reviewed-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_ip_blocks.h  |  1 +
 lib/amdgpu/amd_user_queue.c | 16 +++++++++++-----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h index =
231098eb8..7d48f9107 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -118,6 +118,7 @@ struct amdgpu_ring_context {
        uint32_t *pm4;          /* data of the packet */
        uint32_t pm4_size;      /* max allocated packet size */
        bool secure;            /* secure or not */
+       uint32_t priority;      /* user queue priority */
Can we move this to the bottom where we have all arguments of the usermode =
queues until this priority is for both user and kernel submissions ? I did =
mention that in previous patch review too, may be you missed that.

regards
Sunil Khatri

        uint64_t bo_mc;         /* GPU address of first buffer */
        uint64_t bo_mc2;        /* GPU address for p4 packet */
diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c inde=
x 0cdd0c4f9..444f9c022 100644
--- a/lib/amdgpu/amd_user_queue.c
+++ b/lib/amdgpu/amd_user_queue.c
@@ -270,7 +270,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                              unsigned int type)
 {
        int r;
-       uint64_t gtt_flags =3D 0;
+       uint64_t gtt_flags =3D 0, queue_flags =3D 0;
        struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
        struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
        struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd; @@ -281,8 +2=
81,14 @@ void amdgpu_user_queue_create(amdgpu_device_handle device_handle, =
struct amdgpu_
                return;
        }

-       if (ctxt->secure)
+       if (ctxt->secure) {
                gtt_flags |=3D AMDGPU_GEM_CREATE_ENCRYPTED;
+               queue_flags |=3D AMDGPU_USERQ_CREATE_FLAGS_QUEUE_SECURE;
+       }
+
+       if (ctxt->priority)
+               queue_flags |=3D ctxt->priority &
+AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK;
+
        r =3D amdgpu_query_uq_fw_area_info(device_handle, AMD_IP_GFX, 0, &c=
txt->info);
        igt_assert_eq(r, 0);

@@ -404,7 +410,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags, &ctxt->queue_=
id);
                igt_assert_eq(r, 0);
                break;

@@ -413,7 +419,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags, &ctxt->queue_=
id);
                igt_assert_eq(r, 0);
                break;

@@ -422,7 +428,7 @@ void amdgpu_user_queue_create(amdgpu_device_handle devi=
ce_handle, struct amdgpu_
                                            ctxt->db_handle, DOORBELL_INDEX=
,
                                            ctxt->queue.mc_addr, USERMODE_Q=
UEUE_SIZE,
                                            ctxt->wptr.mc_addr, ctxt->rptr.=
mc_addr,
-                                           mqd, &ctxt->queue_id);
+                                           mqd, queue_flags, &ctxt->queue_=
id);
                igt_assert_eq(r, 0);
                break;

--
2.25.1

