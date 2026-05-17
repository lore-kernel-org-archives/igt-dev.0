Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687EECD4851
	for <igt-dev@archiver.kernel.org>; Sun, 17 May 2026 01:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCDF10E05F;
	Sun, 17 May 2026 01:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkSiHcPu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B7E10E05F
 for <igt-dev@lists.freedesktop.org>; Sun, 17 May 2026 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778982771; x=1810518771;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uEzvJIgOKP7IkXDLFxojen1t6Iev1r/6/b8vfMI7NGg=;
 b=CkSiHcPuQTgdOco//WOwMYPydFeucHzLJ8npE+xwCuPqfq8cNdhIhOTB
 /kw/sBW20jsxZA0EtN84w8xte2HDnsU8MikqNChKgTd/RVTbvTDR/y0GB
 eQyuF9rwvSgJ5QmGuEEVp0ltTyM0DtNFsp9A9DOHrjXJ5lvocvKxQJRZc
 OAzWAl1pGkpEqQjUOmx6PWOgC0ip3qqZRIqssXd7ofS2Z0qHv5a9Dp3pu
 wycfV7cRlqMHh57c4yhrXrVe//PvJaaB3LwYWfr8Yn503Nr1Z/xweTb/y
 2pkZ5af7lYjiEFkBCIPeS6mEhqBN0GAC1wTJSJARZIgV4xbQLbxozTI8t w==;
X-CSE-ConnectionGUID: PvdH4JxcQUm5eC1c4/JfcA==
X-CSE-MsgGUID: 9CHuqkcaRQ+oUShIce1l3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79738216"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="79738216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 18:52:50 -0700
X-CSE-ConnectionGUID: Vvg8FdGDQeuGn9rtjyniiQ==
X-CSE-MsgGUID: M6V08AjWREKhjB7rrppKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="243387577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2026 18:52:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 18:52:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 16 May 2026 18:52:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 16 May 2026 18:52:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U9gvd7E3UIuYQ2MpbE50VGEb2VcBtDO/XY0ipe6AKLpFMj9PzXi7+QcNl958szpHojEKPAhhyTkpYSWgZYmVkw817xv9qmVm3sERc6kMwOMqwY+0VTSUbN+bLg3mh/khgI0wLH+U1smCJ4OeR8MVsZ75oYRi+Q7UIBHS+Dl7PpJsRsHGjFh6BGxkDGQOzV8yEmo9OqWQUEubJjyY/cg2BZ9UvO+7FTyeERwIrqbn1OY+JkQPShxhvIq1g0oL84Y3X7+CMQNUtUStEaMrNCcBaNBZtF2kk2cN5Km3yj+NFJKxek9z7m3LnRcz4FovyUvZtzhIsDE5+Vo2abw9pY5Gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AfZLw1hGgi3C3Yfxt/jgUY2Ayj7qhA5ZZFxyUARj2Y=;
 b=LYlBRRDyVmJ88K75hO93B8CnX9TMjbsY02DjuHlFzibx0oC2rp7C4KSUOqJdTO23AF2fh0Y2yV0s+/y6WUvt5zzfBlyIbv5g3CjxraPUdE6MgCW8VIAjo8vvbs1L5UuMFKz5H33cuDw/W4Pqtx3+pfJqukinP8mrXpzB6gAgVbpy17HO4deozJmHCZ+iUq3fJqH/i9V273QmmdhzgzqZkSqyHST8BbZcOsLvnLBx20kcFLhOzZrhTu9HiTGlMiTEibrwRtzM5pjPughZtE3thhhSKa3XgDlI337EfsbDhUDoJ2tHLyHNtjNimuSgPfytQGUylxLkP5292BZulrMetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 01:52:45 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9913.009; Sun, 17 May 2026
 01:52:44 +0000
