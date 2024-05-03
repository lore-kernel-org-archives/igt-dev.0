Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D01C25B5C
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 13:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FDE11220F;
	Fri,  3 May 2024 13:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHb+6Uvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26A511220F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714744770; x=1746280770;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uaRFybA3VYaxO8az/A7lDJuThW2x65N38UtFNVWaiyo=;
 b=jHb+6UvrRDJkGz4yunI6NWP6e7Wta3ZQ6oDm/8EnSOtoHLUhGsP2bcpp
 f74h27XzeKHAv3CF/A+rvV3dokf07kqF21aIB59RA/KdQ94nXfoaUiDwA
 XMGtITLikGSHW4DHf5vlVHivMn1/ZMvcdxp61Ap1sMRCm9ic0v8PAtrEU
 8u3V2FBcEoB/P5Sk7xCKnjlsGclcTVZk3mmqu0rC0cH+Zi3TzKkK2unxu
 NOdNRb4klSafksRb7IRY8L4VI4oEC61wRi2pkyPbOo56lAhl+P9idHfcs
 1v/CvkeAwaqbluJc7HErgzwTSVJq6+h9vFwUgB/m6ufWW87pvnyHtaKrq g==;
X-CSE-ConnectionGUID: qtNpkcSUQ5CnEDrxXZI7HQ==
X-CSE-MsgGUID: 1x3Bu3zhSdOQRrx+o4oQ3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10769244"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="10769244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:59:30 -0700
X-CSE-ConnectionGUID: M5PRSD+UQOCQfAY7xyykaw==
X-CSE-MsgGUID: 0uD3msCCSOmQum8UxTPFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; d="scan'208";a="27864065"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 06:59:29 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 06:59:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 06:59:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 06:59:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uftk1TPhnImJWghLu4xbnOGzpK+u1dKgXhiDf4RUvy280q0ne5zkTIIoUVj3NJFLkuLIhhk3aPvfgMtRFi5XdirHOvDFt5Gawcxyoa5LOBHwAA/aqWLrWx3JBI04WBk+jDCsMtdoMqFk2UAwxxtdETD1vnje/f7yzSxumOslhsLHO3gjpiP7LTJJgP6pU7pr+iYf2WZ0Yu80xIFbIJ/Nh+Y3OsyARtlgf5iIon2ajNKxe9cIbt8I8Jxi4nNIhwJrOi/E3oMGAm2I32/q8uZxCBI6EcjOB+4h+Xb8fsAZ/r7jM8D/hRmIA+wktiCYtHAajnL2zcwiRjHrRTaQBTQfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozf6nFpRzLd88Q8+j57LRj/yKgEFb/RzQdKbiLtpTW4=;
 b=KodCVXKXB0/TISTyDv9+wddBWTDwTs2jQ4uF1wjbnHn3BuMaYnq2zzL6Jhw4dmnb60+zEV/FkRrifoIPHt0ZQD9kLvyMv/TLErcchhRo0130w4UtAX2OiO9F3hsGfW9wSpK1EPk2ncO9xwr7c2JY6SlRjUhnLBhAlBRB5w9egKGObU0qmy04AzPaLSpBgqtB5LG0BILghYMyT9SatXIeaLBj5A0eCrpgCaapF0JLI0jhPzNTyzaJPO9lvgvefIUqFqg9yTgrKvXYlR6l7VfaSMpVsaa03XiS3UBw3oP7+VroNtiFLPA/JFZkR0H4dhUI5Os/lAlxVlHs1BBPGaMydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5005.namprd11.prod.outlook.com (2603:10b6:a03:2d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.31; Fri, 3 May
 2024 13:59:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9365:d8e6:4e8d:8711%6]) with mapi id 15.20.7519.031; Fri, 3 May 2024
 13:59:25 +0000
