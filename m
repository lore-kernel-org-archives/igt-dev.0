Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D639C88E4D
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 11:49:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2907510E38D;
	Fri, 11 Sep 2026 11:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGRP3mY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217EE10E38D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789127351; x=1820663351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=twnCzJL+LR5r9uY8pz5JbJGjvYcJA4Luc5jY6iIo2Aw=;
 b=hGRP3mY+fscAMzXEFCaI2Q1+TR8Cjb9CjL1ZN8SK++sVfWhHuqZ/CT+J
 WjKfHmQ1S5pVYTr593XInOEQTJ+sPr8JQeWQLMOXOIdr42U+dKm52LWyh
 5qnLHt3Z2PpTE2Wl7Z1CggO1eS8tICqVB0gZjSqKtoR/luQQvZNtFxwiw
 YEQzba+nq9qUXkbrW7iddxuzGwTH8DUKzHaKZ75VkEd9+rHyrjp8d/6i0
 +y+PcTOyD5+opUxRU2OoKZQZUzcUyPWTz7ujTMq//+xdRBTkXMDsy7IUf
 FFnRPFZpHy5g/0PTRELan43KcELk3NzuTfNwrMS5WH2/DytoVyvrf714h A==;
X-CSE-ConnectionGUID: 7jZ9H8I+SIO01rPjTDdexQ==
X-CSE-MsgGUID: h0/X4c+2TpGv67e3gzGoNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99959"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208,217";a="99959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:49:10 -0700
X-CSE-ConnectionGUID: 8/mcHIxdRO+r6ImdellUqw==
X-CSE-MsgGUID: qMliyLc4T9qJktbexzkPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208,217";a="275660620"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 04:49:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:49:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 04:49:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 04:49:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBgtob/z+2p1lVCOla85BIoXfyhMiKxc20riZAa5pYG4/xGqoXuyyP9uMHGMdiXAxxHIqHWz+hUk1RSR7jhe8AZb7MyPiyQgPvCMp287c5yeM82Vh3WI/srvpCemnliRFR+icfQDaOS+T4h7PtZgelABZPZAoOmKj9MiCz3kKfVHWwKhG2UKDeTSl/xiIemSnekiWzhHcgNzrJJXz4K1eAHLswaXrFapONAPngpP5PEwvIP43XnN8V0xqFTbYlPEsurPgqh6Klv2FTsJYtfbXtdnyJbmKh0fb7SMhhUjOX63GxoP222wtU7C7EZ6BN139U2QpSP9io6zVF1GVxM+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIXhiayrjNIFsnUXpLmWwg/DmWBZqC0VoSRH2OjnQLk=;
 b=yD+qqhNczGS+B5EjOR/6obo6AUKnfmFOsYN/bIrHG0QVfVLI5IS6fUQRM8GGLibPRE+C3WTX/wIG8voIzk+jMwHLhJOxCnXJn8k52Dp33lWSGv+91SwxQA6Fv5pVPCoRYVKf8oZV9Bo1oDyoaJ6igsPNWsFDYf2hkrnabshumQKMjuriGaWh2Qwae8BCyBY19gNrkr4AfCnvWSvB0GGumcbSZ0vx/FiNWWf2zs2fimBpeW5Mw9vO9P4TbI3FNucJN09YS2JT0/UuERAQbaZT4pGhSV7EEgDf/Nqc2T/XAaNgHM1Al1RKqkgychitYKbbWVkCieHd7IC29FC6BDtlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 11:49:05 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 11:49:05 +0000
Content-Type: multipart/alternative;
 boundary="------------1s7xctbp6SC1xJk62ckiC6YZ"
Message-ID: <999a0436-4e30-425b-b8df-62b752615b87@intel.com>
Date: Fri, 11 Sep 2026 17:18:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] lib/igt_drm_netlink: add set_error_threshold
 command support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: b3330f48-e9ff-4bd5-4675-08df0ffaae2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003|6133799003|8096899003;