Message-ID: <e45a3fdf-0aa9-4c7a-b619-e8972f05dc9b@intel.com>
Date: Sun, 17 May 2026 07:22:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: clamp plane src/dst
 to output mode
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260515081427.973496-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260515081427.973496-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0065.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::7) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA7PR11MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd312fd-d877-4f73-be3f-08deb3b6fd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bKJ76/yBJSMPRuUkQbiackSdfaA+iXAxyXCK4wkPXWMx1yS9WGNf9hVf9b9A/eG1uTinPbv3qZcVQTb2ktb1H7N5ngLntyAn2xffexts4ZXMa9tR8qYIyB5Jka1I1lel59Ff9BC57+kCV6u+ttRhPxAxem6vkYNkejqd0lDpBMF77eICFkgA93kaMtR1HI6UPGBnuzvvkINqV6SYHFLK3TTZ/jwCX9hR7TmHr4P9IBNPcu4T83px3BTtYls3FLreCa8c0Hs5zD+ottZyN0lqKtvXAm5G88LrKYLckH7JGXk/qp/P3LC1s49PZ52IpE6nHjeFiAUIo6HZKx3CP7KhRDcUqEYWAyBnVI1r99HV7rNrqNEwfsVKr/Fah9AHjqMmH2/gBt8/70FK56hQQ8mSbUClvNumiiKGZfVU3UGM0v1oYieVj0Eirei51gJeq/AmTypeiCW3YcCgVj/VVK4Bpr+kSGo1V5olsDIXiGCQgf6R9S7eSAGV+1xbv6gzN2yv2FExKl+ziuDMRvJSq5rEZBD2dNrdOjHxNRp84jsTDmvvLE3fhizhd/DhJqA/aLdNB1DiPVH12JEw5liGl6YJbxctYNIb6F5e0aUvACyWnMo+pvngI+JTXN2JmQyKe92WZXyopofsTTG3MhsTPXqrbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm1FcEZXVytjMzNEZE9nTXFVT1k5a0NmMkhBMVJmZFZJRkdKdjViN0JyLzZu?=
 =?utf-8?B?NWtzZmh2VFQwRGdjZ3VUd3FuaG9vYTZCR2VZZ3lzWkpNN0MveXZseFFSOVpT?=
 =?utf-8?B?M2NDaDJIVE1qVElFRVVlbTBScjVsb00wSVg1a0FvZVp6RURObU5VS2xSUXhW?=
 =?utf-8?B?S0Q0QjliUHF2cXY4Smh6Qi91S2YyMU5rNUdDd3pEVnVZNlNvQ1k4SUgwUHZl?=
 =?utf-8?B?QXI1dHZUaVN3ek1BczZ5eG8wMjdqR2NJbG54SEVQMnpnWm5qQ1dqUGw2MHBP?=
 =?utf-8?B?UEkzV1AvS29pOVhodXFSM3prRUVXODhTdmdCUkVWVkszS0tXQStnNks4N3Vj?=
 =?utf-8?B?bmYzcFlZcGljeXkrdDQrRzU2ZHJXYzFHcDVFN2tCNEVsNnh6UjlKVEo3Q2Nz?=
 =?utf-8?B?ci8xVC9yOWpncW9KS3FBQXAvMkk3VkxCOWExVjY4WXE2WVVKOHFodDk4R1Q0?=
 =?utf-8?B?ZUsvcm1QUzZ3QmZWSzdGM0hyN1BoaWdHRFhpQzlWYlpPaEpqckhRSGN5MXRr?=
 =?utf-8?B?djYzN1JCWVh3OG16SzlhdGNqV04vVlBvc05Mem9QZHJaWGtEclNrdWNnMmxN?=
 =?utf-8?B?cDFwWG54QnlPSEEvRGpuMjEzaENCMFRMaFFzeDVmc2QxNWpuMENHTzRxVWlr?=
 =?utf-8?B?RHhYQVJQa2NEcGZQR1NuanpvdkVTRnVlVmZzcUNDNmxyRFdzaTRyTW05cUpC?=
 =?utf-8?B?TWRwam4vazJaQTRZcnk4TjdqUFN1TXlCM296a2RhZWttYkdYM1ozSHJ0ZXIw?=
 =?utf-8?B?UXlGdWNUZmpNWUpSbngyMm5DYkhUKzFVM1RjUTloZjFrZDlFQTlIbk13R0ZS?=
 =?utf-8?B?aGlSTVl0aDZ3RzUzMG5GYldLT2NGem1qZFJwNXl4Ymg4My9zYlpGYTFHQXZ5?=
 =?utf-8?B?ZlBOeC9LbWZXcXhNTWhxRDNEWC9Cdnc0bit2N0Q5WjNkcXliSHRzdFB3dWd1?=
 =?utf-8?B?NWlKMm1nRkV4QW8vWmUvaDJYY3dWalBCcUxDcUtsellDZVBzNXlacHZoRE5u?=
 =?utf-8?B?TWlvSmhpYmZlNkFJWTFQVlR1NklMNC9KWktQd1lSWU03cVNJeUVRUHJXUXoy?=
 =?utf-8?B?RWxzZzdPbEtJc0tjUFplOTNFQjVvak11enBkMDJTUHQ4KzBEQTA3elpGbWJ0?=
 =?utf-8?B?eUFET2FDbjZKZllVaE50WEJ1K2FyRUs3THBWR1doNnhpWUxvdWJzVXEyWkVz?=
 =?utf-8?B?Vk9STWxZNmJwamYxNUZOa3psTjBWWTc0aGl4VlcrM09xcHRMQVQwVGp5YkZu?=
 =?utf-8?B?enprK0g3eXkvdmFpSHZURUxHUTJXWlJrOXNkdXdQRFViYWJMc2dWeTk2LzNa?=
 =?utf-8?B?Y2VTMXk2cDZTUVBMREVVV25aK2VOWUZXNzlNN3ZSUm1wRzBxTUpoVm9KOUxj?=
 =?utf-8?B?cEtOVHpReFEvL0xWTU56WHdTTVloalE2dmZySmNwSE9iZUpaekdZVUNUNm9I?=
 =?utf-8?B?alBGUUNsZVo3MXNucDZ3U1RHc0FOcEpDUFpCdVUyKzcrRDBMdjl1dmxmUXQr?=
 =?utf-8?B?M2FFTGo4SG9XTi84cTZxWkVTS2hKcmcvV2JxbS9FNHBTTnpCSWpEc1dGVWVY?=
 =?utf-8?B?bHlGbHZLOEhhTnJWeHJxRDY5NG1GbUt3NVJ0MVJnd2VUVFpsQ3JVQk04bXdO?=
 =?utf-8?B?czdaWnJaK1NPUFFUazZPZDlMbml2SC9Bc2crNnVHd0VGcnNRalQ1RVIvSnRC?=
 =?utf-8?B?SHdsQnlQZ2tmTUx4b1NuNWtSaStxRUQ4WVlSN2hKa2dkbEZ3cDlaVHMzRXgv?=
 =?utf-8?B?dytOTDhtV24wUEhleXhnL0RzblFYa3lhTlFXK241WlVVS0VmaHdiclRNMjNz?=
 =?utf-8?B?dUJKN0ZsU2pOdmp6ZmwxYllyM1drMjlYNDFzd2JGeko2OWVpK3lGQnh6QVBV?=
 =?utf-8?B?UG00M09VbjIwWXgvU2NOeHhORzJQVHJBZnVIdXBuSFRadGpVVEJmZlZRbWE5?=
 =?utf-8?B?RXdHa1pKVi9pTXFxWGhxR2lZUXRpcTJLM29zdHNZeUprUzVWOVhsR3c3TlAr?=
 =?utf-8?B?SlB2eGd2a084c0ZpQURMbS9XVDg5amFyTWZpejNaOGxLdE1LTGs5Y0gvaW14?=
 =?utf-8?B?ajhIWDlhRDRIWDhKc01MVG1ENnZQMXNXRk1XV1Z6M1pNeGJ6UWxnb3VSd2ZR?=
 =?utf-8?B?UmszaE1oUm9sL3ErYXJUT1NUZFpnMmRkUGVKNG12cGc1d3pXZmhiMGFwNjY1?=
 =?utf-8?B?YWtESzhHcEZSZEV2b1lCQW0zRnZnMEdUd2VjMVFYckZCYU82bmpObDRSTkFj?=
 =?utf-8?B?S05ad25iMHNic09xMFJGNGQwZXVHcGZUS3NtVXczWkVxbkFLTWs4OTJIMTUy?=
 =?utf-8?B?K1FWeEtRVUhmTklNU1I0dW02eVhNSTNQVDUxNmdyVmpXVjExaTBGcHBUS3p0?=
 =?utf-8?Q?NvlgRxGMQakK3u74bpAM+HGxxB09w1e/VQJUY?=
