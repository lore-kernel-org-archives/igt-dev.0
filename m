Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857A0C3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 12:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4494910E7D8;
	Thu, 18 Jul 2024 12:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k36BuHTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDEE10E7D8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 12:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721305274; x=1752841274;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kPz/kHOuFVZqI3RI/XhRKsb95asE7OQH2IYAH0Kczv0=;
 b=k36BuHTB+151/JgNPWXaDnkFZiWhZOA9aqx6hoO96vNZ0HVIJpSYGlPi
 HSeg+X0p72Z1vfmtjH3Ed82LgP/hKqyqhpUUz3uzydQeTuHUxRVS7yV93
 8d9iUrhQzMK0Qk9LQxWBOWlkAR5OpOEd5ws8Y01Bj2CoQejvcFkFsdwBF
 NNwVpIAgV+/mHTlBAqxShiTrfsQ8d/2s+iwUQJBuzKXAJZuhnQfD8tDlp
 bHYOd3EksCuJRg9jxtfqnyF1+SqsRsGyodOLWC2NJtpFrrgzj6zd+TgMh
 hUCp4SDDKsgsnNLLyU2Qtazua+MuOnpLbe0dCkN8CoVZ89q4oqbuh9XAh Q==;
X-CSE-ConnectionGUID: QgteClMuQvadKvy44UvlLA==
X-CSE-MsgGUID: Mr1ZRJ44STeM7sMKlBQpFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29473446"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="29473446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:21:14 -0700
X-CSE-ConnectionGUID: skiKxWvgTw+KKi3XhgqIRA==
X-CSE-MsgGUID: JcXrx9drRmeRUoC95zQ6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="51359458"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 05:21:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 05:21:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 05:21:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 05:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxAcGGZpyz/uwYfyA3v3oVnNNAo4zRGUyPXGN2nPo86OLAaem/5Yg8tj/Hc9oGWOLwlcoLHqvjjjeQgWS4SIbmSsGAITyL1KNhMokLuTupnHI9Kl0JLS6hSjTLWrA2qI5O5bwPLJHvSuzZEpnN/+AIOg3Xia7D2Gj0TwdyhmGAc1XcBJs5ON7kzllOpFfLuJR7LbNg9vz6KCLRUHO26dPKA7bi34KcHQYLfYns4bpFWqe6F7m94B59reoeRhwhybFFVIvi7B/QA0N0mASZ4pfQcsDwsmcOdVi8xHEPfLkB6RqAq2mzULu5FU2a5+oFZ9Utq7hH2KO5jWG0Qil/2hpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UioU/L0/J8q5fY1VvL2WdB96XKp0BatYC5y3d4ykeuc=;
 b=HnRXNSpM0yIsgvoQDa2IcDtt35WRlon+5tvR5lEuZNWCxiCRUFmy9H4Qvw12fkT3C28lqpb6cCnaTMcJBA7D1woSj6UzylnuCd1GMbD0pT5d0DcpgPqZp/xWy1lqIDh63bb7Yrid/53tRZiQgsiPLZyBHDPxn8wgRAwAKblg3OyLmbuKVhEoAYjXYoS7fJeQzMf1fmrh1SI8lSo8OlEGRmQFbyx0pU+eCNKjXsYPphJ14BDTedbLcmNqLJmvnO/OgmaYJSOtYorqUb/zvgg9CPb0D0xmkOekOybmrI8JVHfEm9hMoIfZNmadA0WXm5o4Hdezdf3jYZT/YzrM2JvY8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 12:21:04 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 12:21:03 +0000