X-Microsoft-Antispam-Message-Info: FmYw+plFfCnjcGe0jO3z8jgFiNWO3CJGwkM8SyJvDkbSQNkjv/ea10kwN2Vb33DEqED7/aPJMSLNjnnU+3jplrx0MupUil4Sv46OSfp6ad7w8vYxLhX+nv68DAsizVh2lNDFl2fGF/G+90ToQOM1mbBvwLxIwRXnR0Ry+lJJYT70xwdGDLLeiDsOEUuK1DlzVhqU8MHI71HUClHTgx68KeW9PDtwJVV11hpAHqEruLx7L0GjueCgXLqpUgP8CZCtOKf6+LTLLmqQ9qFAErp2C5E+qiLyhrcp41uhYeSidSpUQ5SKmDkTJFlUqUU0IPSStMmWapHWy2+4L8Yh+B2TZsVE0MfSzsNEm5Bw7yq+iMotaMzH0bWU5hn4a7PhEtX1pg47ZR7rbDVbNd1AVjy1ytHosa4/eiAB8Jyq5WjUllVuI1Pi0hO9lyugHCsNUtji7GYA78l+PXZSGUD6GVjftbyKOMdAUk3If0HxYsFsK9S1j/vjLI3Gnj9demXV/6ubv6xLJ0RepX8OUGxi45y4ayfpFM5q9lGO9CVj6xhvSHz+WZ1TX9gydNTb5BHoYaDf2rl/atXwOsrRqfp9vj19hZNJ5DLN+V06lQn7NH54Y7Kwap9Ergoz/sAK26//BAaIMnOF2V+PWTugUdpRltPEhNS9oDswMd9w4nF43OoRKzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTJsVW9lNzhoTXY5R1J5Yk91bmwzWllyL1Z4T0RYa0M0T24xMlNyemhzQk9m?=
 =?utf-8?B?b3FkY0M5UzI4dUtGVm9tM25RRTRLWG5OWjFHRE1Xd1QwYW1jYjRCTngyc1BQ?=
 =?utf-8?B?R084cGNRMWRHRlY2bTNkS0ZiS3VnM2Jqc2pNKzM5T21aeDI3TFNMZkJneHpO?=
 =?utf-8?B?WFZxNWN5SnFVamRDTGFlMGhXZzVXcDVMZUdRSDR1eG5oMGZnRkJCb3dWRi96?=
 =?utf-8?B?bjhOTHVBQzM1anA0YXNMbHdrM2ZtMHhFNDlmOTQ4Y3kzanZER3lka0pOYkpR?=
 =?utf-8?B?OEtRdkQ2OFFMOUtrVHlDcUxNYy8rUjZYbGJrTURqUGVtSm5ZdkZ4ajBaK0c3?=
 =?utf-8?B?UFNQRnlXVEdhQVNCOFUwa0JxTUk5bnZjMnhIZTdsWEd0dWJ0WERIUVVDcG9q?=
 =?utf-8?B?bWlORzFUeE5ENCtnM0w3SUdhQTFjdjBXb20xQTJkY1MxRXJPQmZxR1hUOHE5?=
 =?utf-8?B?Tm95YnlGWDVMVXFIYnd3bWNBU0J1ZitiWGVMa3NGMjB6UGkzTnY2N2JaR2xI?=
 =?utf-8?B?MW9INXE4NmEvcVZ2anJJNWVmNTZrellzMUVCaXU0ODBXWmpzWTZaMmhGSGVP?=
 =?utf-8?B?bzZ6d25xdUxUVHR5bWJjd1RlU2U4c2JVMmZVOEtvQ1RFTlh6MmZodi9CdjJs?=
 =?utf-8?B?MTQ2Q1FDWE14bWhxUGRWcENCVVpBREh1RUpobDhRWGZSdmRpMFFCMC9mclRT?=
 =?utf-8?B?NytrVm1DemFPcUM0UCtuWWRNLzlpeXNoY1J3aVljZml2MndiaTkwQjBpbk1Y?=
 =?utf-8?B?b3hIUUxBaHVRQzhyVG5zU3lkTk1QUG43aUNQN0hLTzlGa3psUnNDMVdCUVBw?=
 =?utf-8?B?MjVRbjNkeG1YQlEwSWxPV3EyZHhyT2FUUlVGdU81d2dFTTdGdGEyMGtRZVFV?=
 =?utf-8?B?T01VVVVaUWFtTjg1MTI1WjJQZmFHQm5oczNjT3dadkc3aUdtbUFyZUl2OWk5?=
 =?utf-8?B?dlFCeVZUMXBnRG5qSVR6ZCtDcm9EQUU4am5KOVhDK2JUL2hLd0I2cFF1T2J2?=
 =?utf-8?B?YVNGZHdhb1FZa2tDMDQxWWxmKzdXdy9MNjdaWFRhRm9ZbXQwTGJPSytzcnl0?=
 =?utf-8?B?Wks5ZjQyU0RiaVpYWXNJaUY2K1pnb2FueFRMZXAxK0ZjUXZ4dDVra1pBTHVs?=
 =?utf-8?B?T0Zsc3VheVI4bGpmUW5XVWRaNWtjSDluS1dMbStjZEFCYUZKUlhiVFluQzBk?=
 =?utf-8?B?YzlQeXdUbS91aGQ5MmZTY0VjTXAyUUFZS3VHdjd2OUtTdHFGbGtVc3hMY0pr?=
 =?utf-8?B?N29VQ0dHSHlOVDhObjFUMHAzWk85aVBVTGU2RzIxUXpZVm03Mi94Rkl4Qi9v?=
 =?utf-8?B?NmdoOHl4ZHppK0p4OFpvRlVwbGh2WXNsREZRN1VVQVI0eDNEL2VhYTczMy9F?=
 =?utf-8?B?UU1qcmJNUU9TeGtDVVJLMkpZQkpNYlQ4YjdwbUtpS1FnWnRwdDJ6U0NlZWJF?=
 =?utf-8?B?NXlxWkJIOHNRd05ZK1hFV2JoeEpkRE1RdDZqdlAxSHJuVTlkR1pucHFLTFVr?=
 =?utf-8?B?akZseVNkMExOV0M4VVFJblpNVWJldFhLVVJ1RUtjN3diV212QmN1dURRT0oy?=
 =?utf-8?B?Y3hmL3FtTVc2OUhOSWZlT1RrYXk2b2hiTCtqS0N4ZWRsQUl6OGlZTHZSOWsw?=
 =?utf-8?B?SURQRXVjTkJMMzB3NU9FOTRsaHdPWUJoL2syTzM3UEpvelZjQktmcUNBWTFy?=
 =?utf-8?B?eWg4b0oyT2pjMWdJWVUrMHdkQ1RmSGN3MTJrU1pMa2M0UkJ2Zk5vRnNhaTl1?=
 =?utf-8?B?OFYrRmVzNWs4WkdMbU9VcnBKTVBCL1ZvN29hZ0hmYkRZaTBMNG5JemFCWFNr?=
 =?utf-8?B?aEczMXRRRU44TURlOVZOWm1CcnNieXBsQlQxaWJOdXNBcnpjWlNHM2ZLRmxK?=
 =?utf-8?B?MHlWVS9oTk1IeVIrd2ZVanVaUWYzUFpYQmpiNkx4R3ZYRkdJM3pYekMveEJu?=
 =?utf-8?B?NlpoZzVWa0pxYjVTeXZZZTJkVWhUeEhicTNOdCs0QVRqMDBabjZrK2xqZkZp?=
 =?utf-8?B?TEU4ejhyS3JxZnBXOWtSdmpUQXpKYVpDaUh5WWZPcHQ3SUxJZUZSdElKc28r?=
 =?utf-8?B?V3NVOWJLR2wyVmVCdlBrSjV3SHYwMjArekNLczdvNHliNldjLy84UXpXUEdL?=
 =?utf-8?B?UzhCTE93RWluOWVZaW5XTm01bTNpOUhwVkM0aGF5TlNRVFJpeVFJU3VZVXhE?=
 =?utf-8?B?aGUwSW45YTdWUVlYcUptQ3UrMVdtTWlKT1l1VHg5WjRHRG5heVhvQm1JMGlw?=
 =?utf-8?B?QlNqSzVxTmtRMXhuYTc2a3lyZVZ6RWZxTjd2dTVQYkwvSWpqMWNuc2R1Qkxj?=
 =?utf-8?B?RlA3TndzUmhsSktEWHgxWkxkL2ZBWEFrRmdFeGJuaENxanVyTUw3ekcxV3p5?=
 =?utf-8?Q?8X9FQ+LUc+dbFHhE=3D?=
