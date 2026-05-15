Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3164ECD4F25
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 14:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEFC10F550;
	Fri, 15 May 2026 14:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV63hK7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B2E10F550
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 14:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778855874; x=1810391874;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=vVUwN1vSm2m2Goh4tQE2dGrzibu8FWKjSQ/ornqeTok=;
 b=IV63hK7PFcy+N5FmWSiDmAWTDrus7uSI0T98sFglEhY1dfMAmOc53KEI
 VqGBJW4uUb7HrAlFzRuHukTiGWpqJ2FFOWsnqC/X7I/jzMfxe40KHCvvE
 xV1lw0b1QKj0f1TW9G35mqUpMHxXyddDyXtyZw1fa7HOI7L1SGfPRSOVn
 uCJmkLQZURoJ7rUXIoP4t18/Wdrwmh3s1KGmg9KKn4hm0MEgBT9FTtsPl
 yu2BnklnnCycwKT0qAAv6YVtckOhBjlNVnsbLylps35Ih0Kh7a58gQmmQ
 OwN9xwmVFX/bRS4Csge5JKxIW1A35R2lWo7/BXcY+lJGxuMeljkrzXVtu A==;
X-CSE-ConnectionGUID: u3UeHwigTeGU7OJVo37NGQ==
X-CSE-MsgGUID: qTKcnx1vT4OXORBOVLiGWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83668360"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="83668360"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 07:37:54 -0700
X-CSE-ConnectionGUID: 5MFcWjkTQDSmettqAU+AuQ==
X-CSE-MsgGUID: m9eMy8JVQ5ei80b07wusWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="234454480"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 07:37:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 07:37:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 07:37:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 07:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REh9ksJZYH25ZQ22KETtg/AcDN3JuMDGANO1wWOEzaqWl5OSzdy7/dTiLHdXACYBMuSW3Op3OP7a0HAf7/SFi9bzLcyYYweXsUcL6LuD3e2q3MCm79o7Mg4hyc0xzaBnjg9RIKGdzRzcMRu043E6Qy3TYfVSBMWEhury1QALotZGSpdPsfgGmwcc7KteLOs1QzYCuMCpQuPmzBW/ZOt0yRkG3Z7j5lK7H0V68fbbwJJ+5bdyd2CxwadpTY9IZtW1zZaGyRI/wSKPVMpymyuqZgiEzs/ay9T/GESnobKUEq9+DW2i4LvXQ3Dt5Ov+C9P8UlSescxRwa3lwediZnKITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxVuPEe6Yf5GhxBx35/pyScNFZqcZ6IiLLGNNt5G0XM=;
 b=G6p0DqvMdDyQsKDO8J8GZOq5BHsLeGxwxyC65Npl9mGahPD9HLKxvZhCdiBHuQ9U4JedCarU7/w/2KL/7CtJM6KLAN5xw1E2IDa/YbEhcmUScWo+0HDF87PWreayYP8YrjDZuKjyhXqUSngWU2Uya83Wb3iyi2xGjb9lyz02s5M0qkez/P066FbD2Ipur8ksM7PvyCOXu3dOPBBeFbLaPN0ks7+hvSu5xCSIpfKhWkzGxGh8DWtYKYNjq5WNTYprFl85R5PD13E7aZEIQR70u19MWYg+i9D9y3BmdliKqxNZWmv8xUrp+yC7LM9mY2sKvtUPa0yy/QonRDZEdBireA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 14:37:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 14:37:42 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] scripts: Add new script for verbatim sync with
 kernel