X-Exchange-RoutingPolicyChecked: nMNOsVkczzavtEog72M7ugQo85VMiArzJ/+Jt2fR7byVNlE4afJ9rIYakiWv5kFUbU/aiLTN1diw+YWtLijvc9n7NQvD6w/f9iqTmMmkTFjaaZ9x987j1wOXXu0FX7Yx0/cMrHpB3/jpt92jK/BiXCVbeNRzvs/s+vohzDVKD3iPHdLiYP4bC1SO9es0R0fbaVqNNe4Q2sV4XGI1Yky5KhCu361eBSDY6Hb0Rfd0c9zsP0ecaQe9uQEq9wY7NzozbA2uAqq5MmCWBbSAntFsbg/TzLOgTSo9Nt32U7jWhSo0lRCTYvmaNcGjJX6+PQH1H02NOMH3pGcPuTEnY6/dWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd312fd-d877-4f73-be3f-08deb3b6fd19
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 01:52:44.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hkIAtLJtqxFYFm9pfZMFAbX+GyWs9EtPG4nhyAeb5InLja1JNCxScnMuulZGQnlda4mz4OgGHW0otSyah01pskG6ULcWFGJ/h0lgT4ztHL9y5L2flsCKyhhNdkRXimw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9594
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

Hi Suraj,

