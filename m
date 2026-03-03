Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A997EB364A
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 01:30:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82DA10E071;
	Tue,  3 Mar 2026 01:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nr1oQgUb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115DF10E071
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 01:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772501442; x=1804037442;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LcAHzLcKIljilMx2gfqyjP5gXpgBquJj1Ho69ntlLag=;
 b=Nr1oQgUb/Kg9sSUTLhDsVoQiNq1ov/SFNzVyHFwqntXA+8P9Ykm++Jbr
 p7sNB9uEhG4v+xrhK5XXbky32Wvt7qJg8LYNZieV7V4/GWVH6ypy8+OR0
 ViKfLUTNgmw/Bhlotr/0ft3uuUL0DzgBgnVH8O3vmcqotKBuwWEuQORrb
 DgKJU7s1woJkBm0NShzWRSmkPYzhp6jciQAd0neb/FfAXLNQJN/RfpdEs
 NfV9q0U9qN+huhujPwhDq4XM4YUIU2gojGiaABrmhNge1tY+2PU60R1Vy
 dbCrmip99n+dm8ovGCAjRiE2V/X7spV7vyQDaHzprs5uU5+s50dvtNdj9 A==;
X-CSE-ConnectionGUID: ojR1eQOYSHatbF7cqIaxhQ==
X-CSE-MsgGUID: 9hEyyuZRSlyAHDCV16UHMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83863589"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="83863589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 17:30:41 -0800
X-CSE-ConnectionGUID: nYtMMaaORimFfpUMWUxfuw==
X-CSE-MsgGUID: L+Awcc3vQTmUTwPaNIOaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="215406456"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 17:30:41 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 17:30:41 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 17:30:41 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.10) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 17:30:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4o0F9PEGiVqW9TX+zZqh/pcEQtAI99Ugm1AH+k6zgdQeNdaqF/kiozNCZt15AH/CipJpwcqCWR6FfeHT3djJ0wZYq8weFhHSnvq2Vy9c4dKRvFfvYRrPYcY21SbmFhwbjLmByPgL9Cr19WVlTnQwGB9L3mqrUTYyRgvqdvRSXwnAaiZFwg88R6M7IsW/lFH4Oy2o7pqHKBrK7QFEvDqsRZL/4NfjmUA83lYxNAhue3aPLXUnrE7PGIcrYEtq9fKEbMo6DohEejYiZDAfAmDOswIfQKqFsEbh5MthMqVQSxegzcnnRHOvlomsLs+NSsqho64W1jaXKx8XdnWakCisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zybe93RZIFEYlHwuGERZvbSB6HaArAHR6ltU/RXmHJI=;
 b=jUsiWFtrvAmMjLjj0x4HvhjOfk7r73h11594To9DUVn2HmcLiSnExsvIKiZFjjp6yBsXDQyMlcDerUr3RUErdInrEBJoxuliQwzbjVQ6vF0R7sRgBkd/uImovLUdFggg+aBOwmur4mAmPT7zHFCXfUh36KNMgY1oLTIZpnUHv9Ke6BxbDOflnuOKUESYS4gnu/F5MpQPl0eHhDx4dNLqR4w+H5wz3Dfn9EINJxaS+2GrmTdRPk40RjbLuREIJp2wuE+KXZsiGUx3P5SGzGqHm+JQuZ8SDc0SiLXgknwiPH2i4YrhSs+7SOS4PXD9YT6/ILgE0yncL75fb5fS6HhqMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH3PPF8517B3F27.namprd11.prod.outlook.com (2603:10b6:518:1::d35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 01:30:38 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 01:30:38 +0000
Message-ID: <8e4bd54c-abbf-47c8-ab30-14a79d1fe536@intel.com>
Date: Tue, 3 Mar 2026 07:00:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Detect and
 bypass joiner modes
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260223093443.1797078-1-pranay.samala@intel.com>
 <20260223093443.1797078-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260223093443.1797078-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH3PPF8517B3F27:EE_
X-MS-Office365-Filtering-Correlation-Id: 78acfcd4-80f8-48eb-4329-08de78c4795c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: uLpksu8V/tJsO2pYyVFq+x+jvENg42ekX0fPoMm3RU101WvFzOBbu5C+N+LvFevaPF69KnHcYvNOwZEjP18oSFg5pzqqgMFftuUfuHTm0QYP/LnSn6//rJwRLBKpsm2OyVAEqQAfecXS9SOhFFP0y2rhAf8/YMd8gt3M/leBi77X7lk3otSqSXVVfmevqDDSBVOE2GSpog4FWz0SQYyDhJHJyqKsWEIcq9PNtyehWrtHADfy3J3C9Cs9H7Uf8+ZLt9Yg0bZWMyjwz6JbO+oR88AjFqUeYoRzOOxw9wdAv8SF/+YQd+/Y70Gq7A/2ZyNYegjbRj7u5L5ftsXyw3eXduwBpFhQ/PxSWsD3QTNQJeWLYhh3EJ2jg8nDJ9GDrTwLJVK1E6OAkGGMQpduHeEWXdSDS3wqAnfjqOtLi5N4wgm8YGnkXU9SoVvUdhPl1Apd/hbq16Ds+RPSa9yKg/yaoN2PIkmxoNXggeS5vtnf14cZc2Hs7NQ2tfQt6TiqkxR0Y3AKsbdeFFaRgDnwxl5Dx5ZXVzavY9nu56Ll7rf4iU/C6lCrrM3Iyotg0Q11iT53pH+cCLuclO/+1bSWWvfSH9XYdWai3F4E9cDbR6zbTPUQmaWSmYaJrQWG1oQ3WR831K7QAOT4Pk7cHAuNl5UN/NSE1bDzL6d/7sdXs4JYWxtE4GZVzz5HPgPv7eH2TmUw971VTqsev6Giz3saX/uu4vtkMxQy24ahXGwdR/AyuPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJheXUyTTUrMWxGYlV4N3Z2V1l6UDM3QWYvTVpuajdnZzdNcUlwSm54SXJZ?=
 =?utf-8?B?WW5mbHZoMis4OFlmTWt5L1N0aG9yWnNFR09zSmRCQi94YmxMa3NXT2VFckpk?=
 =?utf-8?B?K01jNWZ0djBGM0pOUkZMOGFJUjQzZnJaY21ZZHRNTm42SmZYbnpTMGR2UFBx?=
 =?utf-8?B?QWs2TVhOZnBDakIzZlJFQmU1VUJLYmdtTkFTNk5ORThKVGwzbldQampkLy9N?=
 =?utf-8?B?c1ZkN09FeDc0YXBtb0thTzk0djdqdUlUSXN2TXNZV3h5SUJSZEJjZUUxeHE2?=
 =?utf-8?B?SnBiWkFnbUI3ek9peFdpd29uRWI1dkV4Rk9zWGhKdkVpelRUTVdCaDdXdWNx?=
 =?utf-8?B?ZElJUmVDOE9LK0NDbWZocWxKWk05Yk45MlhMbU1HVUJBbzJmemFVY2hpdUZj?=
 =?utf-8?B?MWRieUdHOStGejRvSGFqcTFzSjhGSktSbGJaUk8vSGhGZ3ZuRHdzbnNkQkti?=
 =?utf-8?B?UWc4V3dQTHFZNWxpcFpUWksrOG91S3gzcXVrMUdUMFdiNlBydSt3KzlxTEVG?=
 =?utf-8?B?ZnBTWGZ4cUJHVWpUd3dkaDErTkdKRVlvU0RCVDNkY2QzaHVyallWSHBTVVcr?=
 =?utf-8?B?aTVBTWRsdXRaTVN3L2NWU2R6bFJHNU84eDZxNWNhUW9UTkJHRDMxMTdqY3Vm?=
 =?utf-8?B?ZXF6SkRaVU9YUm0yQ2RkdURXVVluQ3NHeUNDQk8zVXI1V1F5c3NQeWoyTVdR?=
 =?utf-8?B?VkhrcjJ2b0k3OGFhS3RVYnNOMVNvdTBrWnMwNGVnVVdBV2YwYlhiVTFDTVdI?=
 =?utf-8?B?ZXVzNlYwbXNhQ0NpNHpXNmRQMnZHWjlIMEp0VGlsVUN6ajlYNDA3dVptQW9r?=
 =?utf-8?B?ajhvM1BlQVFtMUFhei8wK2hKZ1Fmb0kxVlM0VmgzWTZwbXFLYmVFY0pvNTRa?=
 =?utf-8?B?VVQ4U2RsU1Q4ci9UQW1YQ3hxcEVsTGZ3UlpxOFUxaEJTU3RjK0IyTzBsRkls?=
 =?utf-8?B?cXAvZWNaS2RPN3hhSGtvSUVENHVxazFMVmFOMU44MW5vTEZxQ29scjRuUmRP?=
 =?utf-8?B?TzA4SElLU2pOeWJlRWNCZUtBR2ZSZFpCRjgvMmppb3dITjhOV0FLL0dHVHlG?=
 =?utf-8?B?dzhkQWRzRVBveU5ZbVRtSDBERmlYblRxdjdPbHAyb2dzVDcxd3pQb0RRWml3?=
 =?utf-8?B?dDNYY0RrY3RKcXhHSndXMCtYUDFlQ2lXVTE5VmxkZU1DdFM5anpPckVWMVhG?=
 =?utf-8?B?SWpHV3hzVXphbnR5STN4TzBpbEVLcldHZkpnb0pnUVcxRytycHptZlRGSTR5?=
 =?utf-8?B?NVluTTNGK1NFNkF2NzVvUjhjTTJZa3dhQ0E3WWphUWhPdzRSbVJXdFc2ME1Y?=
 =?utf-8?B?ZERsN25jeGlZNFdaU0s5MTFWNHZURFNWT3lmdmhaazhBWkNna1daQ2RzcHBm?=
 =?utf-8?B?elprQU9GTTQ2cmdGdlpidi9uS3Zqci9hKzhFd2d6S3h6Wkk0YlpSazJ0YXJT?=
 =?utf-8?B?cThHZ1liNUNIamdVVUJEUVJxb3l4Z0NXaWM5QVh6QTcrRVoxR1NHaE92VWI2?=
 =?utf-8?B?SVJLRzR1S3U2Z0tGY2t3eGxobUpmLzJOMnp5Q3JUVUpNTmFLZi9EQ3U4VFR5?=
 =?utf-8?B?d29qdHR5aUcxVkVVZWsrRi9CaWhiR0wzMnpwZjQ2VGtpRFdjOXNVYWpoRFRQ?=
 =?utf-8?B?bERabDBqdDd3dHU1K1MvcTNnSHBhYnJ5MUtvSXJpcVVUbnRVRmIrSCtZV0ZB?=
 =?utf-8?B?Z1ZsTlIzZGZqUXdXeDY5Z0ZMZ1hPeHhsUVVVZWNmUEdqOTdFRk5sVUoweWtN?=
 =?utf-8?B?WXRkckR1NXRYd1NvV1lhZVplODNlVWw0U0swaVlqMTluUG1sZFY2OWJPcHB3?=
 =?utf-8?B?cVNlQWRyREUwNno2ZlNtQ0V1c09DUkoyWjV3dnNZT09naHB6M0t0K283T2Nz?=
 =?utf-8?B?dS82dklBRXR1QkFEa0dqdHRpd2k5bHRBOUw2T2FUSGtBS0VkakVLT0lnVUdV?=
 =?utf-8?B?YXpqOTNKaXIvR2pKWFJmOVFWWkxFSUwxYXZ1cHZXRUx5ODl5MFpYY0NiZXZM?=
 =?utf-8?B?RVpQa2l0Qk5FRzFrMVFxaEV2SFd3Tnk1UTVDT09TTFFsQ3BjRmZEazEyS3Rl?=
 =?utf-8?B?Sk51WmtJQ2dlRUZJMkZmMW5CK2JOQ2tjWFZkK0pMNitXbXdacHdDMzRyYWh2?=
 =?utf-8?B?T1FBZjIyZXNkK0dwZEpuU3JuVlc1MzNTOVdkUk9veVV5UXB1SFJLRzAzQjBa?=
 =?utf-8?B?ODdkcnY2VHViUnVCdUJDSytORndDMDRaQ3ltK3VBZFFlY29vMTRtTFNVN2NQ?=
 =?utf-8?B?UzA3TWxZNnJpaExjZXNZVVVtM1ZDT1NydFBDeFVpcGRweGxkeUlGa1JPbHYx?=
 =?utf-8?B?MUg1cEg4bTh4NmROWkhMK3dDUEZiWk0zWVl2Z1Foek5jK1IzalRYMnRybEdW?=
 =?utf-8?Q?QHea8tQxgIZNJYVOQh53J/T/KBYvxk8GT8bJH?=
X-Exchange-RoutingPolicyChecked: H4tdmKWwsDHohldMFSEryCQe790ZmCxB3qCyBsIQ0SqZSGhPeodlJ2HpmRnlI/JFv2J1d8OhrLjisWX8NQuSWQt9JCH6haCj9k6SXOtJiuPs8jYDw1BQtTKKRww9LTwgIsSgPlgqPJrsIVZkvHivVzFM8u0QG96odSqVjuOV3ow5NCngavKZWr952JHxLaaKFn4y4GItn5Sg4Y2n4ZXNrdPSrLKc3cXJfwleURWvpHh8vsdx4Xz9PcTXoPajQFDg7uC9EIxOrXE6/32pF5I4gmk22mW7cXB0Rnzg4i9lubOJ684wPghRZ+XabhRBk3/kEBvD9AI2mCExfdznaSnUFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78acfcd4-80f8-48eb-4329-08de78c4795c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 01:30:38.1543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTrkBGVvd/G4viQmljkE30wqbbn641B9nc+Y2Z5cyEOmaQDV6oRwxKPm9T5C/vZ/jm3O99vOxLCZKFk1mWThDofqmRiZRGuAiaKsgAsFaAPSfe4TSneXwIsjaXJTY1Jx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8517B3F27
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

Hi Pranay,

On 23-02-2026 15:04, Pranay Samala wrote:
> When the output configured to a joiner mode (Big Joiner or Ultra Joiner),
> switch to a non-joiner mode before running the sharpness filter test,
> since CASF is not supported on joiner configurations.
> This ensures the sharpness filter test runs on a single pipe configuration
> and avoid false failures.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index eddfad6b9..e1a6be676 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -440,7 +440,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			data->output = output;
>   			data->pipe_id = crtc->pipe;
>   			data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
> -			data->mode = igt_output_get_mode(data->output);
> +
> +			if (is_joiner_mode(data->drm_fd, data->output)) {
If there is a known limitation with KMD that joiner and sharpness 
concurrently do not work, please add FIXME.
> +				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
> +				igt_info("Executing on mode %dx%d@%d\n",
> +					 data->mode->hdisplay,
> +					 data->mode->vdisplay,
> +					 data->mode->vrefresh);
> +			} else {
> +				data->mode = igt_output_get_mode(data->output);
> +			}
>   
>   			if (!has_sharpness_filter(data->crtc)) {
>   				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",

