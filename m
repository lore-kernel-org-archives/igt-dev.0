Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2580EB7ED7
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FB210E176;
	Wed,  4 Mar 2026 12:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KWzoRgDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F8110E176
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772626673; x=1804162673;
 h=content-transfer-encoding:date:message-id:to:cc:subject:
 from:references:in-reply-to:mime-version;
 bh=rT4W4Xr7qK4MgMS+dREc4SwF3Gb5O4sRLq8CjFyD3BQ=;
 b=KWzoRgDmKeDuUnTZyb6xq4FXOVRTodhm4zBchDSAQYDo9IUNCEVnEiqr
 SY70vBxnVuV9tkk3KEfsLqvGVsCx16MJDvAykRczvbQYi3Q6tIPziD+CQ
 sNbabR7hqjJhtaUvMsV1k/eqXZs2EjJu/YGozWkK/AUHUJKN9GGVLeBYl
 B+9oSPEytZkZVRQ2JGbEAz7TuRM+N29EAcrMy4J8x3uwmdW3+baprDHkK
 DcCAbXBhDOrY2E5GEFggiFtD/pbHXcKpfRezuGdgpiWSB7zRS0rwtCLwx
 UH5VW4CEO/xNp0vC9EnI3AZ08aauM2dNMhasooZijL18H1x1bKk/WL0lF g==;
X-CSE-ConnectionGUID: iLZf+W7+SpWGpzS8DEUCJQ==
X-CSE-MsgGUID: BYtF0/gkQjulxACq+vUXuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73558604"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73558604"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:52 -0800
X-CSE-ConnectionGUID: NqIyBTuLSNivV10jyZf1Bg==
X-CSE-MsgGUID: 3HX/s9f1R1KuGMffnI2I6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="217482831"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:17:52 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:17:51 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 04:17:51 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:17:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJKFI5F/v2poSSyM/2OsvSL4GuPkDFq5Iq9/jAX9w2ocHheyOKe3ULWv4OpuDhS5lY5YaCExISdJEL/E8YzKy+2Tekn5N7b0XlNHuXDhMinqgkNQ3WxYzfJeFZqjHP4PL1IeQhtvoErh2y05ufG5Nvb6NMPN4tigYPGxTldpWWc65DKw1L2xOfwTEpBrIYCpXX4sek6GJVAk05gtuDeq6NPhHPGQYEK9wdjcHM9r17xbWgCvaoZNVtnW0rHHMMMl9a2fLlr6mlpCkOg7peGr8j05aOoseQzQBd6PRgrBHdzOlSov2obQ3uRKtOd8VoMDZ3K9Ritwm+3FDYzBZoFfJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKwCKNtk6USr8qF9wftfkl6/B1SDTlsPm3E1wPddd/Y=;
 b=qt0J4Doq+xLrKIEsB2Pa9poTQ8rStKcqAxAhRP7Kw47LtAFfHa00FQKMhS1VdmjFI4dUhA1YIZahMbcSy7BX9QWWCUJqqggef0gVQCPm0OQwzUMq02iz5uHC+K5PxKMO6Qif5slzVqe8UwM12i7LSRHa4/9zg++Rn4ZyxPnk6trFdpPXQLC3nEBC16Lf7Uu0wBLs0jl5/rfWkdFhgjQpaiteFJ+fd2Cgp+SU3Z7cXMFWyIwMxWhYcwRyBrenhHZJ0vUhUO4VTF/0/j/a0YTPXCOxJrHnCj9I2QTGBza6pf4DzpjUwj9KKNAPUyWK0LOfjj17j7SOf3Fq1EXon1zjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 4 Mar
 2026 12:17:49 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Wed, 4 Mar 2026
 12:17:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 4 Mar 2026 13:18:22 +0100
Message-ID: <DGTZQ1600RUK.2AL8PWUD7IHL9@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v1 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20260304100553.3075443-1-mohammed.bilal@intel.com>
 <20260304100553.3075443-3-mohammed.bilal@intel.com>
