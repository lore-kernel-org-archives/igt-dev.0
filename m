Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A513C54FDF
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 08:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA1CF10EE27;
	Thu, 30 Jul 2026 08:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HfR3av/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7810EE27
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785399898; x=1816935898;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Gsn9iFr7WXYpzLEpiAvYCeTIindEIqAt/3hZ2Anz5NM=;
 b=HfR3av/gtTYZ61uRgBXB9nZ3NX+/TZYTK2D3yW4MAluiZQUNLGhsfi/D
 /1njPfvZSDl7tcWli62442lT56qFGmMv+lab3H7GfNR7CHQTM1eLykuW3
 1lbvoeMD2LhyBH8jrZAM98R2bCemgZxupyziZDXRxdFuFJB5B7qz6QD5m
 Su29defPU76chUW4WwHFmGELb0PlvuR2KwcZaigcPHkX4hzpdDh2xqzuT
 jBibLUCJ4B6QQwtUPuBP0sbuN0ECObwe1JCaCWWSb0VyIuvKT7gAsVrlj
 X6C7QB+Uxa52P6eo6j+xYgYTs/Frjtn875aSg4nV42MUQAZPevPKMBb05 g==;
X-CSE-ConnectionGUID: 29gYiQoPTxWb4qpgaRZOkA==
X-CSE-MsgGUID: JryMcTPSRWiaS92xWmWQzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86204517"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86204517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:24:58 -0700
X-CSE-ConnectionGUID: W+EjTuJFTn2ye/ru+tjSjA==
X-CSE-MsgGUID: 3AamGJelSDmHa3/cJ/8zoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="253908189"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:24:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:24:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:24:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.30)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4U7mvpPYYjfocwig6/KGCXSW0Iv/7bharfLh9zrr630ZwKzkOUceyj3m0S6ib6WSCeb8PXFp8/xPux+ZPaAPjf7scJ3/V+n2nwYioT+AMLfO9VQ3d1ibquo/RnqxIQ00AGWJFvgsYxsqKJVSxujZ5zlR0ZGms/aODHOHXM5IZDbLt6203D6Q7a+aJ+B60lKgpRsQ3rHgEsnVxHN/2GlzmsdJBh0sKqTr/K0wV8lvoBIhwL/JyREBCTWC0eiktBd+wZ+xurSx0THb/UM1e1Gd3uoezyDm78jY9pXQreEhs87UpMStgzehiUeB2UqMEJk16HrkfJmeQ6un/wxv8t/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynZ7603pioVDWGnHtGNzK45tgDmqiPON5/ogg0A1c9M=;
 b=r6RaiD39nlqFabmyfDCn45dO0TNt00PFzClNj+hWLxOmmNFd6SSrXydH+Owkc9+BCQTJXR3q1KE73Lvtww/GmjSg9kLexmtSq/dDdicCNofhPnzjTvmMlG5P08DVd2kkU0MYNOv+9hqHFBJm8lEu7WROHweAXb/BdV7ZowYfIIKGNBFs01UJ+6/1fzQgnYaIyNdTMYdCj6SVK+2iB56kDm8ehIONkI+sw8VjW2S5Q1tyFPpl6WyoZBn//Wo6QRB332KtCLpCnPxegcSls2Oo37LwdE9D6lrmFhumDhW/pRNXg0rNs2A8qACk/H0wxN0hXkH9lYBHMRlliMDFfha8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 08:24:53 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 08:24:53 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] lib/igt_eld: Poll for async HDA codec probe in
 eld_is_supported()
Thread-Topic: [PATCH] lib/igt_eld: Poll for async HDA codec probe in
 eld_is_supported()