On 15-05-2026 13:44, Suraj Kandpal wrote:
> create_fbs() sizes the shared red/green FBs to the max width and
> height across all connected outputs. With panels of differing native
> resolutions (e.g. 3504x2190 and 3840x2160), the FB ends up larger than
> at least one panel in some dimension. igt_plane_set_fb() resets the
> plane src and dst rectangles to the full FB size, so subsequent
> commits submit a source rect that exceeds the CRTC active area and
> atomic check rejects them with -EINVAL before HDCP authentication can
> start.
> 
> Clamp the plane source (igt_fb_set_size) and destination
> (igt_plane_set_size) to the output's current mode after every
> igt_plane_set_fb() in modeset_with_fb(), test_cp_enable(),
> test_cp_disable() and test_mst_cp_disable().
> 
> Tested-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
The changes LGTM. This patch needs a rebase after the below series is 
merged.
https://patchwork.freedesktop.org/series/166566/

Regards,
Santhosh>   tests/kms_content_protection.c | 29 
++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index c59441f11..d1b7c5863 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -264,16 +264,22 @@ static void modeset_with_fb(igt_output_t *output,
>   	igt_display_t *display = &data.display;
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
> +	int width, height;
>   
>   	mode = igt_output_get_mode(output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +	igt_fb_set_size(&data.red, primary, width, height);
> +	igt_plane_set_size(primary, width, height);
>   
>   	igt_display_commit2(display, commit_style);
>   
>   	igt_plane_set_fb(primary, &data.green);
> +	igt_fb_set_size(&data.green, primary, width, height);
> +	igt_plane_set_size(primary, width, height);
>   
>   	/* Wait for Flip completion before starting the HDCP authentication */
>   	commit_display_and_wait_for_flip(commit_style);
> @@ -284,6 +290,8 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -302,7 +310,12 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
>   	ret = wait_for_prop_value(output, CP_ENABLED,
>   				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
>   	if (ret) {
> +		mode = igt_output_get_mode(output);
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
>   		igt_plane_set_fb(primary, &data.green);
> +		igt_plane_set_size(primary, width, height);
> +		igt_fb_set_size(&data.green, primary, width, height);
>   		igt_display_commit2(display, commit_style);
>   	}
>   
> @@ -315,13 +328,20 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   	int count;
>   	u64 val;
>   
>   	for (count = 0; count < valid_outputs; count++) {
>   		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
> +		mode = igt_output_get_mode(hdcp_mst_output[count]);
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
>   		igt_plane_set_fb(primary, &data.red);
> +		igt_fb_set_size(&data.red, primary, width, height);
> +		igt_plane_set_size(primary, width, height);
>   		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
>   					  CP_UNDESIRED);
>   	}
> @@ -343,10 +363,15 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   {
>   	igt_display_t *display = &data.display;
>   	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int width, height;
>   	bool ret;
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> +	mode = igt_output_get_mode(output);
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>   	/*
>   	 * Even on HDCP enable failed scenario, IGT should exit leaving the
>   	 * "content protection" at "UNDESIRED".
> @@ -354,6 +379,8 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
>   	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
>   				  CP_UNDESIRED);
>   	igt_plane_set_fb(primary, &data.red);
> +	igt_plane_set_size(primary, width, height);
> +	igt_fb_set_size(&data.red, primary, width, height);
>   	igt_display_commit2(display, commit_style);
>   
>   	/* Wait for HDCP to be disabled, before crtc off */