Message-ID: <8a51a3ed-1182-49a5-847b-d75183d95341@intel.com>
Date: Thu, 18 Jul 2024 17:50:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 2/5] tests/kms_plane_scaling: Update the multi
 plane scaling function arguments
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
 <20240718111146.665240-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240718111146.665240-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c79f71e-b2db-4d1f-1289-08dca7241769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWVvSmhkb1E1ZjVtMjRiZmJMZS9naXVtVEpvRjlUS2ViTTB5eElFcVhSOVNR?=
 =?utf-8?B?UDAyb09VaTdWakpWSWZNRmhETzBVQzd4elJyVmJDRndjMGt2TnF2T1FRVkdr?=
 =?utf-8?B?NFFIZGFRVmJJcmdiZUVJWFVoK2xNQ1htMUhWZUtlTUpweTNFYzRmdXkvZWVh?=
 =?utf-8?B?NjVESmwzZjhSRGZTeEhBanVGbjZMSkUzaE94NjdXSjBoUGIzYk5yNHpCa0ls?=
 =?utf-8?B?ak9XajFGZzBGOHV1V1hKTlhJVWgxTm5kN1puUEZ2RHBkNjdkTkNobGdNNXhB?=
 =?utf-8?B?UGNaM2pZRXk1WG5BOWpYUzlKdXcyS0Z1dFlZVGdyT2RBTGRlOTdUc1pYYlR2?=
 =?utf-8?B?Ri9jSmJNd0lYSUdFeFJyNEcxLzUyTDVjNVhJR1NXbFIra21PVEMySjdDS0N1?=
 =?utf-8?B?TUVYT2pOVHBtdmlOSGFmamNCSlN3dmJNUzY0WnVuYWNGenZycGFDTmNXNSty?=
 =?utf-8?B?czZhb2hnall0cHJrK2pHSkxaVVBOdTVqU0s0Q1NVL2ZSWGVqbmRtN1BlUXNV?=
 =?utf-8?B?dVJ2U3Ezd2JWNHJLeElWaWVQenRlQ2ZxbHdITlkzazh5OG5UeW9DMEdWOUV1?=
 =?utf-8?B?bUQ2aGJHM0xwRnlIM0kyb0U1bFhSK0lCYzhoWE1NdVkrOTROb21Held6Ykdu?=
 =?utf-8?B?M0Rtc2dQTUVWWGEvQS9MWGFoWG9kaXBSb0k1Ri9VYitBVXJIWnJ2V1JUbXU1?=
 =?utf-8?B?cnNxK3M2U2paRDZMVk9xM0pNU1V6TU9iSlBYSWZFWCtzeXBRa2Voa0N5dWhy?=
 =?utf-8?B?VjgvOE1DeXFPTkhrS2FVaHNEVURZTG5zaTJRUzV3QmlxZnhvWG01ODNpZ05O?=
 =?utf-8?B?Z0RSa1RIREpOWkJKVEJPV0VFczBpckZ5NDJUOE1lU3diWklKSHFLQXZXbmpk?=
 =?utf-8?B?MjhWUDluTHBkR0tYZXIzcWE2SUwyNHZxa0hBR3BrMkVHOEJkN0RQY0ZJc2hM?=
 =?utf-8?B?Ry95TzdmY3FrRjNuUTRNY0pSYkJGbnNPVkM4S1g4T0NwWXJEQjVibjYzYTY5?=
 =?utf-8?B?elhUVWxOWS8ybjRuZDdlTnRWR0NOYUd0Q2MwMDNyVjAxR2lqQmR2QzNKRDRB?=
 =?utf-8?B?UW5uYUs0SHFtVUFUWVpyd29WcWhUdEVScjN6UktsajhQMVE5R0hha3dYVHhq?=
 =?utf-8?B?SjYxR00rUnpBNU5IS1I5SkpPQ0dZRldQcVBDSVhCbEtYM0xaSnpIZk9VbzdB?=
 =?utf-8?B?Rng3VXRDdTljYlpMYjgrY1djVzdTSllRMnJ1Q1NqUVprancwMVVuTFYyb05v?=
 =?utf-8?B?bkE3akw0LzBETkhJT3NITGJvWjFuMUJxMndKT2pXazIvTnFxZGRwTHpaWlAv?=
 =?utf-8?B?N2NCN2h4YWxPajNnZ04zcVdDb3d2a3NsOXFwdzcxeENKT094S0lKTUJBMDVN?=
 =?utf-8?B?Tit6UkdJZXEzeFhXUlF1Q3V3eW1iVVdwQ3FuMmVKallOU2lhOVMzOEV0U0R3?=
 =?utf-8?B?Y3Z1dXFGUjg5UE9DNFlFbU5ybTdXYXZBci9FM3g2RGJxSGVaNjFZcFBVUU5k?=
 =?utf-8?B?UzQ5VHR1RFowbnI3R2R4S3pnUnFYT1lndXhJb3NGMkFMNlZET3ZMT3VOckdu?=
 =?utf-8?B?dXdybjFUQVkvTUY5T09jTFpsRmJ5NlJEMm1vdE5MYTVYWnBLQTJNVHYwdjI3?=
 =?utf-8?B?aWYyV3pPUytvbGI1d0RpUC94YU50MVM3V3NjM05mYy9pYUhWNXFCd2xwY2c3?=
 =?utf-8?B?ZUhKdm5XMkxEL1RKYXdQMDV6MW9hZ1NDYWM3TGZ4cWNHd1ZYN3JtWFJ5Y2dL?=
 =?utf-8?B?M0RQeXZLODNwSnVDTWlXWGdqWEN5UGVQRnIrUUVzVVpkL0pkSFByd1RWWDVS?=
 =?utf-8?B?dUlpZnFxS003bjFpREt2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1d4QlpZSTBKdHhldExsMVNiRitFQ2gwZEVKeVRQbmdqaWFKM3F3bm1rakNX?=
 =?utf-8?B?d2RUK01IQTVxMmYwMTh3L0h5eTlaUmlKSmVFTU5wZEw5N1R3d1JJT202WUpN?=
 =?utf-8?B?dGJqSWlLWDArT3pyWnovM0IrOGN0UVBqakZoNVhSVm1jVTZ4SnA4Ukgzdnpl?=
 =?utf-8?B?SysxQWgzeWllMy9MRVlqTTRDNFFLWm92MVhoZjRhU3Axd2pZNFVIdWVRZ09x?=
 =?utf-8?B?b1ErZmJ2Y3NnNDhPalRJbzlWYU1jV0htUW1Ma2Q5cXkvVVlWWFRjaUZuTjlM?=
 =?utf-8?B?T3ZlZ0lkd0srWWRMK1ZiOXU2Z2JPUUJIb0VjeWNDY1pLSnNPR0E2MkRoN1Ir?=
 =?utf-8?B?cm91bUZ4WWhFVmlJSUpWeW1HcWV5Z2ZPbTV3YVgxRFVlNEJlOFVMQlZCWUZT?=
 =?utf-8?B?YXYvemFGRDI3WUV5bmhzTThBdlIwY2V0MDZ5SUNXeVNDVEpPOWJrbytRQkRo?=
 =?utf-8?B?UUtWalBtaFZpbXUvQ2ttWlpjcE5xam9ubXNYczlqOE1FN0xXcjdkczlPc2VO?=
 =?utf-8?B?aHF0UWg0TkI0VHNocnRTeTN2VThpa0V2TWMxTmRuaXFlKzV0R0w1UUpRODl1?=
 =?utf-8?B?eWxoall5ckhyZTh3RDV3MnRnNnRyUjVNcTVoY0JoU3l2UkZKRmF6K3pGckhG?=
 =?utf-8?B?Y2ZYQmh6dDVJcFdoNjRZMkhMcjJZdGdGV1RrSVUyQkNRcnpRbHpQd3N1N29p?=
 =?utf-8?B?bGdweFZFc01Zb1lmeWFrK0FTbkU4amNlRnlEVGpEVDdvZVNrdHZQWHB5R2lo?=
 =?utf-8?B?enE3SzVHNGFuWEM3SmVOc3luV0s4amYxK0J2NW83UHlaakZMS0UyaW1kUEZU?=
 =?utf-8?B?MVhWQ3Q2cWRVY1c4OHpEcURQRmc1U2l4bGpKQXZxU3VVOVJoV2NpL2NSSUxz?=
 =?utf-8?B?QzJQL0hrR3NZbEU1Qk9EQ09JajZOUWxkZnhYbkVEenlXbk9TeGE3RFUrbWlj?=
 =?utf-8?B?UDE0WklZaDVkb0pnb3orOGFrbFVRbi9UNFZvbU0rNDhUSWs5WE9PcHVtUFRF?=
 =?utf-8?B?QnVOZDRFSHZ2bkNPUERBbmxDU1gySVFMdlRuZ0Z6alpTamF5V0s4cmROOHdv?=
 =?utf-8?B?ZUcvOXUwZzVHcThSRUpPNVlqcmxBWm1LSTRoeXZmNkg1eEIvUTRkSUgrbmJU?=
 =?utf-8?B?UGc0RDdaWXpiQVBzQTg3VThxSDRTVWdtVk85d1Vmd1ovUlNTN01EM2tOOVo1?=
 =?utf-8?B?Q3dVV1BheGxLekJLNzlBQitUempVbnlDWDIrcWhtRE9HekYxTmI5bXdLbGdF?=
 =?utf-8?B?WU5FSXR3dVQycmFDOUFWK25yWHNZYkNYRXJiRkNtRDYvQVdwQ3B2NVJRdFpl?=
 =?utf-8?B?cVpLY1lGM0llTEI4SW1vU2VOYTIrU1doMy81TlNmYnNGZWM1L3BBSHBpRHhs?=
 =?utf-8?B?YlVpWE5COG1UYWxwSmVPaEZDOUs1VkN0SWlkdDRRY3FkK244MktMM0F4aURU?=
 =?utf-8?B?amt0S3JOZ1NZNk43STNzRVViN1Qva1RpbHAzWDFmTzVjTDhrUW9oNWdnNG16?=
 =?utf-8?B?c1Z1MzhNZVQ0NUgrNkVtZmVqZ2VYcFVWUTFmeTluL1kzUDc0SmdKZXF6bmJj?=
 =?utf-8?B?RDZocTVLNHVpV3pOWDVnM2lNTWFVZ285Y1h6eHowQ3d6SGcrb0x2ajRqazFQ?=
 =?utf-8?B?RjduZ0JLck5qMU5jbWVtVTVXKzlrcC91VmRuWm5CcnQzRlFiMjd1MzZ6bUNu?=
 =?utf-8?B?UmtlUTM0S2xIQ3pFeGxKN3NUNWMvQlRLa3dRTnMzZEw2SmJ0NVh3QmtpRUJ2?=
 =?utf-8?B?dno4SkpvcHpvT3piaFdqRnR3eE9nRG53UTY1WWt0QUdoZmpOOG1VUy9QVTEy?=
 =?utf-8?B?eG41dkVuVHhFdi9zb0k3QnpabkpEYjhtSnFzSG9ZZ3RHVWxGdHdEdHVUNmh1?=
 =?utf-8?B?VzJyRDNjUnJkRzdzUzRtQ0F3dkt2dUN5OWZVVXpYVER5V1BocUdicGhDN0c2?=
 =?utf-8?B?Zy9mWUpYQTI2YWp3dHhocjA1SDZHNUdmWFBYL1I2SVVYaVlJT2lkNERPQy80?=
 =?utf-8?B?MUhGUlltQi96OWJ0MXoyMURzbkpBdldSVkQ5dUpTWlc0ZTdpV0lQU2craHhx?=
 =?utf-8?B?UjVZbXloRzhURk85VVpPQUV0bWN2b0ZBMlhzblcrQWFQRDBhTVR1OEcyWWZC?=
 =?utf-8?B?ZVhrODdHSitvanAxSjhMVnhjUXNHaDk1Z1dKS0tqbzVBeVNFSnEzamdTYUxV?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c79f71e-b2db-4d1f-1289-08dca7241769
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 12:21:03.6447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LukVBCoIgCPg7y5HM6uYzFGyNaZvxB72LbMKP6FbrOhHX6uLv8rSXCAJDysMwuPT4t8X2ffMSqI4TYgIxQSnCzUsC4M0T6rh4JuHuW15FO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
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


