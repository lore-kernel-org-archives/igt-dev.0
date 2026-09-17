Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144DBC88E72
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 14:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F70210EF18;
	Thu, 17 Sep 2026 14:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cySpnxaO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73BB10E88D
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 14:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789654766; x=1821190766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w4Oe+WLbY668C7tOxu3Cwa1QoOXGXbtspvyTrrryof8=;
 b=cySpnxaOGsYfBqMb+jAvc9LRyxKCpSbUrup7V12IOy/c/eE5VHHB/BG7
 Rr7wbIyCyl9/oQ8Lgn+Lflnbw+lcLuJWiQh3Xor5DBML3yk5R3TMRHTAZ
 2W79YWJJlnhhik3ZesAWgbELSlA883kUga7PCo+gReVi3RIp6BH6tCHOv
 Xps8tLGQgc1u8l8Hbn59TpU+UuCNUO38iA1ZWolJCBUAIkrF4495PwO6p
 KScMBKXXvLXE5elxNtlsSYMj2rirI78pPfPwfQ00UGgtU6265wD8ACfV5
 ebbOk6qE55Bq9ik68OlJaON76M3okDu8lnk4lQcFT7vCVInZRJN59Edqy Q==;
X-CSE-ConnectionGUID: mdQUmlOmTR+tn+SnDz3fww==
X-CSE-MsgGUID: GgdxbKw2RUSYrCpBinL+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115617548"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="115617548"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:19:25 -0700
X-CSE-ConnectionGUID: uFEHl0s3TgG3AYCpBXSsjg==
X-CSE-MsgGUID: I/JuY60RQ92+8FduzG6vJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2003213"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 07:19:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:19:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 07:19:25 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 07:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYPDhlDTXKLM+6exqhuj6bL3/PERvS9jcr8GLaMRQCSSHv3D+ZuMaLNY+3EP6Sfn6kGzLGCOhVBK7yPDTnU6O2aEV9iwEmWTyOV/a2KH5FztF4uuTo+8HFzsvm+kpiLas26QThI14THccQob21PZ96s3bPnr5jVNM7aWgs4TajDgUm9soTWVqzG/rnZsD+k6lJJboMtHkEQESa1Di4afXnGFeoz4sXAiXz4ZFpfPli+zc4PqxPcZ6Q6l8YE+sbZBd+YA4sZFq97uKRTt2UIH/n49zYziWABa4gaFZiD8BQGQoJuUQ+7dQWrJ8FCHAgu7H6l8EBpjuCYXB5XNGA1ddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJQXGCdMGIxdXv60leRpMARk8lYSF6iFY5QhF9g7kcs=;
 b=WQmFw34rxtoFbLYoGxm5osNXA2n5JoHLj+PlWzcCbXcQoQB2j10e5QFVrTCTIEcXFJzHdoPygC64KPF9rDLMexApd1Y86YvU7Ps56zsiH9mVFgUSWBN1W8rRUwiPyCo0sCLHY4Ho0p3j8hGIa+qAthcixiJbiqyz+Mwbp+N4NLe19Ut/mbTm/y4Legz9dnfo2aWjlyakn/kSpzDIZ/j25166MTLThFPMmIq4Al3l/fkt3jZbT8Mf6DqNrgX/GIC/DOJ5DQcStKpt8lb5+YidQwHUlILhK/mJioGYDpolmE+fHYcxVkLTDnEscE8bEiX/NlgA5Z/dzcLOZkFRGA/soQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA3PR11MB9464.namprd11.prod.outlook.com (2603:10b6:806:464::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 14:19:18 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 14:19:18 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t,v3 3/9] lib/dsc: Add
 igt_get_dsc_sink_compressed_bpp()
Thread-Topic: [PATCH i-g-t,v3 3/9] lib/dsc: Add
 igt_get_dsc_sink_compressed_bpp()
