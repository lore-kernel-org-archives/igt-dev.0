Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E2DF532EE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 08:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C4710E5B1;
	Tue, 24 Mar 2026 08:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RGS3SPPa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0579C10E5FE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774340436; x=1805876436;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qROaz+boiwAw+bFhMmmWgPEd7RZFrrULCkUXishZsug=;
 b=RGS3SPPan7bOtcpHz0CiG6i7IgJJq+rSbDoQ7Q6EajK5IEzkiSGG0pAz
 d3GYaUpM13mkKLj/6OH3JWIGc/sTJgnGhXkVZgBNecxn4DJjycgA1paXz
 9DNGwguCz8hwKQ+DTPVFS0BsulbZTzEk+KfTlrVSEZTSzEZbY7EtkEgON
 fka6CdzYB0HUKTS9IO9bfx5dPxHbxJ8N0Opl6ZxizDASjkbhYEaT/UPOS
 PSouQQ2c4W78xOD+1Ft9xOo3++6Xm4TGRV1sD6KpapaP1W4GezvI8+1M7
 7vxuk4ROFWEv2fsAAkZmGIq+6+Z723hMbCiu3s51dSzmeo1NZgYXlbyKT Q==;
X-CSE-ConnectionGUID: boYQ8taUTIarmsu771GUCA==
X-CSE-MsgGUID: 0tuwtGJNS/2e55imam9kbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85658116"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="85658116"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:19:28 -0700
X-CSE-ConnectionGUID: qiTFScRuQ2Ouc2YAZrYZcw==
X-CSE-MsgGUID: Boza3KKISymKcR/gsNUwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="247924316"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:19:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:19:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 01:19:26 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:19:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQQowyVMRCyTzuHfwj3dT6ZNDbOpdxdUgGwzVxBV+hPC4mCT1PzeEAme8vqi/sw9dReFBqjKb8yxqg9WBcJL1yHZzaof1jsGge2hIWk0wAxUVfJbma53CgqEViIpapmL4N5lnS6SKpqyEjTNultPaLrJ+dJZTCNJ5CrD/l7w9MZYRiWPSn7x1B+/l/x11q3Gstk78ZDWIrUZi8tfG5spuANq0MUJDi0OmVfFqE3df5Ks6LNdkDWk6o2DbKRDX3ibg1MgnyxIpfGQrAVxYFPCn5vR7XH1tlHUvmrcHC/RqY/WQnh6QT648Ykg6a8xewz5Zwa9GeI5GOPSGs6pf+udhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9BsWImJz0a7HVoRlGc2bZlTiK2OyBC84NWCDsI6ois=;
 b=Epg6ui4XRh95MDAEOlv9ekG78denaL61N4nTNiX137R9ZuOpWxt86lNJlgPUIz5J5FWH+JJmISoIPbV24EzOVwUOH/w69tn1/EaTM7NELyV7+GVqpH5d6OtkvhyQLpHiUMcF2NuF8RlaFvWwY3sw0EKKoCig5z/LA8eSb2RABwlKZ9MRApW/YnfrbiZg8ArpFaDYL5nw465ifEnW1bmNp1T+z38LHZEAT5nEeimkLN6v02eLzoh0PEQXvTgOxZlu0pn8lvJAFjv8Z8LCMi6sHNv/9bUxbByuaOJzdPVD2udTs0qdliCIy716Uw8nhmVIT+HLMZfPZTkub8gvZSDPCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:19:21 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 08:19:21 +0000
