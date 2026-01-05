Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD55C2A075
	for <igt-dev@archiver.kernel.org>; Mon,  5 Jan 2026 08:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6CF10E05E;
	Mon,  5 Jan 2026 08:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNZ02BSG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC0310E3B9
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jan 2026 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767603125; x=1799139125;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=p8KdrzuS/1QJSxy+KzcnT9M8QFfzUjlJ4DPTYKi5nk8=;
 b=hNZ02BSGxbhWMXFOzQKehBzTirr35dTMvvOEa8wCnMn3SdhLQbsVOMUD
 Fjak8eZFYGPL7RyM853PotygC0M0+5SdSJ6AsmdskxupvkZdAlI+ETOtE
 1ds43hOrSJr8MAYi7yTVLnCRHVKE9aIs/efLVE63tt+fJtUVDgvRhuYtB
 Xdw5ySh+W7pKA+rCNQzH4L4bW1Na3xd+jbSDFbudDeEer6SbSevvhxsTN
 LbphKMU+QK9Ny4ewu4CxzcgqPv+hdtgsJtf/dqVs/UZJpc809yEcJEdY1
 W8wcatTsEXGFQe3kMrHwHtRo4NWGEpKeyycq9cBKLtEXFCU/w5as+c0nN A==;
X-CSE-ConnectionGUID: gb6k/Bd8SPOVY4s2fj3+cQ==
X-CSE-MsgGUID: Sw+rABtlTw2QFr+5gZecLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69018738"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69018738"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:51:46 -0800
X-CSE-ConnectionGUID: BMUCb/xFTzqKXZ196Ee16w==
X-CSE-MsgGUID: 8MVP2xFpQe2ldYeMzeblBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="207228090"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 00:51:33 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:51:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 00:51:32 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 00:51:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uotEF2oxuNsxXYo6w26AWEHdyQmm0v5SmvWRC3jqyQTiAKAH3yAvwYUm0Am+c5aDVH21OgHuFzgMcdslq6Fi5xA3gtWjbzQVIie+ZrgqqZRx2waZaE8GqJXGLOasqK0ZrPg0YRD7tuXXUhbLZ2Lv21nZashQczMWwZLB5JikjxKl+VTz4J+7OiwHPDdMXXTQ9r3XndZb3uTnscsLZzK1OKnu0MBbVmCIUZ9seUEdzSQgqG9eHkj+9hm4ZO7/Cws8JBWuPAPxOKZ5oCb9gYFQhsKfuivZ/jeQMwr9ZFBv3I5nCTKlVbaBWFU4fPHtNrM5msiB/uzLMOsAwh10KLTZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaKa2Kej0CbU36djEG2GWrv1CfIOWLUy5P9FsW0Jgo4=;
 b=Ybo+cmXeY03AlL+SCop54h9IGDl1igQJkyBv16YbEamKL7cbja/ePUJ5A97ZJ2r9PNCWyZl9QH/w37+rkAGyK1Z8vksPbf4dDOm9//XhkiEEcUeE7F6wOVFgNM0oYq9hIhnw1pm1k+pLPdth6Dzx1kRrAFa3We+l4JOIWKAzFYDVZ70sYwkSUDQIvQBnEKJTvYhISZNI5yZ30Qpba6QKWA6uQjdEyIYd+0f49dImmrMrkFec/Dvb1yqN0HBPro8eLOsz0qWIa+FilnM1NGz6mNQw/R+CDhr9RQYXKBIjRWWJbTlf7aDS+gQPdjV6uhtp4kssCBb0q2mFbsQoHZvL4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:51:24 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%3]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 08:51:24 +0000
Date: Mon, 5 Jan 2026 14:21:17 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFp?= =?utf-8?Q?lure?= for
 Discard wait_for_lmem_ready from fault injection test
Message-ID: <aVt7hXEZTpPYA0ux@bvivekan-mob1>
References: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
 <176601611181.98733.16112265055793041386@a3b018990fe9>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <176601611181.98733.16112265055793041386@a3b018990fe9>