In-Reply-To: <20260304100553.3075443-3-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA2P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c81b3bc-651f-4840-58e8-08de79e80d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: nNi3XX4St1cZAIW8mm8klF7tZ7cUINgP1xTPMohZEB8s+yn7wFHyotUdyCTz20PcMlBOpk+tI8O1lXb1QDlPiFkHqcxaQ4HR2sdp79FrFTzpEykp3HiZG6yIWzX2RcTjk2JY2SsGmuiiSsNTIIe6QbJMG/GXS46URZvzzP1jl5ESj8jqU2iqgl8VuUgaidKg70nZI+2cAdKpXj+sLny42qEO9WDKPm4w2lITZeuIJZkzybuX4YpDCgmDWrSNuukeCq4OBOYgfRrsf1PxpiOoeb+8EJZbxpg/k0yS+ZF8zCU8ne819vlJRTrQegIV/ahIa2jO3jPpfL/f4I2pBZK6xKAiERq2wM9wi7jbWDmvNdfhf/F/HWyc7uV3T9YUkuDnhV/NFiYpn0HIyVpURpG4ty/YmRBdH8cihy/lxzI1oPp7M3eNAeWpo1l/KWzWALN02w81DxKWtsa2NqwQ4yjNyuaIpEdA01IqXnY3nGbPCVv8Ps6DRFRzpkKx96U5IHUBclFiB7tbgCKzVAD/1NMM/ceH63teweoH5yN+h15Kxk5OrbWCO6AyWEvyZl22zwVAybDBDB62qX+GI2RAYlWG2Z9JGaW5UCW76lSKUb9YVngVkm6MzDAnnb8xrqFdZCdpuVDrW8zt3ToYgnyt94FUFWCumT18jisww0FTOVtR7z6uMnosfrANL54KgxcKRYBSav+OXfHUuSj6/D2ZestfO/6eYeJsDD98G0rBQqnIb4Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkVvYVpyM2RxZVc4MkVkZUFVVlB2cDJGZ2VXRzJKTmZ2OEdnOEtkRkJKZGRo?=
 =?utf-8?B?dTNsclFPNlFZT3RnemVGNEI0YTRobmIzVVlUb1VIc2RUM3JZcm14L0lsT21M?=
 =?utf-8?B?a2FGMFZueDdnTVBhbzdVSlh1MEF3WDRPcXd6eTFJWXgyeFV3MEVSclRZK3l4?=
 =?utf-8?B?bG5DSmlpNWw2OUVVUkFERFpBM1B4USsyelBQRW5CQmJXallyTXVYb04xYnI4?=
 =?utf-8?B?Y2NtSXdHVFZ2RTlFZ0pKdkdiRzc5R1h4OHVDTHFKdlNSTk03RmxIbHJvVVpC?=
 =?utf-8?B?MWV0bFByRlQ2eE92dVB0MmM0R2MyQm9oek9RRGVHYlpWYk9VRkpsK3lNSGlR?=
 =?utf-8?B?VW1kVDVvTDRpUFdOWHhEYmdmdzI2TWtCRTMzWnAwd3FBaEJJVGI3Y1VFZ0ow?=
 =?utf-8?B?TzlFRXFUdnRmRUJBWThnU2I5NUdWTTRCbFdTQ2doeFoyczlYUDNHZmlPRXVx?=
 =?utf-8?B?ZTR1ZTRnK0VHZHdVQ202TkhaSFlUUGNseEdVZTkzVXhJWGdRV1VYZnptTmNM?=
 =?utf-8?B?aUIvTnduMWJZZlp2azN3eGFiN2VOM3dKN3NFTDlZNWJQcHVScEUraHM4aU5N?=
 =?utf-8?B?WVZudXdXYzZVSUR1cE9wY0ZFeFRZRStkeEt2bnJwSy9tUTM0M0hFdmlPQjRm?=
 =?utf-8?B?bGlGU3ZjRWNHODIyRnpQa3ByZE1ZeHJKbW4zUXpvUEZsWENOaFhvazQwSzNB?=
 =?utf-8?B?eml3bHdoaXNsSHRtOG9EVlZxanR4Yk1ZdmkvbnQ5a1crNFBrUDIwSkczeGZs?=
 =?utf-8?B?ODg5Y2hKT2JLYy9FSUExU1QybnQ1bXFsS2FTdEs0eENJcGQ0RFRHc0d6WEFZ?=
 =?utf-8?B?SFRpejUrbDNUWDFyUGU0dGlXWkJncU5VR25uNWJOV2dFMExjcWhBRU5acXAz?=
 =?utf-8?B?M1YyTXlXK0trdWhMN0lPNldKR0ZmWDVKbC9GSExqbURla29EaTdTbzJkY3U1?=
 =?utf-8?B?WGN4Z3RPb0JublNGb0dRcDFzUitCeVNKdWJkWUxuc2NQdnordHRxRW1TSDB2?=
 =?utf-8?B?Z21pUlROWTJ4UzNsYkhJNkg5UlhzZS8rRXEvYndEdHI1TFJyR0lCMXlVOWNT?=
 =?utf-8?B?ODNHUGhoTElxLzdJS1JFZnhXL1BWUjdLdEJyMndpQWUweUpWMXVoTjFsTlBH?=
 =?utf-8?B?bThkc0oycTc0SmF3Qk1oRkRqVmtDWEVJS1BZTVJLVThyaE4wdXg3cE5pSFJE?=
 =?utf-8?B?akdxdmJmUnJFZTZmbUVzL29Ca3UrOHdxTkxITDA1MEx1aG03SmhRNUJHN08v?=
 =?utf-8?B?Z3RWZ0FtSFQzLzFNZzc0K3J2TlgvT0pxU3hTU0o5YVpZMWU4NCt2b3hZRks2?=
 =?utf-8?B?aFUxQUJ6TDlFanBibDdlZEl4K0M5bjRkd01LdDlMbUxCL1JHeGs3ekFQZGRn?=
 =?utf-8?B?VTNFY243SSs3R211bk9mWVB1bnozWDVXSEVHaE5GbkZ1R0ZaeE13TlN6c2ZZ?=
 =?utf-8?B?RHUrWThwZTVEeFBNUy9kV09HQ1dnV29BZjRNaVdjQTZHVHN1Smt3YkRsNzNx?=
 =?utf-8?B?dWlYWWVGTndTRXdqZElDMFo2eDdXQzhSME95MmVvVDdLaFNmNTk4Ky8vaVZQ?=
 =?utf-8?B?bUhvNFhnQlRLcG1vUjRXUnpoWGd0cE96OFVxSUJmSzBVRTlnSDdYUk52UXFY?=
 =?utf-8?B?bmMvalhleHp5ek1LY3FvV054RERiVHBOQmdGdVRQbXZSemdVWXpTKzI0Vjhu?=
 =?utf-8?B?bnlmNUIzNjh1bEswWUVZRW52ZGdsR2Q1Tjdwa2kyWldBajE3TjM0YUhEZ0I4?=
 =?utf-8?B?VWtmUk5vSmJBVUw3c1V0cWx6bXdnRUVUVUU5Y1NWbEtIclJvTW1lbS9ldERC?=
 =?utf-8?B?Y2Vzdm5JaFI0L1pCZjZLTWVESE9JWlBzbzcxeEtySUVrWGl1Y1JrQ1Z6T1Vs?=
 =?utf-8?B?V0JKNk9rcjBLclR3UFFUL1YvR3BrQnVvb3JiamJoTGdPbFhFVldmRWxWWU9w?=
 =?utf-8?B?MHlHUkZPNmJ5MHR5aWNUUXhFWlBvMktzaWRPUFBYQ0s1eE5rMDlIUnB3Nm1z?=
 =?utf-8?B?cnRVemN3d0NHVmsvZHNEaHNtc1JhYUxKQ1lXcGJZYWViaVZWa2Erd09HVWkx?=
 =?utf-8?B?a0kwMFgxaDdNZENvQ3l5NnE3ZDZvVlJZNjA1TForZDNVRkZSeS9wNGV6V1JO?=
 =?utf-8?B?cXBSOE5KV2lsV0VVaUxJRjMvMjhzdWxMa0tsQUdWeUZ5dmVNM1RzeXZ2M1Bl?=
 =?utf-8?B?N0E4YXA0ZjhSanJ4RDZPd3RxN2I3TlVIVmJIT3lWVlEyV1lLMERDS1N5d0d4?=
 =?utf-8?B?QnhhUVc2dmt6OE5JSG1mc3NmcW9mUGg4S2VjNWxvYVM4NGsrbng1U0YyOUc1?=
 =?utf-8?B?cWRqV050RUJjbkQ2Zm1URTBtZ01sSGtWMVZnRG1nbXU1bWVwOHpmVGxicmJT?=
 =?utf-8?Q?sH3DGZNZnl1HvMPw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c81b3bc-651f-4840-58e8-08de79e80d01
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:17:49.1959 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSSiDb9ozFy6D6sz/DeMpkEszfSJQ3yCB7eHvAKwcv4a5q3bP/8z8XDQiONCFaw02CmYdHdqe/5/f5bZ8ddchKRGHqgrwe95TmrQv8WJVD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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