X-Exchange-RoutingPolicyChecked: Sb8L/7RbuszRCc7/PSjSLkmMSN3YmpcP1foM4V0p32BWXQr9xpqlYs5Eo6JlWAwMc5c3pRLKJewsnlyZl9NX1epiraJqjL8fGImgNHONPCAeWeEKcDIBThH9gHd0Eh01h+TtCCxIlk84jaE4Ye0tkvOjJPgn63AwQRF6vZCqBSoTURO6XsBWxI4e7+kAACmWtCJ3wjqFqWM0fwAXqQP48QhSFLZp3wYM2ZLdNjf4PVb9aHvbDYgGN5AOI1c0dtQJyU40vRhgyciV49E9Y+JGIHA21lJuGYwuBANOMs72q9rk5u9CEEy+ThQoHsD10bvO4mFA0pU73FdyZ3oRNH40Qw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3330f48-e9ff-4bd5-4675-08df0ffaae2f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:49:05.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cf3J00NcDIsURdnefLXR33ggAPftB++sSF6rG1GdJwYJ12MNcRgjfCCu2fOZcgEbKX841wiFnItZV5tO9nrU6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
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

--------------1s7xctbp6SC1xJk62ckiC6YZ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ravi,

On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
> Add support for SET_ERROR_THRESHOLD to set the custom error threshold
> value
>
> Cc: Purkait Soham<soham.purkait@intel.com>
> Cc: Riana Tauro<riana.tauro@intel.com>
> Cc: Gupta Anshuman<anshuman.gupta@intel.com>
> Cc: Jadav Raag<raag.jadav@intel.com>
> Cc: Nilawar Badal<badal.nilawar@intel.com>
> Cc: Koujalagi Mallesh<mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi<harish.chegondi@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri<ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Marked this command as response not required
> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>     Jani & Kamil)
> ---
>   lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_drm_netlink.h |  1 +
>   2 files changed, 40 insertions(+)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index 1be7d4361..c0e3aff9b 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -26,6 +26,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
>   	gnlh = nlmsg_data(nlh);
>   
>   	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> +		break;
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>   		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>   
> @@ -201,6 +203,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>   	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>   	case DRM_RAS_CMD_GET_ERROR_COUNTER:
>   		ctx->response_required = true;
> +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
>   		ret = nla_put_u32(msg,
>   				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>   				  ctx->node_id);
> @@ -216,6 +219,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
>   			nlmsg_free(msg);
>   			return ret;
>   		}
> +
> +		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {

For this command, better to validate it in the 
"igt_drm_netlink_set_error_threshold" with error_threshold as a 
parameter in the same function.

Thanks, Soham
> +			ret = nla_put_u32(msg,
> +					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +					  ctx->error_threshold);
> +			if (ret < 0) {
> +				nlmsg_free(msg);
> +				return ret;
> +			}
> +		}
>   		break;
>   	default:
>   		nlmsg_free(msg);
> @@ -314,6 +327,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
>   		return -EINVAL;
>   	}
>   
> +	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &&
> +	    (ctx->error_threshold < 1 || ctx->error_threshold > 16)) {
> +		igt_warn("Invalid error_threshold (%u) provided. "
> +			 "error_threshold should be >= 1 and <= 16.\n",
> +			 ctx->error_threshold);
> +		return -EINVAL;
> +	}
> +
>   	return 0;
>   }
>   
> @@ -368,3 +389,21 @@ int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
>   
>   	return 0;
>   }
> +
> +int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> +	if (ret < 0)
> +		return ret;
> +
> +	igt_debug("Set error threshold: node_id=%u error_id=%u threshold=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_threshold);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index 89ef58243..9376e3dee 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -26,6 +26,7 @@ void igt_drm_netlink_cleanup(struct app_context *ctx);
>   int igt_drm_netlink_init(struct app_context *ctx);
>   int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>   int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
> +int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   
--------------1s7xctbp6SC1xJk62ckiC6YZ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Ravi,</p>
    <div class="moz-cite-prefix">On 03-09-2026 13:03, Ravi Kishore
      Koppuravuri wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">Add support for SET_ERROR_THRESHOLD to set the custom error threshold
value

Cc: Purkait Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
Cc: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
Cc: Gupta Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Jadav Raag <a class="moz-txt-link-rfc2396E" href="mailto:raag.jadav@intel.com">&lt;raag.jadav@intel.com&gt;</a>
Cc: Nilawar Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
Cc: Koujalagi Mallesh <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
Cc: Harish Chegondi <a class="moz-txt-link-rfc2396E" href="mailto:harish.chegondi@intel.com">&lt;harish.chegondi@intel.com&gt;</a>
Signed-off-by: Ravi Kishore Koppuravuri <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kishore.koppuravuri@intel.com">&lt;ravi.kishore.koppuravuri@intel.com&gt;</a>
---
v2:Marked this command as response not required
v4:Renamed the library functions with prefix &quot;igt_drm_netlink_*&quot; (Nikula
   Jani &amp; Kamil)
---
 lib/igt_drm_netlink.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_drm_netlink.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
index 1be7d4361..c0e3aff9b 100644
--- a/lib/igt_drm_netlink.c
+++ b/lib/igt_drm_netlink.c
@@ -26,6 +26,8 @@ static int ras_command_cb(struct nl_msg *msg, void *arg)
 	gnlh = nlmsg_data(nlh);
 
 	switch (gnlh-&gt;cmd) {
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
+		break;
 	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
 		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
 
@@ -201,6 +203,7 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
 	case DRM_RAS_CMD_GET_ERROR_COUNTER:
 		ctx-&gt;response_required = true;
+	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
 		ret = nla_put_u32(msg,
 				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
 				  ctx-&gt;node_id);
@@ -216,6 +219,16 @@ static int send_command(struct app_context *ctx, uint8_t cmd)
 			nlmsg_free(msg);
 			return ret;
 		}
+
+		if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD) {</pre>
    </blockquote>
    <p>For this command, better to validate it in the
      &quot;igt_drm_netlink_set_error_threshold&quot; with&nbsp;<span style="white-space: pre-wrap">error_threshold as a parameter in the same function.</span></p>
    <span style="white-space: pre-wrap">Thanks,
Soham</span>
    <blockquote type="cite" cite="mid:20260903073335.339540-7-ravi.kishore.koppuravuri@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			ret = nla_put_u32(msg,
+					  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
+					  ctx-&gt;error_threshold);
+			if (ret &lt; 0) {
+				nlmsg_free(msg);
+				return ret;
+			}
+		}
 		break;
 	default:
 		nlmsg_free(msg);