In-Reply-To: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
References: <20260514132713.35818-1-kamil.konieczny@linux.intel.com>
Date: Fri, 15 May 2026 11:37:37 -0300
Message-ID: <87lddkpwlq.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:a03:167::25) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 0923b424-5f06-4fbb-65f3-08deb28f8582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: CSOypd1skIDg/yZjpA/Oehn/HcDxf34rL8OfO0eoGJhKKocMpFboxxg+eYlgGBaJsaS2VovIAzdu1ym9F77VhWIwNctg7vAv3U7vghUOWP5t0NrMLBRoI96rPlWlLFTksPJLSyjsCodhplqA9nip1cubMbPUuw1FksI3Qxxw4ANvf/PeXK7O56EO9g8XbQrGU0QCTNDakf8RFsKnvAOBJlNW4nxkM31ts0dzbqywbVVRwiNV48yU8hbmMSKabwuZOcmB4d47jjYWUc7hJuyLOIXcqTNI88hiMP3AIQGjCMBZF3tKTrb2mBZM6TzdjxijbRziGBqbslrPhd0n6H8IOqRwEqfXujGVJKLQodSmIZ8Ai8Az03xq6OxZE03gd+Yyqja2dbqsozL2nVoJe44Q8z39Jd2al2grPNRr07Uh1V4vC7flIpUGya7qPzl2ieSJQSjrWfQWdKwI7lEkwrKZSOnAc7okqvB/hcTmvhFLf9ngGGvAKYgygi7uZP3MHl56iFPwGwFJWviuUYiJGSv2j2Y7yRWZ5XPW2PV5MD6j/ccdpJ8WfnLxAjOrNF4fDROaFYC1R8WYb35SHAeLCRbiG1MZbqyp3oZxQMXcDbWOwqk6h7xyAuZthcNmKrHLtXD7V20JlqITbLTCh2898kqKRx8ou00xCcFrx2aWDWUnPwKk77nCD8IeWNiJUHnlbAhK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(18002099003)(22082099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NrWkFaMWZnY01UbU1DempxQkNkQnM0YUI1bG0rU1NzZVBtTzB3cDdjaFVT?=
 =?utf-8?B?ZVpqMWtjWXFXTnRFZFNEUjJoOVc1Q2JUQlQ3NkZ5cUNVVE5OWjhGYmtOUjRL?=
 =?utf-8?B?cHdmbHh4L0s2bkphNEQyeUw4YlgzNEQ0Q0hkRTZJRnkxVXpib0FJajYvekFR?=
 =?utf-8?B?Y1U1ck5xd2JJVHo0TjlZNFByYXBRcCs0NlFvZE9uRkJqTTNQN1BRRHN1NGJF?=
 =?utf-8?B?RUFCK2dBNGZYbnR1M1ZrQVZjcG8wS3JsWVFtRnh5SkhyUHJBYlZhdC9RTGY0?=
 =?utf-8?B?dmxNZ3FISjFRUUIzNFI5SXM5R1JzSHJoLzN0VmZOOFg0NEVvS0lxeFBteVY3?=
 =?utf-8?B?Zk9sQmptWU1RL2FEdTFuVWl2L2tGZVliYVorcGZHSjgrV2habmg2SDB6UzEy?=
 =?utf-8?B?SWNKWVpoREdPSWFmV1c1QlZxTzJiZHJleDByWFYreVdPMzd3V3V5ZU1CaW1z?=
 =?utf-8?B?V2xMc0s5OGUwU05XVHVtRGtpSEhaODV6enpIbUsrdG5lNmhkMnExL25sM0Jj?=
 =?utf-8?B?cXpneFJSU1FhTWdOUDlyMytPd0cvRGRrTU4xZ2FyK0V3OWRvVXNDTC82S25P?=
 =?utf-8?B?NXJMVkxIYWN5ait6SUg2SXhXWGVpR1pqS3ZGVlFTWU5qakUvZTNFYU5POGxm?=
 =?utf-8?B?cjlqMlVDQjBkRWF3ZmRvckJhZ1lkejRSWHRWT2QvTUlHdGczS1JkOWl5QUlm?=
 =?utf-8?B?YUY2dWtLSkkrOHM3Vjkyc0Ezc24zdW8xRHJha1dEM2VUOXlpWTRMby96VHhv?=
 =?utf-8?B?Q2JobHVFdmlmbDUrTmVlVEJFS2JFbUIzLzNFNU9oeExVU3FWUXhKV2I3ZmVL?=
 =?utf-8?B?UTJHTGtubURFRVRmalYvYllZNEVqbnpza2ppR0Z2T0VjdXRaejcwVnhVRWpj?=
 =?utf-8?B?dUorNG5Yb2Y4K2dKRVZmQUdodUVNL05uTzBKNnp3MUtFNjNaNFpHamhsVkNh?=
 =?utf-8?B?M0hTb1dlSVhvak9CS1hNN2hjNWRpRzc2QkhPeFQvU0hkWlpzSmdTZHhhNnNK?=
 =?utf-8?B?eEZjaVZHU0dVRktPUUpGTWcvYU13bjZTQ1dEWjJtU0QwMDU5TzlvU1JhdzdO?=
 =?utf-8?B?enh1ampKR2U0OFFoVUMrR3F2dlltTEduMHByczg0THRzUnRXbTNpSit5M01S?=
 =?utf-8?B?bGlXVWVxR3ZBM2dMTWNDZXc2ZWdZM0FWNlpWb3dRT1hDNmc3QkU2SyswcWQ2?=
 =?utf-8?B?SkhidFVzRUthc2hUYXliaTg0ajRRS1VhOUcrTkY4dEw4NjNOUVNWMjliMGNP?=
 =?utf-8?B?ME9CMEMzTEVWSmtVYzlFdGRzVG9jNWtHb2g1UU5WZjg1YWcva0dxY0pYaWRT?=
 =?utf-8?B?RFBBWW15VXJQdGlsT1hhTVRPdW8yeTkwb2FIeUlXTmFlYVhic2dxNkVSalR5?=
 =?utf-8?B?WThzeWFsdTFUQmNkSklOT3ZuMDdvT3ZmWEk0Q1FHcFRvM05wTnlKMTA5ZEFn?=
 =?utf-8?B?aUtaUDAwenUxYkt6a3JERXl0MXhzSHlZei9KcGoyb3Ezc1Z4OTM1Q3FXNVd4?=
 =?utf-8?B?TUZQU216QW9mR0p4ZjB0b2lVcS9MYWN6ejZ2WEI4Ly90VEZTbmZwRExiUFEr?=
 =?utf-8?B?REFhbVJtVHVUNTZDU3ZGcUF0VWRGOGM0YlpmcnRldS9EckU1eHRaNkFFWGhn?=
 =?utf-8?B?QVFqM1Q2ZjZLSTJKRTZSTFVQNjczbzFock5XanNBUVJWNlRuS2Zic3IwUTVJ?=
 =?utf-8?B?QkowM0dqZE95dGpYQmtlenQ1RjB3TTR3eTVOdE10cm1DcDZMYWs4bHBpOVA0?=
 =?utf-8?B?QTl2V3A0dlBOeFV0TG1IWXpzaTl1aGJHQUwySFBQTHJ4UUNhRWFZdzhWYklX?=
 =?utf-8?B?RjZqUkhOYlhRUEh0eVY4K3dwZGk4TGxSQUJ5VGw3a3dtM1RUUit1ZWVsOVFR?=
 =?utf-8?B?Z3h1akpTdXR0RmErY3FLT3dDbXpaZm1LQlJJdFpVUENqZTZRNFh3NjVQSnBa?=
 =?utf-8?B?bkZNNUVDRVZtK3lZWEtsRDVZQ1ZMR1FIOFZvUGNrOGtBT1QxOThlQ2VOY3Bn?=
 =?utf-8?B?TUlKbkkyM2VHYWZsakF5dHgzeG1vWUx3NUU4UFB2MzVSLzlNb1dmWXVVWDB1?=
 =?utf-8?B?NjFtMHNid2MxbUptNHRCeFdybjNJNk1Lb1YrS3hrZkM1SlM1K2JreS84RFRN?=
 =?utf-8?B?Q1pRNzRRbkNmN1VncTBMd2wvajJPbVBDNDBGTnFFTWhlbGxTL1VRVTAzeE5v?=
 =?utf-8?B?alltS3ArV0pOOWhxdkhDVnpJcUdDbmJ6WjNXSUV1NS9CZ2lPQVBJeGhCbEtK?=
 =?utf-8?B?aFY2ODBHU3lGbCt0NktkYndoZ21CK1NWZjRtdVByYlc0WE9qc2xrV2c0Uyt2?=
 =?utf-8?B?bnJqaEdvVHA3S2tWSEpNNDVIUXhSVk5DQ29ObWFiWEZWM1cwL2p2UT09?=
X-Exchange-RoutingPolicyChecked: dzGRgveauj+4cbhv6pAe3BslMvdchZZvADFEuSN23foIzuiNTdSys2+WslXI9bK2+ynPBycK9DuqWnCWrb3C+eExVuyFSPHvyCW61uLyQ0XaXwExRebvsu3oSUDnMGJs6XL4YY9xgmtUfdSY5tuuA+UrrPQL7B5g8DyMvwrf5T/zqxvQUy9TxYV0/5X+Z/rfvwrgrVJRs2Zm7E52WWATB3slHNvpllCSkpzoy5jXzW8U/ItzkPC0swDusI6afNXiHM9jWkSOL2UqMI3XOoccYzLHJe6Wgto0bWiTQ52/I/hIYFUImCKVXEjNQm7iDOgYRo2KS1r/szaWXRBIlmb2jw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0923b424-5f06-4fbb-65f3-08deb28f8582
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 14:37:42.6681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvPERZJTukff9ThJfHa/jLipzKungzXKyvu4NjYfIIDC8vaqIB+E4azVDKpxKFCC/D/Gra/JXjaUSxd3XEeNQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:

> From: Jani Nikula <jani.nikula@intel.com>
>
> This is a helper script used in cases when a verbatim kernel
> file should be copied into igt-dev.
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  scripts/sync_with_kernel.sh | 57 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100755 scripts/sync_with_kernel.sh
>
> diff --git a/scripts/sync_with_kernel.sh b/scripts/sync_with_kernel.sh
> new file mode 100755
> index 000000000..65753677c
> --- /dev/null
> +++ b/scripts/sync_with_kernel.sh
> @@ -0,0 +1,57 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =C2=A9 2026 Intel Corporation
> +#
> +# Author: Jani Nikula <jani.nikula@intel.com>
> +#
> +# Use this for verbatim copies from kernel into igt-dev-tools
> +# Change paths to yours, update the repos, cd to IGT, and run.
> +
> +SINCE=3D962601ac4c78

So, the plan is for us to keep updating the SINCE value manually? I
wonder if we could do better.

One idea is to try to infer it from the files in the IGT repository: for
each file, we can try to find the latest IGT commit in the format "...:
sync ... with kernel commit ...". In case we do not find any, I guess we
can fallback to using ..HEAD as the revision range when searching for
$last down below.

> +KERNEL=3D$HOME/src/linux
> +IGT=3D$HOME/src/intel-gpu-tools

I think the script should not assume specific locations for the
repositories. I think:

- The location for the kernel repository should be given as an argument;
- We should assume that scripts/sync_with_kernel.sh is called from the
  IGT repository and we can infer the repository toplevel directory
  based on "$(realpath "$(dirname "${BASH_SOURCE[0]}")")" and "git
  rev-parse --show-toplevel".

> +
> +declare -g -A map
> +map["drivers/gpu/drm/i915/display/intel_vbt_defs.h"]=3D"tools/intel_vbt_=
defs.h"
> +map["drivers/gpu/drm/i915/display/intel_dsi_vbt_defs.h"]=3D"tools/intel_=
dsi_vbt_defs.h"
> +map["include/drm/intel/pciids.h"]=3D"lib/pciids.h"
> +
> +cd $KERNEL
> +
> +for infile in "${!map[@]}"; do
> +	outfile=3D${map[$infile]}
> +
> +	echo "processing $infile -> $outfile"
> +
> +	last=3D
> +	for commit in $(git log --reverse --pretty=3D%h $SINCE..HEAD -- $infile=
); do
> +		if ! git cat-file -e $commit:$infile 2>/dev/null; then
> +			continue
> +		fi
> +		if git show $commit:$infile | diff -q $IGT/$outfile - >/dev/null; then
> +			last=3D$commit
> +			break
> +		fi
> +	done
> +
> +	if [[ -z "$last" ]]; then
> +		echo "last update to $infile not found"
> +		continue
> +	fi
> +
> +	for commit in $(git log --reverse --pretty=3D%h $last..HEAD -- $infile)=
; do

Do we really need the intermediate commits when synchronizing?  What
would be the value in adding those?

> +		prefix=3D"${outfile%.*}"
> +		base=3D"$(basename $outfile)"
> +		# ref=3D$(git cite $commit)
> +		# alias: cite =3D log -1 --abbrev=3D12 '--format=3D%h (\"%s\")'
> +		ref=3D$(git log -1 --abbrev=3D12 '--format=3D%h (\"%s\")' $commit)
> +		git show $commit:$infile > $IGT/$outfile
> +		cd $IGT
> +		git commit -as \

We can avoid changing directories with git -C "$IGT" commit ...

Also, perhaps using "git commit ... -- $IGT/$outfile" is safer than
using "git commit -a ...".

--
Gustavo Sousa

> +		    -m "${prefix}: sync ${base} with kernel commit $commit" \
> +		    -m "Synchronize ${base} with kernel commit:" \
> +		    -m "$ref"
> +		cd -
> +	done
> +done
> --=20
> 2.54.0