On Wed Mar 4, 2026 at 11:05 AM CET, Mohammed Bilal wrote:
> Fatal assertions can bypass cleanup paths, causing resources to remain
> unreleased when failures occur during audio tests.
>
> Replace fatal assertions with non-fatal checks and route failures
> through a common cleanup path to ensure proper cleanup.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  tests/chamelium/kms_chamelium_audio.c | 43 ++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_=
chamelium_audio.c
> index 2967e3c50..41cbe92d9 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -426,9 +426,21 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
> =20
>  	audio_state_start(state, "frequencies");
> =20
> -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> -		     "Capture rate (%dHz) doesn't match playback rate (%dHz)\n",
> -		     state->capture.rate, state->playback.rate);
> +	/* Initialize heap pointers to NULL so the cleanup path can safely
> +	 * free them regardless of where an error occurs.
> +	 */
> +	channel =3D NULL;
> +	buf =3D NULL;
> +	recv =3D NULL;
> +	recv_len =3D 0;
> +	success =3D false;
It feels a bit messy to assign NULL here, it's cleaner at
declaration. Plus, we don't really need the goto logic for an input
check, the original assert was enough since it's just verifying the
function's parameters. Ideally, this whole block should be moved to the
beginning of the function, before any init.

> +
> +	if (state->capture.rate !=3D state->playback.rate) {
> +		igt_critical("Capture rate (%dHz) doesn't match playback "
> +			     "rate (%dHz)\n",
> +			     state->capture.rate, state->playback.rate);
> +		goto out;
> +	}
> =20
>  	/* Needs to be a multiple of 128, because that's the number of samples
>  	 * we get per channel each time we receive an audio page from the
> @@ -447,10 +459,6 @@ static bool test_audio_frequencies(struct audio_stat=
e *state)
>  	buf =3D malloc(sizeof(int32_t) * buf_cap);
>  	buf_len =3D 0;
> =20
> -	recv =3D NULL;
> -	recv_len =3D 0;
> -
> -	success =3D false;
>  	streak =3D 0;
>  	while (!success && state->msec < AUDIO_TIMEOUT) {
>  		audio_state_receive(state, &recv, &recv_len);
> @@ -460,13 +468,21 @@ static bool test_audio_frequencies(struct audio_sta=
te *state)
> =20
>  		if (buf_len < buf_cap)
>  			continue;
> -		igt_assert(buf_len =3D=3D buf_cap);
> +		if (buf_len !=3D buf_cap) {
I see why you're using goto for the cleanup path, but let's tweak the
condition so it=E2=80=99s easier to read at a glance basically, failing
if buf_len exceeds buf_cap. We could also handle this by checking the
divisibility of recv_len and buf_cap instead.

--=20
Best regards,
Sebastian