Thread-Index: AQHdFc8wfVZ2/CxBOkevtsW+D2WZV7aFzhKA
Date: Thu, 30 Jul 2026 08:24:53 +0000
Message-ID: <DM4PR11MB6312A7B8AD9D90BB7259E73690C92@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260717095110.4193078-1-uma.shankar@intel.com>
In-Reply-To: <20260717095110.4193078-1-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB7449:EE_
x-ms-office365-filtering-correlation-id: ed294a69-7170-4612-4da7-08deee14081a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 4+4DbyXEZ9ayz3D/YYCJEMqV3UTvTsYK3nqVBNCSGQFWgGe/ZJIAVANHamhXJjEEvKuNiT07gOKPdbGx33qES0QltxImGt+FE8MlRKXnVOAhosfEKwdL5IzTm0WAuZoWn7gopG3JH//KD8lvLglLs4GCK7E+DXV3wVZyeJlCtEaytoR9wmwM4BCwyN3tMn/vYFIGsQb4XPmMGzgr8ES5lJeGIWxCcRmOrUYQnnva45yiL+Rfj3tfxmuEENuvSiID9a/ROtiPl4wSyfJUhigDGPxGbqTGHisAAX6TnxvbEf5HcxxM56+eRFJpp1Pefo0PertcNPyWOL25vtvgi03Y3lbLg05txjCD9+cYeUq6UuxKPEUYXEW9uzfcTR0WhLZPrehkoNgCNyDZZAdB0cCA2Jf1QP0nyZ+3E79LW/cYnnhoQJy3RfJJd1s4uy81IjilO0FLSxKmNxMCfxhB5wa0MrdowXU/iScYL5a2VyGzbe9sQOiXu/lrZmb0WbbRmEtC7HpTcUUC6B0UKnLRUZyqd635EYA530cJM6TNxl0tzXc9Shyv44ZI/IaiV1DPyFoTYt0knbYxAmZV5v2CTtQ/ki6TPldp93i2DiG5xMGfymtdG5PulVIk3PrOVqEAkxBIsSrCNhAwjJWxmuRmcW7yQW/5O0krEHct9SyPsp3iQIqvhiiDsrVdLDJC6UjgPn2sEob79KeTiSv5rHycBFXxDQi97t83oHwk/ILU0TC0epo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zqUMHBcIrjAmoouIiglNcejcGifXm120MO1zIFrAYN5n/Ikly9HpBDIq1m3X?=
 =?us-ascii?Q?Bl/Et+/n+DhlxK1kKwtf3+x1rPEdAN5rCdfYUnwHUxqIeTCkFQmAssbna/50?=
 =?us-ascii?Q?bUkSzkFlhBxkloqQHN3rtTO4sQOhOyxXaaLQ5QoGMub+4VqNhNxx5k3qNOvy?=
 =?us-ascii?Q?9iNOQUUZymkb1QH33MLd0bR1fsYDKVSTP6w3J9PfZtsUlpAJiKixBH1+7QZJ?=
 =?us-ascii?Q?6XEBAD6rlzOm8T0VOzY6YpqUPBifm8I+OKJh7G1gdzuq+GW1c2kXpga8Qpx+?=
 =?us-ascii?Q?c1SVG9nu6XbZT/sCSGZavi7q4yoycvV31AzpW8UHuMHnSnzjXAUVnOvRVEC2?=
 =?us-ascii?Q?AcdxyLpRDEA/BtSAdbyi+jTIigh4SmoyRs6u348bxguN5pIGf10NIzZG3Hm5?=
 =?us-ascii?Q?Jn5t7o0Ti7pileihpYUoBI0cQ09FVJ8LJQCSMqQmWe87xDVVoAUFnfhiqwXB?=
 =?us-ascii?Q?+AQtOeRFzZNKaht64FgK9E5ocaTH2kO4gbJaKQR8+Sygm6kpGEWfSvKlWBcT?=
 =?us-ascii?Q?KZgpgI8cSybDSdDjl8PNNyg1pme/XD8dFml1Gza0tMbBXwjlQ8RkEiBKCGOA?=
 =?us-ascii?Q?wgbifex6FhExelSIWg0LxqLQMC7cy/4+wi+mRRCYoh0p2Ukej3JAX7EsmSyK?=
 =?us-ascii?Q?8cy65TfPDJQL4fEd/sINV7KIqVFLyThOPHG7lUmExekyUnJY7v7Pol+q9aea?=
 =?us-ascii?Q?yKWtUdvSDd2rKawWTd6NBZCzbmBhVVBJ3MtVRZ3DzXGkTOCzhvZLAQU782d7?=
 =?us-ascii?Q?VaGppmFi8R/4kE0U8xNINyN4FTfc7v+cJRnDEF7FsaiBpqVgP+GvrRyo6APD?=
 =?us-ascii?Q?hbacV8O11ftqPMAHCw9g4YK7Z87R3x+HWJSK9f1u/Q+6C2avAx8WjZDNmN1W?=
 =?us-ascii?Q?hMNSPKzk0YpIBqMSvLWwKu+eCPBHnoTeR3bGqDNFFoZ66Q30CxFZ3cFS9QtO?=
 =?us-ascii?Q?H7wbTBrCvbJ3i6Oc9AWN1qY+5KEwII+4JYhYkkdlMAvCHc0wIjbtcSdO6Tw2?=
 =?us-ascii?Q?2Mv6hRenAn5PYdU2VeGGgjQDiV86pvkoZBw+BEAX/KCA43/sJnSpEkrnOTxm?=
 =?us-ascii?Q?Ebx3lSy/03E4RTptioBhKd5ETGzU4Xuhdwj+1A8Rrowpse2hv9Jsb7VcKVAo?=
 =?us-ascii?Q?VAVtPOv1QPSPOiax3RFhIVG6rU9bizoRIROBgZ+EHYjEBZByMG8VM3TPM9nW?=
 =?us-ascii?Q?TwJhmNz+wmyEjeiKFZgsy3AG/YUf9nkwQHVMQXra/7L7tYVsvN77gbJDxBSE?=
 =?us-ascii?Q?/tupu/rYmf6lmG93eLLDr6trtSIU0mRe0delI1EC1GEm7AYVcZ3Rfc162Ysa?=
 =?us-ascii?Q?odtYn18gvFheswvyegZc3Yp+U6Yoxd/DhXhe9gf2TKs7oBTIZNxsXNo1PGHb?=
 =?us-ascii?Q?pUVc0l+hcL4jW3dJhg5S927lelw/8vSijdpRWo59vM4R2yESwpZ67FqWQIWk?=
 =?us-ascii?Q?Mb2Rv5Gr/r6ad9DZGBJRXe67DgW6STxTWfnklEJOlvXBVWp11ompMuS5yy0J?=
 =?us-ascii?Q?K8O0AbOtAFyOQwqdZ2p9ESAXiDZ0aoG2/8ZfbK1J5eK1JB0TQQJ17Mz5CvTI?=
 =?us-ascii?Q?dI+nK3Ix9s+TZQZfDEVjtbIzuz8V4XJ6Koa3QPg1n4O1bRItvLSpjxt/deZR?=
 =?us-ascii?Q?gKaYkZCMEuXNwPqdbL2B3XkyLOYDy1hxjxSWifO1F6OZYr7S99uKq9LS8792?=
 =?us-ascii?Q?0Y8ngJHx5rhE5RcYnhJ9mJbT0+J3KQDuk6XZy0Dv7a8SgZQk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dpQau7zAxsDyDXLJR6weL215Sq7LoFXfD+EMJp3Erfi8HQTtcIiFrRLl2S+cySnHuMoDtuEk7L5mqVBHE3/msdzeC8fI4I/O6CEfRPKJz0TBcADX926QyiK9UYaFyGxxyxGIhchhBE3vVYra5ujelWrlmodLU4fw+gLkh1SWIVMXOHequKACRIpCSuO4bfgplw5tbaTeP7n9kpc+GdQHzLGu2osPfPLehFWzvRAEg9k2qDVRipR2x5EPAc0t0R3UOUi0UxMHxBY9eRjR+/ioJStGwJ2SGli/wS/LSgE7kBHNpll7+rEDqK2av36k/GozrjdwluWlPUlXvaUFH2niSw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed294a69-7170-4612-4da7-08deee14081a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 08:24:53.5300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFbmPyQk6v86VOgIebZXriumm2mAwQJFE9ejhhymARG93kKq0qyuDVmY4d/EswpwjUzVaUB7B8Z79tHOk9Ss1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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