Message-ID: <066263f2-9ff2-48ef-8193-eed5b320a4dc@intel.com>
Date: Tue, 24 Mar 2026 13:49:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 20/49] lib/unigraf: Initial Unigraf support
To: <igt-dev@lists.freedesktop.org>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-20-a01dffc3b0cb@bootlin.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260316-unigraf-integration-v9-20-a01dffc3b0cb@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::15) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c6c4f1-82ff-499c-3c09-08de897e0d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 2T6Qak2ee21JBVPSUNzUpd9zdc7jvoq9SYKjScK1qg8rXcVo0TOYXgHAPyzcAo+qALjSF6RmdDPb+R7KfvM0WByLFwNJJmDR/64YcN0Fb9nZk9nrF07x1kcBE+YouJm44/4Vb4nm3EbICN01RNmp2HTGp9FYfxkGzWUZ7gRXtwBnQGGM3CIAYkyd9ifyZx4koY/Ku7qn8lNrzHZlqd5/zoZw36iDTyPJ+1ka/XLdFFx/EqKGVeQQEHaowCIYv6V1bvtaLija3ikZ3b9/UU3LI2jTMdswj6j1I8ZNgnblXRi9/Q+xa8Xv1hesnIR4Ev7jLkPlGq8JxcXkfug0pt7y/kS7Un75ETAZffEMnz8KS8LOUjAaqJ0PBVMvOfazZbSdwH5t9C4Zeew6EivVQOLXfoJGJ6n4eCN6XK64S51gINuUPOzczU3RKysvheOzJ8liTUjGZQv/xrNpGIh12TD3Clxdg9+LOGnmXwmtBZgLypGVN8gsDBHv66G2JHel87cHzriCmsPRgLHKjyCgZYDhaAvA2WwLJiRZVsCEk4MPIwQk5UNV0N0PoJ7IQVIiEDDo4ksHoe/49opgAC56b1qcNKgofr2PFcRv9x+/oCx61uXjz3mZTVsh1Igynpewv3GkbtpjQWj9Lba5peODxg/oXxWnp/SB2nMmG12aU+dDNJMJLumhcF/IdlUQ+eh6Secf8/D5/dpeDbNQ+kOe4NwaJ1wjL2zbaQ/KGi55NQXsw0Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTRHdnhlNmRPVWhPTDMycW8xMHRpbE9iSnIvM29BNklXNjZ0dVRVSkVRdktK?=
 =?utf-8?B?STFyVjNJWkNVZ0pHR1lSMzgvTjhVL0VLL3lpd0FNU1ZzK3BsVlVYcmszdjhR?=
 =?utf-8?B?aFREa3dwSUpndjJxcjBVWXJPVEdlZGNKcHFJeTM4azkvVnBQeDJMamJRbTBC?=
 =?utf-8?B?RUhrL0tqVHVLNTZma3Y3MEpEQzYzSWc3WTBiQ3JLMGR5c1dXWE9wUkphWldu?=
 =?utf-8?B?S1ZJUWlYVjV1S1pZN1hwWnFORS9jems2VFBTQTZyL0lvZXBxa0I5NzFwb2ZF?=
 =?utf-8?B?dTRsTEJ1aEs3LzFjTU5NWkl2bFdKOXk5ZzFGckhGS29CYWxuNzRRRm1MOXVC?=
 =?utf-8?B?OGJRVzdpWlVxaWpQTHkzZitYbldnSkFUVW9Iek9naXJqTzNuQnd5Zm1aaGl4?=
 =?utf-8?B?c1dyYWRZOXcrWmJmb2N4cmtsS0JSS0lPazBUR21NQkVkU2l1L25xOVlGWG85?=
 =?utf-8?B?NUV3NTdtVktwZm1UNnNkdXdtaWp5TTlFQ3NwWHZOV0ozSjdxQVMzZ094SFZL?=
 =?utf-8?B?UkQ2OThpSUJKQVN3Z2xUSTNhUUdnUGh2K3pLcUVjVHlWWkFmTTZUMXJSSmYv?=
 =?utf-8?B?ZndsSVp1c01NRnFHR2xLQ1crMnhpa1Nmc2sxczJCdUJ0WC8wd011V1JSREdk?=
 =?utf-8?B?OWw3aHBueWhpZis0dlVkNUlaMHFCc0hQZEJqcmJ5MzIxWkV4TTlES29RYjh0?=
 =?utf-8?B?dmtIQ0trS1dtZ3lXZ3FkQ2Q0N1V2bUNzODZMeTRXREJIWXNjRFRmRlowRFh1?=
 =?utf-8?B?VzBZb3U4bUFDdC9TZlFuZ2tVbGVvOEZHZHIzaUxzazR2QytkbVRyZ3VhRDZN?=
 =?utf-8?B?bUhIQlpFbVRBL1AwN3FJRkFiSThnSUJUM2Z0S2tNTVhOMzNPS2o0VDZLNXlh?=
 =?utf-8?B?ZGgwWjFlU3VGZG5mZzRqazE0NXEwWXJrMmVWb0M5dG44WnRyQkVaOXkweTRn?=
 =?utf-8?B?Q1pGUVJpcGJUaU1VbW0wbEFOQmxIKzk2Wm1vRVUvbkZ4ZzZBYktiZUUrSHFX?=
 =?utf-8?B?Zlo5V3VHY2tVNlFnOE1zTldVSVpOY3FBOFBMVjZiUTNXeTNFVkJUMHlaYWVZ?=
 =?utf-8?B?cThiOGFTT0lxbjdnZEhxMEd3WVc4ckxNcFdWcHU2d2lGVUtkcERwK1o2ZEVm?=
 =?utf-8?B?MFJHcy9uNTNlQWp5bFVHcjA0N1o3ZkJsamRMRjkvYW1KNENJMk1UZnNtVGE4?=
 =?utf-8?B?dnl5NFkyRjJDT2YybktQQ29vdm1xZWRxd0txR3lSbEptb29RUHFYVUNzSW93?=
 =?utf-8?B?ZmczSVIwdHEyYjVaUzc1Mjc3RHczdjNFbE9LMnVhVHRvNElvQ2E3Ync2eVpr?=
 =?utf-8?B?ZnhzSUl5NERidnFnRWhERWwrL3puY0hCZ1hOV2h2TDlvYTdkQndRdVNiL0R6?=
 =?utf-8?B?UlhhTWZYVnNEQUlTODBVQTUvNFk3RkJnTXgzRHlMVkZ0SzF5QTRPUDhXVHgw?=
 =?utf-8?B?YmdzSkp3bFYxdVBZUGxyTGtPTmVXdmp2SVlGR05LTHJmZlE1Y3dERjZPY01o?=
 =?utf-8?B?RDBOZUErZG1STEl6QzIzaVBLQ2dNTVFaVHlmbWlYM0FpTlc0aU5PODhTSE92?=
 =?utf-8?B?VDd1YW5hMmNZTlUxaWU1RmZYMHpFUWNyQjljU21hLy9EOTBBdVR0ZDArblRp?=
 =?utf-8?B?UHVYbzlLdGMycDJJZjdqOVZPMHFzbjBZdkFiWjRJYXZ5RUgyZnRYTTU4WjlL?=
 =?utf-8?B?aWNIZ056YkRLd2YzbTQvUDRlWldHVEFqYW5PMmFuNVVqdHY3bTVYUGs5TS80?=
 =?utf-8?B?eWNZMzhSdmpaS20yZFhoL0dKNTVPVWErUUlOUmhueXRrS2NDZHpyRzRMRnBD?=
 =?utf-8?B?VXpjOUd0N3h5RmtDVHBBM0svYlIvTzZJSVY0YjMwM3dZSTRtNS9jZUE3K2tM?=
 =?utf-8?B?OG12T1RFSTFzSEJSRFlDNFIxRWlPdTVKaFZqWG1qelRyYzJFdXdDdUhNV20y?=
 =?utf-8?B?eFNidVhzaUtBSi9TUFdmMndLZWFjTVF4YkZHZzU3WElZMlVhdnBEZGVvZVRL?=
 =?utf-8?B?RDRNcVhSV0pGRXhxNzlvU3NXMlcrYW9Yc1g2SWlIdmRSL0xhb3FjR3I5RElr?=
 =?utf-8?B?Vk04aFZOb3B4WnJ0cjhzQzhFQjBua1FMWDMwMVdqa0Ftc1gwbzBXWnJETlR4?=
 =?utf-8?B?djBKU3lqcGo2SGNadnRwRE5TVFVCRWVReU9xbnZzdVlFRUFiaHVZZDc1MGpZ?=
 =?utf-8?B?YTdISDZoSmVNaXlKOW5IbUdpNGQvVWxGVEQ2NXdVNGhGdkFIbWMxQ21YbFlr?=
 =?utf-8?B?VWVuN3RVc2JjOVRsZStJbWZucGFUQ1JmQTdSektXcU0wZHh1VXU5cS9qMHRa?=
 =?utf-8?B?RDRBR0w1bmVxMzJ6RjZZNWdEZnhxMlY4a2k0Rk4rNFhHRzN0RDVKRDFhb29E?=
 =?utf-8?Q?FfJvzu1rS4O8UnYs=3D?=