Date: Fri, 3 May 2024 08:59:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Tvrtko Ursulin <tursulin@igalia.com>, <igt-dev@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.keonig@amd.com>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle amdgpu memory stats
Message-ID: <uugo25uxiwufmjj34aeu5uck4hwdblofastgb5nyjski7uafje@xgyeatkrzzm2>
References: <20240503123731.9509-1-tursulin@igalia.com>
 <crxjiae2z6mwas6rxq7cwsekfw26llg5oqlk5motte6qt2kb33@6j6plap5mxu6>
 <c7272ce2-1932-447f-8455-94f66a313401@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7272ce2-1932-447f-8455-94f66a313401@igalia.com>
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e9928d-de27-4e45-21b7-08dc6b793dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FBq36X/mdhHXaXL539sAryHMk6O1G1m9nN4U1mvCGa/BLaJxeky5hq/vkM?=
 =?iso-8859-1?Q?5EZmidXBiP66fODs2vU7PV+qmPeoD2lwEo9MS70YWZCHKXUwaD5hFNbG/E?=
 =?iso-8859-1?Q?Vboia2pHxniOEOvgrwFvgG5eKJcpkYgaxrMf/5H47g+lI+2Oc+3nzTP5Ek?=
 =?iso-8859-1?Q?Pq/CBdZnK09LaTHtX5yFGWaT5MsEOUmduyKwElmhr9aqw2QSLZ0sm2FL7M?=
 =?iso-8859-1?Q?Ln4nlTNjeBJfTiOEpmS1a1qSLFR1pwRw5x3dFA4LCCcMQOV3PVM8c2khxJ?=
 =?iso-8859-1?Q?lPyrYkEVbLLfLpB6UNTxaBXpslnkTNobKmnRoVRRIIj+RXzZTsZWbCEVTC?=
 =?iso-8859-1?Q?TNOm4U0Ulqg2iIWc/tL/HxWD2NcixfYpx767JPWHu2i86g/U4xOreYlzZ4?=
 =?iso-8859-1?Q?nCMy+/O2eM6rDByaYGuPRAAAmi1dZ1dHknyXFDifKmhzvktNEQH0ku3IQC?=
 =?iso-8859-1?Q?ziLej3MItPbAcTaC+cEqESjL6FFzILntLckKMLlIhEAuVzQueRyCB7z4ij?=
 =?iso-8859-1?Q?6bfGxR9CPYwYIuCVs+kRGbYiOCmVyLgNhCWhp0TX19R18LtcyeVd38Mbe3?=
 =?iso-8859-1?Q?AlgQQAQelUG5GgC+7M1YNLMOqarWGsx9VaEbHN/nAExRFkzTHTHgpSGBQc?=
 =?iso-8859-1?Q?8nk3Q1iPmpKsf72sEEGWhwWFKbSuTuAsh1AuDAq0a9xV4RpFgUUgIsUZk9?=
 =?iso-8859-1?Q?oIy9q86LCVsamorhgxPY9kLrHhkqUrmFjvsfBrFOPoZ6875t20NhxXgkCT?=
 =?iso-8859-1?Q?K6ep8QjPFkDtUgAuPdpu0wZ54j/k5IgPrtqikhVdqpVMVBpnJ14r5PXJty?=
 =?iso-8859-1?Q?cF8ygOxhAjEde7tJadWmCCI+qWVuH628ZOCPxhiVDSjAR2LBiHmhbCQTTs?=
 =?iso-8859-1?Q?wdkueEtDs5PH93vhxjLOTTeB8u3yIxL3j2ThMeYacTaHs6rIbryKs6gmXR?=
 =?iso-8859-1?Q?qjnIr8OiMBXhsMP7gpQV5xfPlCv3LRaALdBOVByjI7rLNbvbljbuIgYcNK?=
 =?iso-8859-1?Q?8syZuUB/JPvNTZnoSoSaZLy6Mqa6MppauEsYew9SsKSI02dyyYmMJiSGMY?=
 =?iso-8859-1?Q?qDbK7sShhvi3NvfgykPGSIp3dZXH4arx/6SgQHofWl7KBIckP5t7c/CB4x?=
 =?iso-8859-1?Q?+0LGrSgbvSLi/PDxGM+6niJLpGtEktPCHb8PVGPGM5qIT0b1HZIOvmVpiU?=
 =?iso-8859-1?Q?qVeUK5QcoiC57Un8htCc1JnZ/91HcGAwN6V/EFmnFZsjJoBR3F2ya9/xYN?=
 =?iso-8859-1?Q?hfuLtzlFP8ZDRkK7OUlEatLXsfw9fNF629bcFrq+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dZB0FVEWaEOnkosIJrz3bhqv/gg1llbc7cNvdiKSIl+apipQF9OiHpCndz?=
 =?iso-8859-1?Q?z5Bld+pWNgkDofvYo/tjBUsFleWZGh72CRRi4m2AA8HHDZ6el6BG0dI5IH?=
 =?iso-8859-1?Q?u1Nw0hT9wd6L5sG06dlTTUQusDJOrcHC8CQSoGpDMZ5e+yOMff3PClXFS+?=
 =?iso-8859-1?Q?/GmGImTvZKdFjjzZ7sM7vwV55Upx35m/ywLMMInTQiZmeZ8UqOP9RZRaDj?=
 =?iso-8859-1?Q?LvFpGZcKjNPBfHKzM1+dFq0wSKrLsUNbR3kfcanvKdNjPq+agnfqAwxB7i?=
 =?iso-8859-1?Q?b1XrJmYHEU4Qsgcj2pMFkaVW8ldpMee94iLyOszPw+fIDx0Vl3q5IPjX/n?=
 =?iso-8859-1?Q?OPwAvVW4nC4CdSGJSYYuCqhTBYMrkbYJSCSVQPKEKw1gPU5tdgL7LivZ+6?=
 =?iso-8859-1?Q?wlwzRR77tk+TK4wA+kmW4GkrHSSUidKugY86n155p7pnTVsOgrvZGnQJvK?=
 =?iso-8859-1?Q?HR49OdmLyfTpsz7ARjJRsNYfT1/KqDlsyjFHN7LP2y6ltYmcRBMhSaczgO?=
 =?iso-8859-1?Q?Kh6PuIBLKxsLTgHze59vcdckKf/bYcAtsM/vczzjClk3s/pM5b3EtTbHg2?=
 =?iso-8859-1?Q?FLuJEcTbwxhtdIIVKFQSR9L+hlr0yi9JBxtyigrEGS+v4BsUSRbjSqC5mu?=
 =?iso-8859-1?Q?qXKaaGSpRmxuL9kwqDkfL/uEPf8xWftShemXy3bdf1B2S4GHHR3GplL9Rv?=
 =?iso-8859-1?Q?dsw27TuVJiC1rvC9f+D1yuvurDyMeS5Qg6usMVkqHMjQB1uGuMZ78TP9R/?=
 =?iso-8859-1?Q?i2ClTOhyXk2YdfminMQdIQU7ui5J+1YV02j99DVtFDAB/dbbsMZewjpyPd?=
 =?iso-8859-1?Q?q9UMxgcQLMANFtH/f8OYvTnL6Y3DjpAe+dP9SIIlF1vQyAZQSnf1pLBl0K?=
 =?iso-8859-1?Q?ZmzwAMggdTMsmJhPyPgEY0uTOBrVrkjZKUkPBcBWkyXpNwptsl5+D+uUs4?=
 =?iso-8859-1?Q?YQP5SHu1AIqmICsnbO8/I9yIpDsgAItNt+zo9LT7TV6PGKrMMbmWmjrD/b?=
 =?iso-8859-1?Q?ESVus/hOY5BFDCGH0gn/De2lQC49klMJwoEwe0LK62sqvYFv4YPaXX5BeH?=
 =?iso-8859-1?Q?sG5m7LpvkiiHPMB0uQzpuaFpEBOCjUlczBDyfScZP1KOWMNC2uRj7Y4wNw?=
 =?iso-8859-1?Q?Zg61HkgqxMru6JNge6zfR8JI21UWJ1oFg9NTcTQjKB/VrWCu2rtN2S7ppj?=
 =?iso-8859-1?Q?kR7gA2tFIwE4Tw6Wbh3rF1rovnF66GRzGWCcEkuBrpnzIEiiU33rWbYjpg?=
 =?iso-8859-1?Q?BMsunQGqP2e/5u9jv+UtqQc9bAgvUH7//k3GdwvC2g349WqjkLQiZKygkq?=
 =?iso-8859-1?Q?8sxAE+B9nLmpFaPuO5Bm1hXHsmM36GBGYT0A3ia79Eo1mu4PYw2GVQPdeG?=
 =?iso-8859-1?Q?BKf7PdLtIVHIlNPL0ro3bH1B+exOvEzaRyZWDoXysRswq16djdTN30h3ei?=
 =?iso-8859-1?Q?dKrcDvlmCop844DDFO9CitLIt81Re+1TfMvBrXA1CXj8NmU2cCctjJIkJk?=
 =?iso-8859-1?Q?Z/aVNGs9J07kNE3iWkpp9I2nQo9wjYZRvi6wdBT8xMlF6F5yBQkksc54u9?=
 =?iso-8859-1?Q?72oWrgIOICuKQMCoBEL3xBI3GLEM4akgp7jwDv0tXh/egAZFR5oydSjZRp?=
 =?iso-8859-1?Q?00Ipig63/qoZ77roBBkWkPELsxtGmajh2AMQMj4KFHQSYwgnKvSFuXuw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e9928d-de27-4e45-21b7-08dc6b793dfa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 13:59:25.5878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9AcXYS3Hvj/Vml1lEIUtPOXJTpynfCPeN0SMQck9O34X8ktDiHoxXxWp46K0OlLjeOojwbBkn1mkX9uhomtM4Lc86DkpvxeacGDDQgtgo3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5005
