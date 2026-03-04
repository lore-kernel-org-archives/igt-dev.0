Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A08EB7ECF
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 12:54:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE0E10E9E5;
	Wed,  4 Mar 2026 12:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBs8hYcY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F2E10E9DB
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 12:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772628841; x=1804164841;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=9ywl+scjTLJQZkP0kvoO8w2OPUbaIFoEBnyut891WZY=;
 b=RBs8hYcY4JYYcEMhb6tN3+U+yJrHhyN8qivCx+fb6Tb1uB0pPocpSBou
 jzREGPyoB9goJ4/mgMDPAAxPFhxzGfuXKUtcsqhYDfBUA8qixLKEtHi2g
 g8tAfH3tBoxQCdVjeKoBMOffDACgiimKPO0JXGODFTFGzejEmxlzC7wTC
 NM7YK8oKZOje9pdxorO7LNPs5GDQTh67pafrxmqnuisZAdQDHpdsO4FrO
 fLjfIj9LqLj3fRMG3J5z4V+yx3uKTBbQw02QShW7RScD89t6NlmiaA+Fv
 ls4b7KOxBbztoFprtdZaZ47FyAbMGuUrOBHz9h+wVkwogoGeYV+8oivza g==;
X-CSE-ConnectionGUID: eej3lCEzQFyabUYgbOnVQA==
X-CSE-MsgGUID: 0FvZYkWZR6SjTuqKaDBMvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="76288059"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="76288059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:54:01 -0800
X-CSE-ConnectionGUID: nzGQCgU7SfKnkUmHC6oSxw==
X-CSE-MsgGUID: L8yFI1LURQiaflDojgCglQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="222504113"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 04:54:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:54:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 04:54:00 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 04:54:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGw3Zsa+VS42mevIwxvr/2GnJrO6e3S4MjItYMSSIS4S0GklHfGIIH8bbJuubhJT7ZhxVMnEaMBP6rZrvasM1YG+HeXffiNW6YltlfKcp/9SO5TBcEXCW7QSHut+/08YhR0/tP/CH72hK4+66AKo5Gw30GWoLtEkfXfZGoZQSgdovMWGWbpiu8wTeZTBq1HEwCqW+snwCRoEJPt3QjuZz1BULKjjrMf+6mL5f4q/YAReGVTHYXW6KNBqLo8pjHyplln+Vt77on46ppSDViB8GqyeEAQzzZURWAVXOTzKEb8kK9dBM41DTPehFIcKFLvKNSTGVk38wSe8zNuxNNBMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qiJaYbNIXazfyDjDwdGV3swtAIIW2SlRtD9L2qUNfM=;
 b=qehhRuPRc6VJ8R746isflqxui2LtuIIk5PihjXcMjYc34S9/KV1PuNjp5nnzzBhYo2GmAdi/1DecvoneTDp2qMj+geAhnZtm1G+tJBQLGFpEmUb9h5puggCq2oPrkwFNESMOapn+zvwh8IL2sU0otSDOIlXTm3Bg+r1E5Lqi92mkpGxpSN+DqSi4CaJvo7FIrMqPcJSmPtnfUvCWt73sOY0OL5X4WhoRvNOCKLanNMYFC/CW9OhO6bN4z/v3BH1CVQVTNqqhk4pRplzygqqikTfgyJRniPKzOIacKERm1HmVohwX7KUxMjCFfIFtA30Ecs5gzRhDMAKz8PRyTQ1Jew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB9614.namprd11.prod.outlook.com (2603:10b6:806:4c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 12:53:58 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Wed, 4 Mar 2026
 12:53:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 4 Mar 2026 13:54:31 +0100
Message-ID: <DGU0HPHZS65P.25DVXEFAUQLWK@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_vrr: Skip LOBF test when
 aux-less ALPM is not enabled
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <kunal1.joshi@intel.com>,
 <sebastian.brzezinka@intel.com>
X-Mailer: aerc 0.21.0
References: <20260302151547.3041214-1-mohammed.bilal@intel.com>
 <20260302151547.3041214-2-mohammed.bilal@intel.com>
In-Reply-To: <20260302151547.3041214-2-mohammed.bilal@intel.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a14606-13dd-42fb-832f-08de79ed19da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: r1yzTW8UDdJ0AO8k2DCNg77ZqBc1myrXyEOk5pK73AN8KrID7PfvXpYmJiC7eRqvQ9tB32uvvcXQRIkZU8xZJI/tbK0OYoLaKe0ENRFQ9KhX5vn2+WXeKUY51MlyhJxPEmiG/CbAlrcDXtOGM8gpKWopLaJtNjSvTMrFhAV7PIG8QSUG1y2RPql5YzZW1vhPnQhe26d/bp5L7hLVDF4bu1UlXIqFCHYW8dqPSqHRKdChEHn4dEcdgxFnEpq58vsxX2CWh91sLPLjTSWTh1cMJJhyhgr2NHjQYZuHEyjtf2wJjYm3G0viH4h5SNnkbd3DW8FzHCx1oDlyTdVzkcspCXAlDODjOtm2Sxcsmea7Uc5Ku5ogjrxqA8k/XzanDzV8/UtJKDjjFYF6RnmIZ7Fc4/vcxUkUuX7jVmADJZgShruBJcFpsyxXnaxrbPEKZ7D7Bl7RG1cLVHPnSBbAUSSNklqNQEs6oIQ6GqfHe7UB5GQoLhf+rt9BTFEydKNnO4JwGvb5/RYzNxUZteF6kInRbEMPpKAtdsiBxpRy6xuvQxp9odCJBXyRZPpXXeEAxa1afQcaBSCh22zf2b6u74/vV8uVvsdvfSkgGj9cfQfzHx9NJtRoZOrpGKBslutJQDOGnEZezKvXDOXOq3faofoB0hrq0oKFByKGGLv3+AXdmxr5yGd/Q4bU8coiDsT+sYLy9tW/WsOQlaz+jp65Jbx6KyRVG7u+gXATAzFu6oEfBHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVpvYmJxRXhac21oalYvZGZpUTk4YmdxVUFZZDEvd0hvWmZ2b0l3eVdHc3ln?=
 =?utf-8?B?bysvNXA1ekphL0swT1hwY3pHSVl3M1dPNHloL21hQjRPdzNaakVhMzZxc09N?=
 =?utf-8?B?TW42YkZhVllFVWdZcGRUVnhmNWhLK2Z1aXFtenBoNWkzYUcvNHlERTNnM3dk?=
 =?utf-8?B?K3A0Q2dUZkZFdmtsd25RMXlNMm55UWNxTWV1bzRjNm1UTUU1NW1xVTRoU1Ax?=
 =?utf-8?B?L0NJWjdYR3E5Z2kyMGhnai9IUlRYT280SVNDaEEvWllpWGJJWlE3aWxCbEFL?=
 =?utf-8?B?bHBDb1lvZUFVZVp6aDdBUHYva2xpVmh2Mjg1NC9OREtjTVpkZktqV3hPaU8w?=
 =?utf-8?B?S2Z5OFdvT2VrSFF4UzJ6M2xTVTNTRkxpeUNiOTZTRVYwV0hIS20vYml0TEJ4?=
 =?utf-8?B?NlBXaEN2TGFsbTl0SVRYdnV4dmlHZGMwKzNZMC9CL1hzaitsbzZYaDZlaTZ0?=
 =?utf-8?B?ckdMZTFyWVpkdW1EWTFEZW5qYmpsWnZQdHFSVzArUlVTNEtYZ3dXb3VVM3Iy?=
 =?utf-8?B?ZFFtbTF0UUdoMVlkV0dUbFA4b2VXdWp0WVZodk9TdmhWOUxEdEtPd1ZtNERx?=
 =?utf-8?B?cllxcHlwNDR2WlBQU0V1bVIzWmoyOFMrY2tyMlNBUFBHZ0FHZ1NGR2NFT215?=
 =?utf-8?B?V1ZNR1lQV044TW5yL0ZkQkxqTlViWmNFOTVBVnZ4cXBHSFNaNCtZUzY5d1lE?=
 =?utf-8?B?Q3ZEdGZ3Qk5jL0RwZHVkajgzSW1tYURyZ2VrM2tUWGNzc3NPQWFNaEFYU1ZB?=
 =?utf-8?B?REFCdkNZSFZySXdvdmkxWUdaTHpRcy9mOXFOZDFmdlkrU1FSTHNPWEhqRkI5?=
 =?utf-8?B?amIrWXpqV2tqZEptbWpPcm9wcHFuY3hnTWFVUUpwRG0wcFZXN3V0czIvVTU4?=
 =?utf-8?B?SndObU9TUVlkVlYwQld4ZEQyZkNSR0N6MGJuYm1EK284elZ0dUpDRlJ0VzBJ?=
 =?utf-8?B?U3Z4Z2RSMGIwWGN1YWlDSzlmbzczYnBSdU1uU1l1TmtSdlMreDdlVzYzaURa?=
 =?utf-8?B?WUJZV2pDRlNONUlrdEVmT3NSVE9reElwaUtaNVQzZTlyK1JzNTVpL0dadTJL?=
 =?utf-8?B?NmdiR0paSjZsSUptdUtPajlidXZDV1ZQb3VvUHg4cWZFS0FCc2RLU0lGZExB?=
 =?utf-8?B?cWlqUVA4dHU5THpSWEFvbk12UWcrUkdpb20yU1ZSNnkyUDVXMWpQMyt5VDRN?=
 =?utf-8?B?R3Jyd2dQM0dxVzcwYlFvVnFIeXpVOGpmMXFiZzBOYm1CNnZMZHI2YkZFeXdO?=
 =?utf-8?B?Y1dlSXpKZHVTYXVLUmQvc2c2MEFra0tPeFU4Mm16UE9KbjVTV01wTC9waGM2?=
 =?utf-8?B?T2ErN1BBTE13R0pHZnkrR3hnY2xoUUNydHRJS2tsZjNPNnF0OEdCRFNlYjAr?=
 =?utf-8?B?YlBUVGNXMXJjTCtPMjZNMk13aDBvQVN0ZU1GdTBRcTZpMTk5SnJPV0NxN1ND?=
 =?utf-8?B?SGVPSjVjbzA0RlJPTDhRZTlKOVZobFBBeERpeEtrMU1lODBFODJjQlk1ejZp?=
 =?utf-8?B?UVhRenFxa2NudVg5STJIT2pjeWljVkJnTDUxSzE2SysrRmVubkdpM2JPQ2hD?=
 =?utf-8?B?V1hXcEE3L2tUZ0lTYTdadGZQMmdmVFF1eEFKU0h4Q01VL1Z4bW5JUzU0NzBQ?=
 =?utf-8?B?dVVQbUljaWZaU0FWR1RRa3pMWUdhcjluS3RGRTk5eElFVG9NdGY2Ync0RWcy?=
 =?utf-8?B?bldWVjViN250dXM5eHBkTHZtK0drU1M0VzJFbGY2bTEvNWN2YVdYeG1mSEo5?=
 =?utf-8?B?OVc5eWdlc2JnbURGYWVmckpBNjZnTW5PenFJUHM3czBKb0pWQ0hUYmh4dkcv?=
 =?utf-8?B?N0dMaUkwaUU5cFY1T2V5RTJCbHEzYUhXc1ZRSDgwbyt2UWtERUIzQTJwWGJu?=
 =?utf-8?B?cHEvci80eHU3QUxzK2M2WG9wMEVHcFhOWng5WWx4YzMrTWFtMmxxQ3R2NUNv?=
 =?utf-8?B?UDJGd0lLS0ozZGRsbmxIeEo3ZzczZWphUlFtbmxuZG5pNWVqQ1ljdWVSZnh6?=
 =?utf-8?B?T2k5MDBDcGxYV1hNWGMrbUJSY0hhVFpndndTRzkwQUtleWREZDg4dkNHd0E0?=
 =?utf-8?B?alhMb2ExQmpoQVlPbU4rNWFXekxZVzdGUFVoQTB0SlF2OG5zVUNsY2xZRDNl?=
 =?utf-8?B?WDFZSHBlelhjdSttUUxZckZoaGQwVElRSVVKaGNZWUd3bThpN0VrUkR2bm5Z?=
 =?utf-8?B?OGJNckc0RTAwWWI1cm9UV1l6N3piQUlMZjRNeHhhcTgrY0xBTnR6cmoxNjdk?=
 =?utf-8?B?N0YwZ2orTnAyM0VWU09FRUVjZkEvaEpZeWNFWFdkVG8zc1c2R3pDeG01TzRy?=
 =?utf-8?B?VDBPbGNhc2V1Y25pRnRPNnhSTTE1aWJzK1cxekUvUnVFdzdUcHlNZkUrSkZL?=
 =?utf-8?Q?+VpFhOcuJwBUEgPE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a14606-13dd-42fb-832f-08de79ed19da
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:53:58.2670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5fGK5oFSYLotvvBP09akHQovBqVCaSonARJOR2DmbQJdSAABI5SKRRjhueIcED9WLNMYXftta6uDozy6kgzkqN2va6OuJo/zyQiqNNPRO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9614
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

Hi Mohammed,

On Mon Mar 2, 2026 at 4:15 PM CET, Mohammed Bilal wrote:
> LOBF (Link Off Between Frames) is a feature introduced in eDP 1.5+
> that can operate in both Aux-less ALPM (Advanced Link Power Management)
> and AUX-Wake ALPM modes.Currently, the test relies on Aux-less
> ALPM support to validate LOBF functionality.
>
> Add a helper to read the Aux-less ALPM status from debugfs and
> skip the LOBF subtest when Aux-less ALPM is not enabled on the
> panel, avoiding false failures on systems that may only support
> AUX-Wake ALPM or lack ALPM support entirely.
>
> v3:
> -Rebase
>
> v2:
> -Update commit message (Jeevan)
> -Update commit message for LOBF/ALPM clarification (Kamil)
> -Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
> -Add explicit null-termination (Sebastien)
> -Add igt_info() log (Sowmiya)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  4 ++++
>  3 files changed, 37 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6087de365..1bef7c124 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6575,6 +6575,38 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char =
*connector_name)
>  	return strstr(buf, "LOBF status: enabled");
>  }
> =20
> +/**
> + * igt_is_aux_less_alpm_enabled
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Check if Aux-less ALPM (Advanced Link Power Management) mode is enabl=
ed by reading
> + * the i915_edp_lobf_info debugfs.
> + *
> + * Return: True if aux-less ALPM is enabled.
> + */
> +bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
> +{
> +	char buf[256];
char buf[256] =3D {0}; <- fell buf with zeros

> +	int fd, res;
> +
> +	fd =3D igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	res =3D igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(b=
uf));
/*and read n-1, so there is allways 0 at the end*/
res =3D igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf)-=
1);

> +	close(fd);
> +
> +	if (res <=3D 0) {
> +		igt_info("Failed to read i915_edp_lobf_info for %s\n", connector_name)=
;
> +		return false;
> +	}
> +
> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] =3D '\0';
That=E2=80=99s how I=E2=80=99d usually do it, but yours works too. Overall,=
 it looks good to me.

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>


--=20
Best regards,
Sebastian