X-Exchange-RoutingPolicyChecked: Riw2uriRaxtCkdnLLVtAyDlXV9jx6Lq6g15y+3AlTiYBWFc640fsscd3Fr7IWej4Xcm3F0x28SkHNXNNtlDHG63z3c1B9VJCoKaLTjET0nFuUyCjD1U56ljQnHLJFnKLr8CowrSVdAjACYvEIsCyX51CYl5l7KE17G2EYzAJhWGSlUhTKG2YQgweddatiPDJZoJWw9dusnB4AfSopSa0CVJBXHrbH2E1FFjytZdAqERiSr7prEFjtLOHO2XlwCTOA2xOAHH0JiBJ1qd8ZAjeFcgM0Tb4RDTEmuZ5TdMPT/pEpD8ogWozRGbrRIbsOL4Hp1N6jTQ6vAqtlq15FOhllw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c6c4f1-82ff-499c-3c09-08de897e0d2e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 08:19:21.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajyn6qtBnkdYVZ8Ia5FVIJTePYavP1bQRl8DwBnBAY0qGFgF8vJaJE0+1vBVE9qAzOCW0erxF0Ozd2YxzHvMVMVAQeG8rgKVGG17grvqhVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
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

Hi Louis Chauvet,

On 3/16/2026 9:47 PM, Louis Chauvet wrote:
> This introduce the basic boilerplate to connect to a unigraf device.
>
> This integration currently only supports one device opened to simplify
> its usage and cleanup.
>
> The functions unigraf_open_device and unigraf_require_device will register
> a handler to do proper cleanup on IGT exit.
>
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/meson.build       |  10 +++++
>   lib/unigraf/unigraf.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/unigraf/unigraf.h |  43 ++++++++++++++++++
>   meson.build           |  14 ++++++
>   4 files changed, 187 insertions(+)
>
> diff --git a/lib/meson.build b/lib/meson.build
> index cd03e8f634e4..268f3238cbfa 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -151,6 +151,13 @@ lib_deps = [
>   	zlib
>   ]
>   
> +if libtsi.found()
> +	lib_deps += libtsi
> +	lib_sources += [
> +		'unigraf/unigraf.c'
> +	]
> +endif
> +
>   if libdrm_nouveau.found()
>   	lib_deps += libdrm_nouveau
>   	lib_sources += [
> @@ -232,6 +239,9 @@ endif
>   if chamelium.found()
>   	lib_deps += chamelium
>   	lib_sources += [ 'igt_chamelium.c', 'igt_chamelium_stream.c' ]
> +endif
> +
> +if chamelium.found() or libtsi.found()
>   	lib_sources += 'monitor_edids/monitor_edids_helper.c'
>   endif
>   
> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
> new file mode 100644
> index 000000000000..df18ab178e16
> --- /dev/null
> +++ b/lib/unigraf/unigraf.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#include "igt_core.h"
> +#include <stdint.h>
> +
> +#include "unigraf.h"
> +#include "TSI.h"
> +#include "TSI_types.h"
> +
> +#define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
> +
> +static TSI_HANDLE unigraf_device;
> +static char *unigraf_default_edid;
> +static char *unigraf_connector_name;
> +
> +static void unigraf_close_device(void)
> +{
> +	if (!unigraf_device)
> +		return;
> +
> +	unigraf_debug("Closing...\n");
> +	unigraf_assert(TSIX_DEV_CloseDevice(unigraf_device));
> +	TSI_Clean();
> +	unigraf_device = NULL;
> +	free(unigraf_default_edid);
> +	free(unigraf_connector_name);
> +}
> +
> +/**
> + * unigraf_exit_handler - Handle the exit signal and clean up unigraf resources.
> + * @sig: The signal number received.
> + *
> + * This function is called when the program receives an exit signal. It ensures
> + * that all unigraf resources are properly cleaned up by calling unigraf_deinit
> + * for each open instance.
> + */
> +static void unigraf_exit_handler(int sig)
> +{
> +	unigraf_close_device();
> +}

Unigraf sub test is Success. But the exit handler still asserts due to 
invalid argument during unigraf_close_device().

Subtest unigraf-connect-edid: SUCCESS (43.200s)
(unigraf_connectivity:5625) igt_core-DEBUG: Exiting with status code 0
(unigraf_connectivity:5625) unigraf/unigraf-DEBUG: TSI:0x6010b136c010: 
Closing...
(unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Test assertion 
failure function unigraf_close_device, file ../lib/unigraf/unigraf.c:97:
(unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Failed assertion: 
false
(unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: Last errno: 22, 
Invalid argument
(unigraf_connectivity:5625) unigraf/unigraf-CRITICAL: unigraf error: -50 
(Invalid device handle.)
Stack trace:
   #0 ../lib/igt_core.c:2108 __igt_fail_assert()
   #1 ../lib/unigraf/unigraf.c:97 unigraf_exit_handler()
   #2 ../lib/igt_core.c:2994 igt_atexit_handler()
   #3 ./stdlib/exit.c:119 __run_exit_handlers()
   #4 [exit+0x1e]
   #5 ../lib/igt_core.c:2419 igt_exit()
   #6 [main+0x32]
   #7 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
   #8 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #9 [_start+0x25]

> +
> +static void unigraf_init(void)
> +{
> +	int ret;
> +
> +	unigraf_debug("Initialize unigraf...\n");
> +	ret = TSI_Init(TSI_CURRENT_VERSION);
> +	unigraf_assert(ret);
> +	igt_install_exit_handler(unigraf_exit_handler);
> +}
> +
> +/**
> + * unigraf_device_count() - Return the number of scanned devices
> + *
> + * Must be called after a unigraf_rescan_devices().
> + */
> +static unsigned int unigraf_device_count(void)
> +{
> +	return unigraf_assert(TSIX_DEV_GetDeviceCount());
> +}
> +
> +/**
> + * unigraf_open_device() - Search and open a device.
> + * @drm_fd: File descriptor of the currently used drm device
> + *
> + * Returns: true if a device was found and initialized, otherwise false.
> + *
> + * This function searches for a compatible device and opens it.
> + */
> +bool unigraf_open_device(int drm_fd)
> +{
> +	TSI_RESULT r;
> +	int device_count;
> +	int chosen_device = 0;
> +	int chosen_role = 0;
> +	int chosen_input = 0;
> +
> +	assert(igt_can_fail());
> +
> +	if (unigraf_device)
> +		return true;
> +
> +	unigraf_init();
> +
> +	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
> +
> +	device_count = unigraf_device_count();
> +	if (device_count < 1) {
> +		unigraf_debug("No device found.\n");
> +		return false;
> +	}
> +
> +	unigraf_device = TSIX_DEV_OpenDevice(chosen_device, &r);
> +	unigraf_assert(r);
> +	igt_assert(unigraf_device);
> +	unigraf_debug("Successfully opened the unigraf device %d.\n", chosen_device);
> +
> +	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
> +	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
> +	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
> +
> +	return true;
> +}
> +
> +/**
> + * unigraf_require_device() - Search and open a device.
> + * @drm_fd: File descriptor of the currently used drm device
> + *
> + * This is a shorthand to reduce test boilerplate when a unigraf device must be present.
> + */
> +void unigraf_require_device(int drm_fd)
> +{
> +	igt_require(unigraf_open_device(drm_fd));
> +}
> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
> new file mode 100644
> index 000000000000..c08ce62894c5
> --- /dev/null
> +++ b/lib/unigraf/unigraf.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
> +
> +#ifndef UNIGRAF_H
> +#define UNIGRAF_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +/**
> + * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
> + * @result: libTSI return value to check
> + *
> + * This macro checks the return value of a libTSI function call. If the return value indicates an
> + * error, it retrieves a detailed error message and asserts with that message.
> + * If retrieving the error description fails, it asserts with a generic error message.
> + */
> +#define unigraf_assert(result)									\
> +({												\
> +	char msg[256];										\
> +	TSI_RESULT __r = (result);								\
> +	if (__r < TSI_SUCCESS) {								\
> +		TSI_RESULT __r2 = TSI_MISC_GetErrorDescription(__r, msg, sizeof(msg));		\
> +		if (__r2 < TSI_SUCCESS)								\
> +			igt_assert_f(false,							\
> +				     "unigraf error: %d (get error description failed: %d)\n",	\
> +				     __r, __r2);						\
> +		else										\
> +			igt_assert_f(false, "unigraf error: %d (%s)\n", __r, msg);		\
> +	}											\
> +	(__r);											\
> +})
> +
> +bool unigraf_open_device(int drm_fd);
> +
> +void unigraf_require_device(int drm_fd);
> +
> +#endif // UNIGRAF_H
> diff --git a/meson.build b/meson.build
> index 57849648a377..127abbf62024 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -166,6 +166,12 @@ libpci = dependency('libpci', required : true)
>   libudev = dependency('libudev', required : true)
>   glib = dependency('glib-2.0', required : true)
>   
> +libtsi = cc.find_library('TSI', required : false)
> +
> +if libtsi.found()
> +	config.set('HAVE_UNIGRAF', 1)
> +endif
> +
>   xmlrpc = dependency('xmlrpc', required : false)
>   xmlrpc_util = dependency('xmlrpc_util', required : false)
>   xmlrpc_client = dependency('xmlrpc_client', required : false)
> @@ -290,6 +296,7 @@ amdgpudir = join_paths(libexecdir, 'amdgpu')
>   msmdir = join_paths(libexecdir, 'msm')
>   panfrostdir = join_paths(libexecdir, 'panfrost')
>   panthordir = join_paths(libexecdir, 'panthor')
> +unigrafdir = join_paths(libexecdir, 'unigraf')
>   v3ddir = join_paths(libexecdir, 'v3d')
>   vc4dir = join_paths(libexecdir, 'vc4')
>   vkmsdir = join_paths(libexecdir, 'vkms')
> @@ -372,6 +379,12 @@ if get_option('use_rpath')
>   		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
>   	endforeach
>   	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
> +
> +	unigraf_rpathdir = '$ORIGIN'
> +	foreach p : unigrafdir.split('/')
> +		unigraf_rpathdir = join_paths(unigraf_rpathdir, '..')
> +	endforeach
> +	unigraf_rpathdir = join_paths(unigraf_rpathdir, libdir)
>   else
>   	bindir_rpathdir = ''
>   	libexecdir_rpathdir = ''
> @@ -383,6 +396,7 @@ else
>   	vc4_rpathdir = ''
>   	vkms_rpathdir = ''
>   	vmwgfx_rpathdir = ''
> +	unigraf_rpathdir = ''
>   endif
>   
>   build_testplan = get_option('testplan')
>