Patch LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Shankar, Uma <uma.shankar@intel.com>
> Sent: Friday, July 17, 2026 3:21 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Shankar, Uma <uma.shankar@intel.com>
> Subject: [PATCH] lib/igt_eld: Poll for async HDA codec probe in eld_is_su=
pported()
>=20
> The ALSA HDA HDMI/DP codec enumerates and creates its eld# procfs nodes
> asynchronously with respect to the graphics driver load and the i915/xe <=
->
> snd_hda_intel audio-component binding. When eld_is_supported() is queried
> before that probe completes (e.g. shortly after boot or a driver reload),=
 the glob
> for /proc/asound/card*/eld#* returns no match and the caller skips, produ=
cing
> sporadic skips of tests such as kms_hdmi_inject@inject-audio and
> kms_chamelium_audio.
>=20
> Split the glob check into eld_has_nodes() and poll it via igt_wait() for =
a bounded
> 2s before giving up. The common case where the nodes already exist return=
s
> immediately, so there is no added cost when audio is already up.
>=20
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  lib/igt_eld.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 6cec9abdd..4a6f867ab 100=
644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -33,12 +33,22 @@
>  #include <stdio.h>
>  #include <string.h>
>=20
> +#include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_eld.h"
>=20
>  #define ELD_PREFIX "eld#"
>  #define ELD_DELIM " \t"
>=20
> +/*
> + * The ALSA HDA HDMI/DP codec enumerates and creates its eld# procfs
> +nodes
> + * asynchronously with respect to the graphics driver load and the
> + * i915/xe <-> snd_hda_intel audio-component binding. Poll for a short
> +while
> + * so a not-yet-probed codec doesn't cause a spurious skip.
> + */
> +#define ELD_SUPPORTED_TIMEOUT_MS 2000
> +#define ELD_SUPPORTED_INTERVAL_MS 100
> +
>  /**
>   * EDID-Like Data (ELD) is metadata parsed and exposed by ALSA for HDMI =
and
>   * DisplayPort connectors supporting audio. This includes the monitor na=
me and
> @@ -266,9 +276,8 @@ bool eld_has_igt(void)
>  	return eld_get_igt(&eld);
>  }
>=20
> -/** eld_is_supported: check whether the ALSA procfs is enabled, audio ca=
rds
> - * are found and ELDs are supported */
> -bool eld_is_supported(void)
> +/* eld_has_nodes: check whether any ALSA eld# procfs node exists */
> +static bool eld_has_nodes(void)
>  {
>  	glob_t glob_buf =3D {0};
>  	int ret;
> @@ -285,6 +294,17 @@ bool eld_is_supported(void)
>  	return has_elds;
>  }
>=20
> +/** eld_is_supported: check whether the ALSA procfs is enabled, audio
> +cards
> + * are found and ELDs are supported.
> + *
> + * The eld# nodes are created asynchronously by the HDA HDMI codec, so
> +poll
> + * for a bounded amount of time before giving up to avoid spurious
> +skips. */ bool eld_is_supported(void) {
> +	return igt_wait(eld_has_nodes(), ELD_SUPPORTED_TIMEOUT_MS,
> +			ELD_SUPPORTED_INTERVAL_MS);
> +}
> +
>  #define ELD_MAX_SIZE 256
>  #define MONITOR_NAME_OFFSET 20
>  #define MONITOR_NAME_MAX_SIZE 16
> --
> 2.50.1