@@ -314,6 +327,14 @@ static int validate_inputs(struct app_context *ctx, uint8_t cmd)
 		return -EINVAL;
 	}
 
+	if (cmd == DRM_RAS_CMD_SET_ERROR_THRESHOLD &amp;&amp;
+	    (ctx-&gt;error_threshold &lt; 1 || ctx-&gt;error_threshold &gt; 16)) {
+		igt_warn(&quot;Invalid error_threshold (%u) provided. &quot;
+			 &quot;error_threshold should be &gt;= 1 and &lt;= 16.\n&quot;,
+			 ctx-&gt;error_threshold);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -368,3 +389,21 @@ int igt_drm_netlink_get_error_threshold(struct app_context *ctx)
 
 	return 0;
 }
+
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx)
+{
+	int ret;
+
+	ret = validate_inputs(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	ret = send_command(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
+	if (ret &lt; 0)
+		return ret;
+
+	igt_debug(&quot;Set error threshold: node_id=%u error_id=%u threshold=%u\n&quot;,
+		  ctx-&gt;node_id, ctx-&gt;error_id, ctx-&gt;error_threshold);
+
+	return 0;
+}
diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
index 89ef58243..9376e3dee 100644
--- a/lib/igt_drm_netlink.h
+++ b/lib/igt_drm_netlink.h
@@ -26,6 +26,7 @@ void igt_drm_netlink_cleanup(struct app_context *ctx);
 int igt_drm_netlink_init(struct app_context *ctx);
 int igt_drm_netlink_get_error_counter(struct app_context *ctx);
 int igt_drm_netlink_get_error_threshold(struct app_context *ctx);
+int igt_drm_netlink_set_error_threshold(struct app_context *ctx);
 
 #endif /* IGT_DRM_NETLINK_H */
 
</pre>
    </blockquote>
  </body>
</html>

--------------1s7xctbp6SC1xJk62ckiC6YZ--