X-ClientProxiedBy: MAXPR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::15) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d388dd-c943-41b1-4efc-08de4c379ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1p2TjRzZDduNkRXOWRIK1lWc1I4SjNkTytqRmxIT3RFSng1Mk9JWGkwWHR3?=
 =?utf-8?B?T0RBUU5QdE5pOXNVWFhPc3AxeUpzbXA0cGc0d0Z4Sk9CTktZRDRTOVBicjB3?=
 =?utf-8?B?UTNqMDJ5ZFgvdDRDa0VoOUJUREtLZ1FkQ3EybzIyVlFhZXE4a08vemI3dG5q?=
 =?utf-8?B?TW9RTHpZcjJuT2dmL3liL1Z2TmxCbkJqU0YyMVYyS3I0TEVqTGlMcDZVYjli?=
 =?utf-8?B?TWtvSFZZNlA0TDNjS2gwbmZOYW5tNWlNY3FsL3pUNjRjNWd2ZzZGdkl4ZDRT?=
 =?utf-8?B?Y1gxQUIzRmpBamZ3VU83QjFIOTAramNUMFhZUi9rMjM0RS9rV2xSNFREbkdx?=
 =?utf-8?B?bU5ITGhVdzdoeUljc0hBZUQ4MXNzYWlNR2t3cHluZVcxRjhLTzZUamx0eFE0?=
 =?utf-8?B?engrNU5FMUlNSi9BV0o1dUJCcDZycGE4NW5lakF0RGJYSzRmOEFPVTBiR3Ey?=
 =?utf-8?B?QkRVWG9MQ1NmV1FGU2M0QnBhelVMcC9TL0VLQlFETDhmOHFER2JmSDhXVzRG?=
 =?utf-8?B?ZWNvcFcxdElmYkgvT3VmUzZyLy9YSDRTbWVCRytWc2Z5bmp1RVlDUWpHM2hW?=
 =?utf-8?B?Q09uZFNzS2ViZmRyTnRPbEtTWkFIeUtSZG1VcXlwcjhpMy96WjdvWE1abmlm?=
 =?utf-8?B?MzFsZFR5djlOMGl2T2hucTN5bFdwMkJKWjNrQThLdWttc1N5SmZqNzhWeW0v?=
 =?utf-8?B?NXg0TGZhdUJucFFYZXhJL3d5bHpqZy9xZDM4NFhmWXl6c1h2UE9PSjVXYnFy?=
 =?utf-8?B?SjBPNFBERjMrSW1KN0FjMFprbDlJalU3Y3FaeXQvNnk4SHJkZFNuVUJLUnhr?=
 =?utf-8?B?OEl0d09IWXFJd0lQaUNsRFcrSS9IUDBWaktTUWVtQUp6djZYV29sc3VRZnpM?=
 =?utf-8?B?SmZ4elZpU2FhWmd2YzVDM2UzMU5Kd25lbGpjaXhObnQ1SkdtajZ3Z3BXSCto?=
 =?utf-8?B?VityRWs1U1hpOUtJbkRBMm9XOHdIVWlaWTNqdGNNNnRyK2paaHh2L1ByMVNw?=
 =?utf-8?B?b0Urb0x0M3BNS0NSNUhWVDhUNSs2VnlvQlRXalhOWkZhWlJsOGZUQ3ZQY3ZV?=
 =?utf-8?B?NXlkMkV1R1Z1REVqTkl5WUY2VEtCWDBUOXJZUkxEOUtRMTV4WDZhY1ErWEVv?=
 =?utf-8?B?T29IVUxuT01TYzdYSHQ0WXQ4QzBYMCs0UTRzd2lVRjVuS2U0bU9TT3NnaDNq?=
 =?utf-8?B?NHZGZkV2U1Q1Z1ZxZllHclk3djJMQmdQNXpKUVJFTGRqQnBZOVRqd0JpUThK?=
 =?utf-8?B?TW5UdEZxdHFSRVlzaDYwVGlLSUpMVWVGZnphMENmRW5ML0g3Qmw0UndONUs5?=
 =?utf-8?B?OVhKZjRkYUlEdlo1R2RnUElGOWZMOWM5WEFMRW5HbkNNYWxLK29Eb0xiTFBm?=
 =?utf-8?B?bzkwa3dwS1F5WE9YaXpwaUNPZVpiUnFDNzEwM1ZReHR2WGdDMS9XMTRBbENt?=
 =?utf-8?B?QXYvOW9panN2KzhtVGJucXVUeHVJWjdWU09zZGlNb1pOb09YNkJpKzE5QmJq?=
 =?utf-8?B?V2ZtbGhqNWkvb0RtTWo5TE5qaWcvSGRjbnJHWXk2YUFFRnVNaWRlZGE2T2Ry?=
 =?utf-8?B?SDRtclY2NHhpTkVieVMyMHAvMnV0S1g3bE1PaWRReE1MMjVqMXFZbjJucXRQ?=
 =?utf-8?B?cmYyMTVDZ2VITVpVT0xZU0FZby9oY0NXRUw3VlFpakxPMW5KQ3gvYzdpcDk0?=
 =?utf-8?B?Z0tmOXJ1MG1vbjZpTVNaV1pGZ2M0OC9QZUNyVVlaNGltZ1ZOWC9Wd3VFamQw?=
 =?utf-8?B?ZjY4VW03bksxR3NBczFpL2xtWG43a3BJaU42eUtOczFERnVaZ0o0Rk9wRnJr?=
 =?utf-8?B?YXRCWWpzamVhNnlOYWVTVEp3ZXNZUXgxd2VMMFJCUWRNcFA2MHpHYmF6Y2kr?=
 =?utf-8?B?UHRENXQ0L3lTVGM1bWp4dkJjMmFDL2tzU3pHL25DVUJxeGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUxWdW9XNi9UUjg3Z2V3VXhDUHVXR3JLZzQ2bWRvK3BvVDFaM2pBUWNHTVRG?=
 =?utf-8?B?SlE5S01uTEJBd0VBOVB0aXhLNlBPZGNRRi9vc0V4VVVEZ3dpeXVDb0lOUHlC?=
 =?utf-8?B?UEZiNGYyeVZPRWpaTXY1VEFjMEpDVm5zcFd5SU9BUWZnTXczWEZnUlBVRGp0?=
 =?utf-8?B?L0VDMy9xSmFWa1c4WWNkMk5nWWdPdWd0b2pWejF3SVlWQ0lTRTNVNXBpSVJJ?=
 =?utf-8?B?Y0d2aXhpbjR0aWs0cTdmUldnQ09PUjBDL3dXV0tuVlEzTlVXTGRTM1N4NDU0?=
 =?utf-8?B?Rkhub0hHVzRZakcxY1pVR25za0Y1SDkwRXQ5WFUxRTFtdExvbUZYTEphSVM2?=
 =?utf-8?B?Mk9HcWRzbVhNcFhxSDMvcEVUNUVJZXUrcHZMMzlJVGVuU2xqbHJaZEp5VFlD?=
 =?utf-8?B?ZGw4ZDdYV1dScDJyREJwcDFvUmQ0Y0pGNnpVNTlXWjV5UDJ0czczUkhjaXpM?=
 =?utf-8?B?ZTlySWJTZXVqWW1yQlBOY1A3akhLMzRRd25SaTRaQnIvRTNRUjhUWWJFNHUv?=
 =?utf-8?B?R2xxTUJsL2RiQXZlN2pHOHhycFQrTFBtUjNrdzdXU1VsazNqMEkvaTBXSkxy?=
 =?utf-8?B?SHlyRVlJck5lMXVYdG4wVktoYzFzb01ZKzB2RlZldmIyZjdxVFM0MDZHWEJ0?=
 =?utf-8?B?RUdVaUdnR2VuMFlCK3h2UmdWWDhIVWpwRzVBOUQyN3dvWG5QSy9EaDlxeFF2?=
 =?utf-8?B?cE5hUTJ1VGdDQW5sdGdGUXZ2Q3ZlaGRrNXBhZytDM3ptK01XSmdSd3BXWlVT?=
 =?utf-8?B?NVVzZnFrNHRXUnEvUk5haXZjQVVkdDJvMDFGQ20rbzN0MmxKYVgvN21xUjds?=
 =?utf-8?B?M0FoYm1rRkFmQjNoOUJOTEhjdVNKWTFLemtWci9SZEdyWHhsVWwyR1FBcjYx?=
 =?utf-8?B?M3pkdTJ2dmhpeGxKZCtvanJMNzFVYVRDeUl4WDB2alk4SnVUOXBmdzlHMXgy?=
 =?utf-8?B?b2FycDhPSXM0OWR2dFlQQVZEbEk3YlJNQm5YaElGWWU5UXcxekJzd2lsWmJP?=
 =?utf-8?B?OW12NzljZit2RUtCNHE4YksxS0VnT0w0SFc0MmEvNm8xbGE5UDFjbGdZYUhL?=
 =?utf-8?B?YmtBRTdBNDJkbkJYWmVhYUVGYXdneSs0L25rWVV1MllwM1BMVXpmamdwRTJt?=
 =?utf-8?B?R1N3VDNpbHdsaHN6Q1N0MjBZd3RXQkp6MW1ONDNMZG1KQ21DRXBmOVpGbkxH?=
 =?utf-8?B?amZ6S0c1dUpvRHMrN2V1Mjk5ZW9Vd3dEWFpDZHI4NHJmbDZVTDRoOGZFWXMy?=
 =?utf-8?B?N01MaysyWjQveFF4c1V1UndJQzViaVhpaU1wWDJBcTJiMmRyZDFqQTNmU1cr?=
 =?utf-8?B?WW1MN1hxQ2VCZTZqcE5Fb2pVL3NaRDEwQTdkL094Y2JLUjBkalRNZXBMMHNy?=
 =?utf-8?B?eVBxRUsvdUpDOTBFVS9leEU2YjBwYWVCK3ZhK3hTQWtZdFNVQWU5SW5aNnJ5?=
 =?utf-8?B?bXk1bWdCMzNSdVd0TnhQdlJnVXFiZGRCZUloQXpyWTdSdE9ObWF6QjlHdWN2?=
 =?utf-8?B?d05XSTRXRllTaW8wKzR6ZUE0cDNCZVRBNWdVTEVVUkxmbEhrT29ua1VyVm1Q?=
 =?utf-8?B?VHhHcVFzSHNsM0lLUXg4Y3A1MkZjREJWbU84RWIvMjlPZFVNT0lWMjV1aEpJ?=
 =?utf-8?B?VFN0UkZxVjNxVGlkSGJvQkVsbjArWGZYZ3MwT3pBTEpqVWpTZXdFMUNGS3E5?=
 =?utf-8?B?bFhHSkxUZWlaTCttYk5RcDdmMEw3OHFSQWhZaWtqd0tLYmpsWUpHOG82VnVD?=
 =?utf-8?B?T0wwa1BoQXM4RHlPczVUSWI4WStob3BFeEw3MkRnUHA1WWRjWWxRdU9tVU5m?=
 =?utf-8?B?em1EMUxFK1pHK0JrdVZvZHdvVlpPWXlTd0YwV2JJNWlmRnRQY1NFNCs2dDJ0?=
 =?utf-8?B?cWhVT3NzSFJzNWJ6VWk1QXYzblV5S0F2TTJqUlN3VCs2R1hvTDM0NjdaREI2?=
 =?utf-8?B?UXNsMDVzM2w5NjdHc21pOXI1SEhMQkFITGdpMlArTmFoeE9LTGlQVjJETXZV?=
 =?utf-8?B?UStvaHRjZ25ad1pwNWVuTEw1ZjJKWWRpTkZVd0dHVWRNNUdCaVRYZjhKTzhT?=
 =?utf-8?B?Lzg5aXJsNDMraGJEMnJMQjdQS2dJYlduQXR6SGtSemc0NWlNL2xFVjUxazhJ?=
 =?utf-8?B?b0g0UGh1azhlcFV5Q2x5RXkvbCtndkdXREVSYWpaWjMxMVVLV0MwR3J4NnVt?=
 =?utf-8?B?OGUxZnI1N2xuT3VnWnZVcEYzM09aT0t4UTNOWEFXU2ErMFQ1aHB4YUw0V3pP?=
 =?utf-8?B?TlplVHNHbThpZHFBclBkUmttcGtFVXNPR3BxQ2RrY1lrTlpmdyszNjVQVzI5?=
 =?utf-8?B?RndiQmdCL3VHeDNCQmpRQlpoK0R2NjdNWFQ1L2sxMUxRRmxZRWZ1bWxhRURO?=
 =?utf-8?Q?/jafCJx8Oiqt4uxs/ORHc2nPYeEtd5lyefA+I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d388dd-c943-41b1-4efc-08de4c379ab8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 08:51:24.2156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmG9kmChfbAVH/lDNslk0IFV6HRWNK3TBkBGot4p0EfbkFVmL/F+akETtWfiCGMKhMWnGkhr/NvsjIibjdfCeX4NUjpaqiNP3ykADXPbRZ4ZJ+Bi6SuFpFSMlp+uBuma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On 18.12.2025 00:01, Patchwork wrote:
> == Series Details ==
> 
> Series: Discard wait_for_lmem_ready from fault injection test
> URL   : https://patchwork.freedesktop.org/series/159151/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8670_full -> IGTPW_14227_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14227_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14227_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14227_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_suspend@basic-s3-devices@smem:
>     - shard-rkl:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@gem_exec_suspend@basic-s3-devices@smem.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices@smem.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_joiner@basic-big-joiner.html
> 

No test other than xe_fault_injection is affected by this patch. So all
the above failures can be ignored.

Regards,
Bala

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14227_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu-1:       NOTRUN -> [SKIP][4] ([i915#11078])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-tglu:         NOTRUN -> [SKIP][6] ([i915#9323])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          [PASS][7] -> [INCOMPLETE][8] ([i915#13356])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-5/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#6335])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#8555]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#280])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#280]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#280])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#280])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@gem_ctx_sseu@invalid-sseu.html
>     - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#280])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-7/igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][16] ([i915#13390])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk9/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_balancer@bonded-pair:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#4771])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html
>     - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#4771])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@gem_exec_balancer@bonded-pair.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8555]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-5/igt@gem_exec_balancer@noheartbeat.html
>     - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#8555])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-8/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#4525])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-9/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#4525]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-rkl:          NOTRUN -> [SKIP][23] ([i915#4525])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6344])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4812])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gem_exec_fence@submit3.html
>     - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#4812]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_flush@basic-uc-rw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][27] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3539] / [i915#4852])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@gem_exec_flush@basic-wb-set-default.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#5107])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_reloc@basic-cpu-read:
>     - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#3281]) +6 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@gem_exec_reloc@basic-cpu-read.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-active:
>     - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#3281]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-cpu-active.html
>     - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#3281])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-3/igt@gem_exec_reloc@basic-gtt-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3281]) +10 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html
> 
>   * igt@gem_exec_schedule@preempt-queue-chain:
>     - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4537] / [i915#4812])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>   * igt@gem_exec_suspend@basic-s3-devices:
>     - shard-rkl:          [PASS][35] -> [ABORT][36] ([i915#15131])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@gem_exec_suspend@basic-s3-devices.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-1/igt@gem_exec_suspend@basic-s3-devices.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#4860])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#4613]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-5/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4613])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@gem_lmem_swapping@heavy-verify-multi.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][40] ([i915#4613]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@random:
>     - shard-glk:          NOTRUN -> [SKIP][41] ([i915#4613]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk2/igt@gem_lmem_swapping@random.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#12193]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs.html
> 
>   * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4565]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#284])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@gem_media_vme.html
>     - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#284])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-13/igt@gem_media_vme.html
> 
>   * igt@gem_mmap_gtt@big-copy:
>     - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4077]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gem_mmap_gtt@big-copy.html
> 
>   * igt@gem_mmap_gtt@coherency:
>     - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#14544])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_mmap_gtt@coherency.html
> 
>   * igt@gem_partial_pwrite_pread@reads-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3282]) +5 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gem_partial_pwrite_pread@reads-uncached.html
>     - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#14544] / [i915#3282])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>   * igt@gem_pread@display:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#3282])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@gem_pread@display.html
> 
>   * igt@gem_pread@exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][51] ([i915#2658])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk2/igt@gem_pread@exhaustion.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#3282]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4270])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#4270]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>   * igt@gem_readwrite@write-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3282]) +1 other test skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-4/igt@gem_readwrite@write-bad-handle.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-linear:
>     - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5190] / [i915#8428]) +4 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>   * igt@gem_userptr_blits@access-control:
>     - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3297])
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@gem_userptr_blits@access-control.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3297])
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#3297] / [i915#3323])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#3297] / [i915#4880]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
>     - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#3297] / [i915#4880])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_workarounds@suspend-resume-context:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][62] ([i915#13356])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@gem_workarounds@suspend-resume-context.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-tglu-1:       NOTRUN -> [SKIP][63] ([i915#2527] / [i915#2856]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#2527] / [i915#2856]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@bb-secure:
>     - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#2527])
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@gen9_exec_parse@bb-secure.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#2856])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@gen9_exec_parse@unaligned-jump:
>     - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#2527]) +1 other test skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@gen9_exec_parse@unaligned-jump.html
> 
>   * igt@i915_drm_fdinfo@busy-hang@vcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#14073]) +5 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@i915_drm_fdinfo@busy-hang@vcs0.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][69] ([i915#8399])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_rps@waitboost:
>     - shard-mtlp:         [PASS][70] -> [FAIL][71] ([i915#15365])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-mtlp-3/igt@i915_pm_rps@waitboost.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-2/igt@i915_pm_rps@waitboost.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-mtlp:         [PASS][72] -> [DMESG-FAIL][73] ([i915#12061]) +1 other test dmesg-fail
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-2/igt@i915_selftest@live@workarounds.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][74] ([i915#4817] / [i915#7443])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@i915_suspend@fence-restore-untiled:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][75] ([i915#4817])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][76] ([i915#4817]) +1 other test incomplete
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk5/igt@i915_suspend@forcewake.html
> 
>   * igt@i915_suspend@sysfs-reader:
>     - shard-rkl:          [PASS][77] -> [INCOMPLETE][78] ([i915#4817])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@i915_suspend@sysfs-reader.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-tglu-1:       NOTRUN -> [SKIP][79] ([i915#7707])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4212])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-5/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#4212]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-set-prop-any:
>     - shard-dg1:          NOTRUN -> [DMESG-WARN][82] ([i915#4423])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_addfb_basic@invalid-set-prop-any.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu-1:       NOTRUN -> [SKIP][83] ([i915#1769] / [i915#3555])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#5286])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][85] ([i915#5286]) +1 other test skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>     - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4538] / [i915#5286]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#5286]) +3 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#3638])
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][89]
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>     - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#3638]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4538] / [i915#5190]) +3 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#5190])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>     - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4538]) +3 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#6095]) +61 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs@pipe-d-dp-3.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#12313])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#10307] / [i915#6095]) +118 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#6095]) +156 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-13/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#6095]) +69 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#14098] / [i915#6095]) +36 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][100] ([i915#12313])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#12313])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#14544] / [i915#6095]) +8 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#6095]) +24 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#6095]) +64 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#6095]) +4 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-5/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#12313])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#13783]) +3 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>     - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#11151] / [i915#7828]) +8 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>     - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#11151] / [i915#7828])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-5/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
>     - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#11151] / [i915#14544] / [i915#7828])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-fast:
>     - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-single:
>     - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#11151] / [i915#7828]) +7 other tests skip
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_chamelium_frames@hdmi-crc-single.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3299]) +1 other test skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#3299]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-tglu-1:       NOTRUN -> [SKIP][119] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#6944] / [i915#9424])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_content_protection@lic-type-1.html
>     - shard-dg1:          NOTRUN -> [SKIP][121] ([i915#6944] / [i915#9424])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_content_protection@lic-type-1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#13049])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#3555])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#3555]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#13049])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#13049]) +1 other test skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_cursor_crc@cursor-random-512x512.html
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#13049]) +3 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#3555]) +2 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-9/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-tglu:         NOTRUN -> [FAIL][129] ([i915#13566]) +1 other test fail
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-9/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#8814])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#4103]) +1 other test skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#13046] / [i915#5354])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][133] +9 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-tglu:         NOTRUN -> [SKIP][134] ([i915#9067])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4103] / [i915#4213])
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#4103] / [i915#4213])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#9723])
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-18/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#9833])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3804])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#1257])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-dg2:          [PASS][141] -> [SKIP][142] ([i915#13749])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-sst.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@kms_dp_link_training@non-uhbr-sst.html
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#13749])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#13748])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-2/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#13707])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-14/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#13707])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#14544] / [i915#3840])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats:
>     - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#3555] / [i915#3840])
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][149] ([i915#9878])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#1839])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-tglu-1:       NOTRUN -> [SKIP][151] ([i915#9337])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#9934]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#3637] / [i915#9934])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#9934]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-tglu-1:       NOTRUN -> [SKIP][155] ([i915#3637] / [i915#9934]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#14544] / [i915#9934]) +2 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3637] / [i915#9934]) +7 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#8381])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][159] ([i915#12745] / [i915#4839])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][160] ([i915#4839])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#9934]) +3 other tests skip
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-14/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][162] ([i915#12745] / [i915#4839] / [i915#6113])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk1/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][163] ([i915#12745] / [i915#6113])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#2672] / [i915#3555])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#2672]) +2 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
>     - shard-tglu-1:       NOTRUN -> [SKIP][166] ([i915#2587] / [i915#2672]) +3 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#2672] / [i915#3555]) +1 other test skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#2672]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
>     - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#2587] / [i915#2672]) +5 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#2587] / [i915#2672] / [i915#3555])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#2587] / [i915#2672]) +1 other test skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#2587] / [i915#2672] / [i915#3555])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][174] ([i915#2672] / [i915#3555]) +2 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#2672] / [i915#3555]) +5 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#1825]) +2 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][177] +28 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][178] +26 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>     - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#8708]) +12 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#15102] / [i915#3458]) +4 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#1825]) +18 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
>     - shard-snb:          NOTRUN -> [SKIP][182] +10 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][183] +50 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#14544] / [i915#1825]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#15102]) +8 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#15102]) +3 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#15102]) +18 other tests skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#15102])
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#15102]) +3 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8708]) +7 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#15102] / [i915#3458]) +11 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>     - shard-glk10:        NOTRUN -> [SKIP][192] +57 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#5354]) +17 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#15102] / [i915#3023]) +4 other tests skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#14544] / [i915#15102] / [i915#3023])
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-4/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8228]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8228])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#15458])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#15458])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#15460])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>     - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#14712])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic:
>     - shard-glk10:        NOTRUN -> [FAIL][203] ([i915#12178])
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic.html
> 
>   * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>     - shard-glk10:        NOTRUN -> [FAIL][204] ([i915#7862]) +1 other test fail
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-tglu-1:       NOTRUN -> [SKIP][205] ([i915#13958])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#13958])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-14/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#13958])
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#14259])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#15329]) +4 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-13/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>     - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#15329] / [i915#3555])
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
>     - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#15329]) +3 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#5354])
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_lpsp@screens-disabled:
>     - shard-tglu:         NOTRUN -> [SKIP][213] ([i915#8430])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#4077]) +6 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_pm_rpm@cursor.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-rkl:          [PASS][215] -> [SKIP][216] ([i915#15073]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg2:          [PASS][217] -> [SKIP][218] ([i915#15073])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#15073])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#6524])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#6524])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][222] ([i915#11520]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>     - shard-glk:          NOTRUN -> [SKIP][223] ([i915#11520]) +13 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk2/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#11520]) +3 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#11520]) +2 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][226] ([i915#11520]) +5 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#11520]) +5 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#11520]) +4 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#9683])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-7/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#9683])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-16/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-primary-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#1072] / [i915#14544] / [i915#9732])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_psr@fbc-pr-primary-blt.html
> 
>   * igt@kms_psr@fbc-pr-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#1072] / [i915#9732]) +9 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_psr@fbc-pr-suspend.html
> 
>   * igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#9688]) +1 other test skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-7/igt@kms_psr@fbc-psr-cursor-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9732]) +15 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@psr-primary-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#1072] / [i915#9732]) +6 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_psr@psr-primary-blt.html
> 
>   * igt@kms_psr@psr-sprite-mmap-cpu:
>     - shard-tglu-1:       NOTRUN -> [SKIP][236] ([i915#9732]) +7 other tests skip
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html
>     - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#1072] / [i915#9732]) +18 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_psr@psr-sprite-mmap-cpu.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-glk:          NOTRUN -> [SKIP][238] +529 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#5289])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_scaling_modes@scaling-mode-center:
>     - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#3555]) +3 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-18/igt@kms_scaling_modes@scaling-mode-center.html
> 
>   * igt@kms_setmode@basic:
>     - shard-snb:          [PASS][241] -> [FAIL][242] ([i915#15106]) +2 other tests fail
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-snb4/igt@kms_setmode@basic.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-snb4/igt@kms_setmode@basic.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#8623])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12276]) +1 other test incomplete
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#3555] / [i915#9906])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-11/igt@kms_vrr@negative-basic.html
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_vrr@negative-basic.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#9906])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_vrr@seamless-rr-switch-vrr.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][248] ([i915#9906])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#2436])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@prime_mmap@test_aperture_limit:
>     - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#14121]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-3/igt@prime_mmap@test_aperture_limit.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#14121]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-18/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#3708]) +1 other test skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html
>     - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#3708])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3291] / [i915#3708])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@prime_vgem@basic-read.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
>     - shard-tglu:         NOTRUN -> [FAIL][255] ([i915#12910]) +19 other tests fail
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
> 
>   * igt@tools_test@sysfs_l3_parity:
>     - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#4818])
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-12/igt@tools_test@sysfs_l3_parity.html
>     - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#4818])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_endless@dispatch:
>     - shard-dg2:          [TIMEOUT][258] ([i915#3778] / [i915#7016]) -> [PASS][259] +1 other test pass
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-6/igt@gem_exec_endless@dispatch.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@gem_exec_endless@dispatch.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-rkl:          [INCOMPLETE][260] ([i915#13356]) -> [PASS][261] +1 other test pass
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@gem_exec_suspend@basic-s0@smem.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_lmem_swapping@massive:
>     - shard-dg2:          [FAIL][262] ([i915#15452]) -> [PASS][263] +1 other test pass
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-4/igt@gem_lmem_swapping@massive.html
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@gem_lmem_swapping@massive.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-rkl:          [INCOMPLETE][264] ([i915#13809]) -> [PASS][265]
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_softpin@noreloc-s3.html
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_softpin@noreloc-s3.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg1:          [ABORT][266] ([i915#15342]) -> [PASS][267]
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-14/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg2:          [ABORT][268] ([i915#15342]) -> [PASS][269]
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglu:         [WARN][270] ([i915#13790] / [i915#2681]) -> [PASS][271] +1 other test pass
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - shard-dg1:          [ABORT][272] -> [PASS][273] +1 other test pass
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-18/igt@i915_selftest@live@gem_contexts.html
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-19/igt@i915_selftest@live@gem_contexts.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-rkl:          [ABORT][274] ([i915#15140]) -> [PASS][275]
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-1/igt@i915_suspend@forcewake.html
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@i915_suspend@forcewake.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-mtlp:         [FAIL][276] ([i915#5138]) -> [PASS][277] +1 other test pass
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-dg1:          [DMESG-WARN][278] ([i915#4423]) -> [PASS][279]
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-13/igt@kms_color@ctm-signed.html
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_cursor_crc@cursor-random-128x42:
>     - shard-tglu:         [FAIL][280] ([i915#13566]) -> [PASS][281] +5 other tests pass
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-9/igt@kms_cursor_crc@cursor-random-128x42.html
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
>     - shard-rkl:          [FAIL][282] ([i915#13566]) -> [PASS][283] +6 other tests pass
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [SKIP][284] ([i915#1257]) -> [PASS][285]
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-7/igt@kms_dp_aux_dev.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
>     - shard-glk:          [FAIL][286] ([i915#13027]) -> [PASS][287] +1 other test pass
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
>     - shard-tglu:         [FAIL][288] ([i915#13027]) -> [PASS][289] +1 other test pass
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
>     - shard-dg2:          [FAIL][290] ([i915#6880]) -> [PASS][291] +1 other test pass
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
> 
>   * igt@kms_hdr@static-toggle-dpms:
>     - shard-dg2:          [SKIP][292] ([i915#3555] / [i915#8228]) -> [PASS][293]
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html
>     - shard-rkl:          [SKIP][294] ([i915#3555] / [i915#8228]) -> [PASS][295]
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_hdr@static-toggle-dpms.html
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_hdr@static-toggle-dpms.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2:          [SKIP][296] ([i915#15459]) -> [PASS][297] +1 other test pass
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          [SKIP][298] ([i915#6953] / [i915#9423]) -> [PASS][299]
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
>     - shard-rkl:          [SKIP][300] ([i915#6953]) -> [PASS][301]
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size.html
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_setmode@basic:
>     - shard-tglu:         [FAIL][302] ([i915#15106]) -> [PASS][303] +2 other tests pass
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-2/igt@kms_setmode@basic.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-3/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-mtlp:         [FAIL][304] ([i915#15106]) -> [PASS][305] +2 other tests pass
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@perf@polling@0-rcs0:
>     - shard-rkl:          [FAIL][306] ([i915#10538]) -> [PASS][307] +1 other test pass
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-2/igt@perf@polling@0-rcs0.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@perf@polling@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [FAIL][308] ([i915#4349]) -> [PASS][309] +4 other tests pass
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   
> #### Warnings ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-rkl:          [SKIP][310] ([i915#14544] / [i915#8411]) -> [SKIP][311] ([i915#8411])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@api_intel_bb@blit-reloc-purge-cache.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          [SKIP][312] ([i915#14544] / [i915#6230]) -> [SKIP][313] ([i915#6230])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@api_intel_bb@crc32.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@api_intel_bb@crc32.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          [SKIP][314] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][315] ([i915#3555] / [i915#9323])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_ccs@block-copy-compressed.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-rkl:          [SKIP][316] ([i915#9323]) -> [SKIP][317] ([i915#14544] / [i915#9323])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-rkl:          [SKIP][318] ([i915#14544] / [i915#9323]) -> [SKIP][319] ([i915#9323])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_ccs@suspend-resume.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-rkl:          [SKIP][320] ([i915#6335]) -> [SKIP][321] ([i915#14544] / [i915#6335])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@gem_create@create-ext-cpu-access-big.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-rkl:          [SKIP][322] ([i915#14544] / [i915#4525]) -> [SKIP][323] ([i915#4525]) +2 other tests skip
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>     - shard-rkl:          [SKIP][324] ([i915#14544] / [i915#3281]) -> [SKIP][325] ([i915#3281]) +10 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-write-read:
>     - shard-rkl:          [SKIP][326] ([i915#3281]) -> [SKIP][327] ([i915#14544] / [i915#3281]) +2 other tests skip
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@gem_exec_reloc@basic-write-read.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_exec_reloc@basic-write-read.html
> 
>   * igt@gem_lmem_swapping@massive:
>     - shard-rkl:          [SKIP][328] ([i915#4613]) -> [SKIP][329] ([i915#14544] / [i915#4613])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@gem_lmem_swapping@massive.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_lmem_swapping@massive.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          [SKIP][330] ([i915#14544] / [i915#4613]) -> [SKIP][331] ([i915#4613]) +5 other tests skip
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          [SKIP][332] ([i915#14544] / [i915#3282]) -> [SKIP][333] ([i915#3282]) +5 other tests skip
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          [SKIP][334] ([i915#3282]) -> [SKIP][335] ([i915#14544] / [i915#3282]) +2 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@gem_set_tiling_vs_pwrite.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-rkl:          [SKIP][336] ([i915#3297]) -> [SKIP][337] ([i915#14544] / [i915#3297]) +1 other test skip
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@gem_userptr_blits@dmabuf-unsync.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@readonly-pwrite-unsync:
>     - shard-rkl:          [SKIP][338] ([i915#14544] / [i915#3297]) -> [SKIP][339] ([i915#3297])
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>   * igt@gem_userptr_blits@relocations:
>     - shard-rkl:          [SKIP][340] ([i915#3281] / [i915#3297]) -> [SKIP][341] ([i915#14544] / [i915#3281] / [i915#3297])
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@gem_userptr_blits@relocations.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gem_userptr_blits@relocations.html
> 
>   * igt@gen9_exec_parse@bb-start-out:
>     - shard-rkl:          [SKIP][342] ([i915#2527]) -> [SKIP][343] ([i915#14544] / [i915#2527]) +1 other test skip
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-8/igt@gen9_exec_parse@bb-start-out.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html
> 
>   * igt@gen9_exec_parse@unaligned-access:
>     - shard-rkl:          [SKIP][344] ([i915#14544] / [i915#2527]) -> [SKIP][345] ([i915#2527]) +2 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@gen9_exec_parse@unaligned-access.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-rkl:          [SKIP][346] ([i915#14544] / [i915#8399]) -> [SKIP][347] ([i915#8399])
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_power@sanity:
>     - shard-rkl:          [SKIP][348] ([i915#14544] / [i915#7984]) -> [SKIP][349] ([i915#7984])
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@i915_power@sanity.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@i915_power@sanity.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          [SKIP][350] ([i915#6245]) -> [SKIP][351] ([i915#14544] / [i915#6245])
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-4/igt@i915_query@hwconfig_table.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@i915_query@hwconfig_table.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          [SKIP][352] ([i915#14544] / [i915#7707]) -> [SKIP][353] ([i915#7707])
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          [SKIP][354] ([i915#12454] / [i915#12712]) -> [SKIP][355] ([i915#12454] / [i915#12712] / [i915#14544])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-rkl:          [SKIP][356] ([i915#1769] / [i915#3555]) -> [SKIP][357] ([i915#14544] / [i915#1769] / [i915#3555])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          [SKIP][358] ([i915#5286]) -> [SKIP][359] ([i915#14544] / [i915#5286]) +3 other tests skip
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-2/igt@kms_big_fb@4-tiled-addfb.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-rkl:          [SKIP][360] ([i915#14544] / [i915#5286]) -> [SKIP][361] ([i915#5286]) +4 other tests skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          [SKIP][362] ([i915#3638]) -> [SKIP][363] ([i915#14544] / [i915#3638]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-8/igt@kms_big_fb@linear-32bpp-rotate-90.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-rkl:          [SKIP][364] ([i915#14544] / [i915#3638]) -> [SKIP][365] ([i915#3638])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-rkl:          [SKIP][366] ([i915#14544]) -> [SKIP][367] +7 other tests skip
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][368] ([i915#14544] / [i915#6095]) -> [SKIP][369] ([i915#6095]) +11 other tests skip
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          [SKIP][370] ([i915#14098] / [i915#6095]) -> [SKIP][371] ([i915#14098] / [i915#14544] / [i915#6095]) +7 other tests skip
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][372] ([i915#6095]) -> [SKIP][373] ([i915#14544] / [i915#6095]) +4 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][374] ([i915#12805] / [i915#14544]) -> [SKIP][375] ([i915#12805])
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-rkl:          [SKIP][376] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][377] ([i915#14098] / [i915#6095]) +17 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-rkl:          [SKIP][378] ([i915#14544] / [i915#3742]) -> [SKIP][379] ([i915#3742])
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_cdclk@mode-transition.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-rkl:          [SKIP][380] ([i915#11151] / [i915#7828]) -> [SKIP][381] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>     - shard-rkl:          [SKIP][382] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][383] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-rkl:          [SKIP][384] ([i915#3116]) -> [SKIP][385] ([i915#14544] / [i915#3116])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-2/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-rkl:          [SKIP][386] ([i915#14544] / [i915#3116]) -> [SKIP][387] ([i915#3116]) +1 other test skip
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-rkl:          [SKIP][388] ([i915#3555]) -> [SKIP][389] ([i915#14544] / [i915#3555]) +6 other tests skip
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>     - shard-rkl:          [SKIP][390] ([i915#13049] / [i915#14544]) -> [SKIP][391] ([i915#13049])
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          [SKIP][392] -> [SKIP][393] ([i915#14544]) +8 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [SKIP][394] ([i915#14544] / [i915#4103]) -> [SKIP][395] ([i915#4103]) +1 other test skip
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@non-uhbr-mst:
>     - shard-rkl:          [SKIP][396] ([i915#13749] / [i915#14544]) -> [SKIP][397] ([i915#13749])
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-mst.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-rkl:          [SKIP][398] ([i915#14544] / [i915#3555] / [i915#3840]) -> [SKIP][399] ([i915#3555] / [i915#3840])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-rkl:          [SKIP][400] ([i915#3955]) -> [SKIP][401] ([i915#14544] / [i915#3955])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-8/igt@kms_fbcon_fbt@psr-suspend.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-rkl:          [SKIP][402] ([i915#658]) -> [SKIP][403] ([i915#14544] / [i915#658])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@kms_feature_discovery@psr1.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-rkl:          [SKIP][404] ([i915#14544] / [i915#9934]) -> [SKIP][405] ([i915#9934]) +3 other tests skip
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-glk:          [INCOMPLETE][406] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][407] ([i915#12745] / [i915#4839])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          [INCOMPLETE][408] ([i915#12314] / [i915#4839]) -> [INCOMPLETE][409] ([i915#4839])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-glk8/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-rkl:          [SKIP][410] ([i915#9934]) -> [SKIP][411] ([i915#14544] / [i915#9934]) +4 other tests skip
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          [SKIP][412] ([i915#2672] / [i915#3555]) -> [SKIP][413] ([i915#14544] / [i915#2672] / [i915#3555]) +2 other tests skip
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          [SKIP][414] ([i915#2672]) -> [SKIP][415] ([i915#14544] / [i915#2672]) +2 other tests skip
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-rkl:          [SKIP][416] ([i915#14544] / [i915#2672] / [i915#3555]) -> [SKIP][417] ([i915#2672] / [i915#3555])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-rkl:          [SKIP][418] ([i915#14544] / [i915#2672]) -> [SKIP][419] ([i915#2672])
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-dg1:          [SKIP][420] ([i915#2587] / [i915#2672] / [i915#3555]) -> [SKIP][421] ([i915#2587] / [i915#2672] / [i915#3555] / [i915#4423])
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          [SKIP][422] ([i915#2587] / [i915#2672]) -> [SKIP][423] ([i915#2587] / [i915#2672] / [i915#4423])
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-rkl:          [SKIP][424] ([i915#14544] / [i915#1825]) -> [SKIP][425] ([i915#1825]) +29 other tests skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
>     - shard-dg2:          [SKIP][426] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][427] ([i915#15102] / [i915#3458])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][428] ([i915#15102] / [i915#3023]) -> [SKIP][429] ([i915#14544] / [i915#15102] / [i915#3023]) +7 other tests skip
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>     - shard-rkl:          [SKIP][430] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][431] ([i915#15102] / [i915#3023]) +17 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][432] ([i915#1825]) -> [SKIP][433] ([i915#14544] / [i915#1825]) +17 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg1:          [SKIP][434] -> [SKIP][435] ([i915#4423])
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][436] ([i915#15102]) -> [SKIP][437] ([i915#14544] / [i915#15102]) +2 other tests skip
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>     - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#15102]) -> [SKIP][439] ([i915#15102]) +5 other tests skip
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          [SKIP][440] ([i915#15102] / [i915#3458]) -> [SKIP][441] ([i915#10433] / [i915#15102] / [i915#3458]) +4 other tests skip
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-tglu:         [SKIP][442] ([i915#1187] / [i915#12713]) -> [SKIP][443] ([i915#12713])
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-rkl:          [SKIP][444] ([i915#14544] / [i915#15458]) -> [SKIP][445] ([i915#15458])
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
>     - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#14712]) -> [SKIP][447] ([i915#14712])
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-rkl:          [SKIP][448] ([i915#13958] / [i915#14544]) -> [SKIP][449] ([i915#13958])
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          [SKIP][450] ([i915#5354]) -> [SKIP][451] ([i915#14544] / [i915#5354])
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#4281]) -> [SKIP][453] ([i915#4281])
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
>     - shard-tglu:         [SKIP][454] ([i915#15128]) -> [SKIP][455] ([i915#4281])
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-tglu-5/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-rkl:          [SKIP][456] ([i915#9340]) -> [SKIP][457] ([i915#3828])
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp.html
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#15403]) -> [SKIP][459] ([i915#15403])
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_pm_rpm@package-g7.html
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-rkl:          [SKIP][460] ([i915#6524]) -> [SKIP][461] ([i915#14544] / [i915#6524])
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-rkl:          [SKIP][462] ([i915#11520]) -> [SKIP][463] ([i915#11520] / [i915#14544]) +4 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-rkl:          [SKIP][464] ([i915#11520] / [i915#14544]) -> [SKIP][465] ([i915#11520]) +6 other tests skip
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@pr-sprite-mmap-gtt:
>     - shard-rkl:          [SKIP][466] ([i915#1072] / [i915#9732]) -> [SKIP][467] ([i915#1072] / [i915#14544] / [i915#9732]) +9 other tests skip
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@kms_psr@pr-sprite-mmap-gtt.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_psr@pr-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@psr2-cursor-mmap-gtt:
>     - shard-rkl:          [SKIP][468] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][469] ([i915#1072] / [i915#9732]) +17 other tests skip
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-gtt.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-8/igt@kms_psr@psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#5289]) -> [SKIP][471] ([i915#5289]) +1 other test skip
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-rkl:          [SKIP][472] ([i915#14544] / [i915#3555]) -> [SKIP][473] ([i915#3555]) +1 other test skip
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-rkl:          [SKIP][474] ([i915#11920] / [i915#14544]) -> [SKIP][475] ([i915#11920])
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@kms_vrr@lobf.html
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-4/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          [SKIP][476] ([i915#9906]) -> [SKIP][477] ([i915#14544] / [i915#9906])
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-7/igt@kms_vrr@max-min.html
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@kms_vrr@max-min.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#2436]) -> [SKIP][479] ([i915#2436])
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@per-context-mode-unprivileged:
>     - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#2435]) -> [SKIP][481] ([i915#2435])
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@perf@per-context-mode-unprivileged.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#8516]) -> [SKIP][483] ([i915#8516])
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-rkl:          [SKIP][484] ([i915#9917]) -> [SKIP][485] ([i915#14544] / [i915#9917])
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-on.html
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-rkl:          [SKIP][486] ([i915#14544] / [i915#9917]) -> [SKIP][487] ([i915#9917])
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8670/shard-rkl-6/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
>   [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>   [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
>   [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
>   [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
>   [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
>   [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
>   [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
>   [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
>   [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
>   [i915#15365]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15365
>   [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
>   [i915#15452]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15452
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
>   [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
>   [i915#15460]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15460
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#3955]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8670 -> IGTPW_14227
> 
>   CI-20190529: 20190529
>   CI_DRM_17698: 605176fe40c828b491a1532367df157529895b87 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14227: 13b6d583b5c4295ae214e9134601e8205292c134 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8670: 8670
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14227/index.html