X-OriginatorOrg: intel.com
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

On Fri, May 03, 2024 at 02:53:20PM GMT, Tvrtko Ursulin wrote:
>
>On 03/05/2024 14:32, Lucas De Marchi wrote:
>>On Fri, May 03, 2024 at 01:37:31PM GMT, Tvrtko Ursulin wrote:
>>>From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>>Code so far only handles the clients using the common DRM helper.
>>>
>>>Handle the amdgpu driver which uses a slightly different set of 
>>>keys. More
>>>specifically, outputs drm-memory-<region> instead of drm-total-<region>.
>>>
>>>With this added gputop starts showing total memory usage for amdgpu.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>Cc: Alex Deucher <alexander.deucher@amd.com>
>>>Cc: Christian König <christian.keonig@amd.com>
>>>Cc: Rob Clark <robdclark@chromium.org>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>lib/igt_drm_fdinfo.c | 4 ++++
>>>1 file changed, 4 insertions(+)
>>>
>>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>index cab677df29a9..89992f1477ec 100644
>>>--- a/lib/igt_drm_fdinfo.c
>>>+++ b/lib/igt_drm_fdinfo.c
>>>@@ -262,6 +262,10 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>*fd, struct drm_client_fdinfo *info,
>>>            idx = parse_region(l, info, strlen("drm-total-"),
>>>                       region_map, region_entries, &val);
>>>            UPDATE_REGION(idx, total, val);
>>>+        } else if (!strncmp(l, "drm-memory-", 11)) {
>>>+            idx = parse_region(l, info, strlen("drm-memory-"),
>>>+                       region_map, region_entries, &val);
>>>+            UPDATE_REGION(idx, total, val);
>>
>>are they the same thing? Should we clarify the doc that a driver can't
>>use both drm-memory- and drm-total-?
>>
>>     - drm-memory-<region>: <uint> [KiB|MiB]
>>     Each possible memory type which can be used to store buffer 
>>objects by the     GPU in question shall be given a stable and 
>>unique name to be returned as the     string here.  The name 
>>"memory" is reserved to refer to normal system memory.
>>     Value shall reflect the amount of storage currently consumed by 
>>the buffer     objects belong to this client, in the respective 
>>memory region.
>>     Default unit shall be bytes with optional unit specifiers of 
>>'KiB' or 'MiB'     indicating kibi- or mebi-bytes.
>>     - drm-total-<region>: <uint> [KiB|MiB]
>>
>>     The total size of buffers that including shared and private memory.
>>
>>If they are the same and the total field can just be re-used,
>
>Yep exactly, they are the same in practice so we are lucky that we are 
>able to fix it still. See: https://lore.kernel.org/amd-gfx/CADnq5_NAO_Ao0EJTO=MJxvR-KJkF1WCwKGV-9ami7qQdzf029w@mail.gmail.com/T/#t 
>(I forgot to CC dri-devel when posting the patch.)
>
>>
>>
>>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Thanks! Are you okay if I put this in first since it collides with 
>your fdinfo rework?

yes, should be easy to update whatever lands first.

Lucas De Marchi

>
>Although I will wait for the drm-usage-stats.rst patch to get approved 
>first.
>
>Regards,
>
>Tvrtko
>
>>Lucas De Marchi
>>
>>>        } else if (!strncmp(l, "drm-shared-", 11)) {
>>>            idx = parse_region(l, info, strlen("drm-shared-"),
>>>                       region_map, region_entries, &val);
>>>-- 
>>>2.44.0
>>>