Thread-Index: AQHdQjC7LM4PlSdnR0+plDqzqsyiirbS2gIg
Date: Thu, 17 Sep 2026 14:19:18 +0000
Message-ID: <PH7PR11MB6796A804DC5AEE8BDA8AB52BE5B82@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260911210709.943683-1-swati2.sharma@intel.com>
 <20260911210709.943683-4-swati2.sharma@intel.com>
In-Reply-To: <20260911210709.943683-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: swati2.sharma@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA3PR11MB9464:EE_
x-ms-office365-filtering-correlation-id: 73a05dda-1453-418e-e2b4-08df14c6a964
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|4143699003|10067099003|56012099006|6133799003|11063799006;
x-microsoft-antispam-message-info: a0XBYxuY0aYaCfB/mHsxdGzdlpnT64NWR9lZhPpKct9pBOFgquwuUxzpKLSpy+yjF6Cil8hkBn79qgnUBfzzwc4CyOnK+vYt+YHQv9MajZEbuaa/ZwKJQjt1PQ88yuWO/Yja1YsoSgkwD3vWAVRsLRUjEc/0pr9JLcd+Xg0fpsUBxiHoxK1wTQOWDs+PQOevWKUGdUwqbEIgD0co4m1i+jGr+UlBD/JRBe7094W9UXc8jrXJTW9ncwfEOt3f3NIkp+ef48eRYezfgtYpodxQYc5AyakQZnSF7nB6z1l20+GWaRf1R1GPc+2ru3ihspQu69oF28TtWKx3ha8U9LQzdVaOIF9+pbomCklLDCStWtMMBHSL6ovIubu5t23K7YmNNIrySOXcqDYspXtPNpr9QZHdNrDauQd6BSEuX7Fzwr82quJtBHatWS+xvWpb9KsGa8hjKV3iXGojdMr8J13fU10zqDFNplBdkXhVCFfQnv9D+BFeosLJNJ9KWUTzedaH8TF5p8zfYBduwu88qd3FQBSYIJUfBktx6p/1lLnAf8Lfz6XtRl5h3OFVT9EW7snFX//UVRvoaXdMGvx2hxlAkebDfxJWeWqF2cg6CN8GWP4Qf/ZrefLJIVXcMvZAkLw831lxggFatWm40yoE2xLWxg2bJ/5mYk7J8EqICQJ5cZn4VQu46AieWa2gUuY6EvUtvBskOgcYO8WIiz95vbNhjSRDoUBKRRwyCRxyoF8i39I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(56012099006)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S5ZoFJykmWL4jZG8PQ6FBj1EDdSh+WHcqDaqU7eDjoPREwDm6ziLPAh2UZzf?=
 =?us-ascii?Q?cYLpYKV4/8Dj/0l3GV5VWT1XtwDZvkUD8+p0DAzMeDxBP/27wZBS9FCKSdJP?=
 =?us-ascii?Q?w3qjuUnj1g2rZXwNoYp1rH3dg0YR8DKISz1egpA2lexojPt17zzTY3p5NkyS?=
 =?us-ascii?Q?9UXbl/ewi3IvDOwxEpQanTAL1SiwIsyNaI3Clq6k+mYjqfiErBx9G33GvODt?=
 =?us-ascii?Q?HxcljZrYtUIR3CyOX8zAxi0ci8qoSpFg1n1GMEe7hM2t08lBGSqxUkr9RHZx?=
 =?us-ascii?Q?9cqV8bwnaejc4JmdicmhdMmmih9FSXbOiU1weqAaoew+2bEHY9bVuf/sYt2j?=
 =?us-ascii?Q?RDs8Q7SrtXhGfnCGCmOr1NHc/Z7TLrMsrKqGadKm8qyS3bABY309Iq+duhSB?=
 =?us-ascii?Q?h7dGHnV4B7gw7YBPmUhJeDrp37jPIml3rIaFGq86U981BIewNvD54Zee6wOj?=
 =?us-ascii?Q?9JTLAvu3BK0TCzyWYKqZUAXrMX8YG4RbHzxdPJvaRBsxw/W17KYIj1d2Iqkm?=
 =?us-ascii?Q?9MudbQ+7pnFLSF8oTAOOvc/19IYZX2hKn6tw5iRlfkV+dfQj/FWW1tPToh6Q?=
 =?us-ascii?Q?uUiz6EMR9AXVQiPj0r2Wkvg97yJH8JdzSBiS5pbdIyKTabdOUru0BAtbB2Kg?=
 =?us-ascii?Q?DOITYdtA+zv7ka8FbnRw1QXN5qvjdXN6JdxvPYL+H/rVZ20p75SJBJKl9jjg?=
 =?us-ascii?Q?MLShue7iexxU9XoLfD6bVt1gURcWLpFIN5jGPEb2tCyw6K+uteC503TrFYTY?=
 =?us-ascii?Q?hjpaX8HdJp0boU1R+GzMis6Tg4Cfpg+x3pZYR1HzJmdF/CKP9J/CwxxL5MwO?=
 =?us-ascii?Q?C1PWa1eowwugRyKg/A96oe4Sdt9ti5JpXefr9bshCsbOryxmUiCshD/ePs/J?=
 =?us-ascii?Q?v7YTb02BIa9uqjjaBFQamuttqbfsyE4JjUZsmhOenHQsi8jUBpv2UcIi7Lge?=
 =?us-ascii?Q?o6T/qYABEwG/07IKcIghd0Ki8ooyQ1nC3eUtCLXEOYvhR+cLF8xjVgrUaFIb?=
 =?us-ascii?Q?ic7lPT6fUAsvmtSfHCeuiBpjb7Jc8h1jdQPAtmbqc/fbZEhJTc1ZGVqk/Idp?=
 =?us-ascii?Q?Fkq9V018r/DwNZPsRmFxsg/8h/vayoAt5szX52ZApNBGYJqo1irUAufEsNW4?=
 =?us-ascii?Q?ZdFHoflt/KL6abdvnNoS5gV6hvbnB9SF3oWtufPRO5HbFM6RPn7jnO4w/2K4?=
 =?us-ascii?Q?3TpRXK/0cRvAIHBTmzoH8Mbou3Mgfh2/qGa9Zl4d6zfsOK1Y0aTwwsY902m/?=
 =?us-ascii?Q?owIgtU9U89dhDkpgJ+Z1EtIPtexUtJkNIW2u8vq5oXW0qGiFgCz46shcGdr7?=
 =?us-ascii?Q?GxlR4vZ6N7KB/1SD8ZA9X5dZnYV1CdF1KtkpSJtwRmKeqt8nmJu62YzPC8aB?=
 =?us-ascii?Q?p9wvedbVL6tLlM8QDZdLXWkwvKSZRa98w24kkl+5YHlQknewU1h6HjZKe145?=
 =?us-ascii?Q?LRLd0wd6vvSPnzx3TgNaYHajxm06aMcdLGySNPY+DiuDEq54peWDAvehQwMD?=
 =?us-ascii?Q?yv2qKnSGSdqI7XuWn921L4zdmkrpZD5X+H2JtxHzpjqoLjPOIRIMENBN5+Rk?=
 =?us-ascii?Q?OpValxwRWdyK6wDGJX8MexRX4Q6f79Li3nudgVQUvRxsyD2muqJKyc7jbn+T?=
 =?us-ascii?Q?Mk7hifuzLHUIQQKvBvQ7S6ze06XMKDVQk0WY5nm7Q9umDYq7dIEhUS1dKErg?=
 =?us-ascii?Q?wU60xK+nzxz/kJKSe96ysmyF47sddB5stMAcCFy/cvNuO2Q7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Hmc5buRKbuo3A5rK/JemixErgrBQnuEeQgwlowOM8gL/9JC13N8hoOdr7IBHJIFq68SfHXqYY5I7FgRamO131jjgRXh72rMtqxetrfu9FMpBaw3XWGUng5sRtabVgx7v2GM86o9K4lE2FeiO2zV/BeEI9GCIlki12Ns3dZOh5JgxynZhTDPT0gVbQRXsCaCWAkBRJbSwncOKJ5zEUO9NgTLxijLFNGteTWBaKMKjMCPSSIEsJkMcsC/zZPCoSUXrJvxK3EhC977M3RgpL8DDq/Mb+u3Vtm3FTHzVcYrvjbXnCOhns2XGMj4NU4p+GGmML+Kx8avb0+AaF30Li6edcQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a05dda-1453-418e-e2b4-08df14c6a964
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 14:19:18.7724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r8af+2ZHEGyMEhU51HZDVpAuLLUzEfi5BV9lkfHZBYI2yXyZW7EBB2zesPdNWk8NJ13oVc88RGPwZM3Ti8ouVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9464
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