On 7/18/2024 4:41 PM, Naladala Ramanaidu wrote:
> Update the helper test_planes_scaling_combo to use a scaling_factor
> for plane1 and plane2 instead of explicit width and height parameters.
> This change simplifies the function interfaces and allows for testing
> scenarios, where we need to recalculate the width and height based on
> the display mode. Adjusted all function calls to match new argument
> order.
>
> v2: Update the function arguments (Ankit)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/kms_plane_scaling.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index bd38513ab..8a69aacfd 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -913,19 +913,27 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
>   }
>   
>   static void
> -test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
> -			  enum pipe pipe, igt_output_t *output,
> +test_planes_scaling_combo(data_t *d, double sf_plane1,
> +			  double sf_plane2,
> +			  enum pipe pipe,
> +			  igt_output_t *output,
>   			  enum scaler_combo_test_type test_type)
>   {
>   	igt_display_t *display = &d->display;
>   	drmModeModeInfo *mode;
>   	int n_planes;
> +	int w1, h1, w2, h2;
>   
>   	cleanup_crtc(d);
>   
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> +	w1 = get_width(mode, sf_plane1);
> +	h1 = get_height(mode, sf_plane1);
> +	w2 = get_width(mode, sf_plane2);
> +	h2 = get_height(mode, sf_plane2);
> +
>   	n_planes = display->pipes[pipe].n_planes;
>   	igt_require(n_planes >= 2);
>   
> @@ -1458,14 +1466,12 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   						continue;
>   
>   					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
> -						drmModeModeInfo *mode = igt_output_get_mode(output);
>   
>   						test_planes_scaling_combo(&data,
> -							get_width(mode, scaler_with_2_planes_tests[index].sf_plane1),
> -							get_height(mode, scaler_with_2_planes_tests[index].sf_plane1),
> -							get_width(mode, scaler_with_2_planes_tests[index].sf_plane2),
> -							get_height(mode, scaler_with_2_planes_tests[index].sf_plane2),
> -							pipe, output, scaler_with_2_planes_tests[index].test_type);
> +								scaler_with_2_planes_tests[index].sf_plane1,
> +								scaler_with_2_planes_tests[index].sf_plane2,
> +								pipe, output,
> +								scaler_with_2_planes_tests[index].test_type);
>   					}
>   					break;
>   				}