Hi @Sharma, Swati2,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: 12 September 2026 02:37
> To: igt-dev@lists.freedesktop.org
> Cc: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t,v3 3/9] lib/dsc: Add igt_get_dsc_sink_compressed_bp=
p()
>=20
> Add a helper to read the active pipe's compressed BPP from `i915_display_=
info`
> debugfs.
>=20
> v2: Rebase
>=20
> Assisted-by: GitHub Copilot
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_dsc.c | 38 ++++++++++++++++++++++++++++++++++++++
>  lib/igt_dsc.h |  1 +
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c index a1d98500a..0f938284e 100=
644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -378,3 +378,41 @@ int igt_get_dsc_sink_max_slice_count(int drmfd, char
> *connector_name)
>=20
>  	return max_slice_count;
>  }
> +
> +/**
> + * igt_get_dsc_sink_compressed_bpp:
> + * @drmfd: A drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: The dsc sink compressed bpp.
> + */
> +float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe) {
> +	char buf[8192];
> +	char dest[20];
> +	char *start_loc1, *start_loc2;
> +	int dir, res;
> +	float comp_bpp =3D 0;
> +
> +	snprintf(dest, sizeof(dest), ":pipe %s", kmstest_pipe_name(pipe));
> +
> +	igt_require_intel(drmfd);
> +
> +	dir =3D igt_debugfs_dir(drmfd);
> +	igt_assert_lte(0, dir);
> +
> +	res =3D igt_debugfs_simple_read(dir, "i915_display_info", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res > 0);
> +
> +	start_loc1 =3D strstr(buf, dest);
> +	igt_require_f(start_loc1, "Pipe %s not found in i915_display_info\n",
> +		      kmstest_pipe_name(pipe));
> +
> +	start_loc2 =3D strstr(start_loc1, "dsc-dss: compressed-bpp:");
    IMO, after finding start_loc1, also locate the next pipe boundary (next=
 "[CRTC:" or the next
    ":pipe " occurrence after start_loc1) and restrict the strstr(..., "dsc=
-dss: compressed-bpp:")
    search window to end there (or use strnstr/manually bound the search le=
ngth), so a missing
    compressed-bpp line for the requested pipe fails loudly instead of grab=
bing a neighboring
    pipe's value.

Regards,
Sowmiya S.
> +	igt_assert(start_loc2);
> +	igt_assert_eq(sscanf(start_loc2, "dsc-dss: compressed-bpp:%f",
> &comp_bpp), 1);
> +	igt_assert(comp_bpp > 0);
> +
> +	return comp_bpp;
> +}
> diff --git a/lib/igt_dsc.h b/lib/igt_dsc.h index 0ba06d8c5..f895af7f3 100=
644
> --- a/lib/igt_dsc.h
> +++ b/lib/igt_dsc.h
> @@ -31,5 +31,6 @@ bool igt_is_force_dsc_fractional_bpp_enabled(int drmfd,
> char *connector_name);  int igt_force_dsc_fractional_bpp_enable(int drmfd=
,
> char *connector_name);  int igt_get_dsc_fractional_bpp_debugfs_fd(int drm=
fd,
> char *connector_name);  int igt_get_dsc_sink_max_slice_count(int drmfd, c=
har
> *connector_name);
> +float igt_get_dsc_sink_compressed_bpp(int drmfd, enum pipe pipe);
>=20
>  #endif
> --
> 2.25.1

