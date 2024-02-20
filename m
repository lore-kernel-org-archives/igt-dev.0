Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF8EC48BC3
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D056110E515;
	Tue, 20 Feb 2024 18:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/9LudE1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6163D10E516
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708452122; x=1739988122;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=S7fMPjC2YRoZwOZZrc35qfqa2NqgSzsafM/tFZ9RUBg=;
 b=K/9LudE1ff1QCn1GNEjYC2VpxD2sRey/d/kch8QLs4+mJgACzxz8ITYE
 5xkRcFKCmukMXTLb1Yhj1A5ALZXMX0koaDgn9eVnj+nPdd+dTfp3BtP2i
 HEKgoE1BhW7EM25LpvcxsaRbD7TzTbzNXGlo7y2foyc1x9oh19Ma0AjtO
 t4pJglvtAOFWK1Y3XO0STs46WIZMfjwb/ByD0SR50Xg6bE/8L1X7KE6dj
 WLTaliIK9WcKN264D+EPRv5/wFkrFFSMbxXOcHS7O2Vs8abfmTGn9XuAd
 EsyBKp1Q6HUJTGG/VGZhcQV6QdAW3HUPEJyQmKnRAJvuN8YPb2rAomzXi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2434631"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2434631"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9524348"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 10:02:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 10:02:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 10:02:01 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 10:02:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBoC8J789C4U4nFjloyFtO8XSXPjUlp9MxUE9/XQ8bNcL92zquPO60CWcgGFjelUNWhO/L9Wo5xvj8s4q5HtN76IvLPE9OGkqn+r5TkRCPODI0v+oKdx1erq7DfHCIeFC1Xz0vot2rtKYbwCEr0jNNF2t2cA8dSKcwLJHAXB2EjJqRQbCh9r8leHD/IEcqNAAbccXbOEN5v55/CwS/Sq2h/ztSG14LZtHpt0lySq9P6tRu/Cra8WsIQMqhKnsmB7nSdchSo5p5cNe9phnz0GejZJUAlWmnAcmjlK/XMrkZ36UFZMPCIlez5kJbjtAk/umDdRZYnunKK2y83iDjHRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfT5DTVdyYX8HsSAZDsMPCn/BLD4r1uBoOAjjUU1bSA=;
 b=Z2hyfDTCvSdPlO55BuFdVCHT8421ZHGrhN768TSGJy1NDkyDO8EHI1XeOK6uayQ8yvpOLgucwAkq8aiTxgNSdCBk1i0WdHgfroaxfY3RyQoEBtcZbpG3E2/rICfygd0Sv9oIDpVbq/jjUiL0fedSF/DwstsTxhRzBjEBKouIl9oriV47shwJlNofq8ZDPREQpwRKwbCdYGs0oMEfs0b2DpXjMh7aCA86wQQPbt/SgI9pcfoTUQE85EBIe+Aw3iz529I6zxaxy3Bc7+uMEmjDt/H0Ci/B19SJiwhbwie+lleNSq4giHFIPtLAguQRxMzcAQUQOXI3DZAQrlyzUKdL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 18:01:59 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::64e6:ee24:79f8:efa%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 18:01:57 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240209135526.135380-2-gustavo.sousa@intel.com>
References: <20240209135526.135380-2-gustavo.sousa@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate
 cached stuff
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Date: Tue, 20 Feb 2024 15:01:50 -0300
Message-ID: <170845211015.44184.10125779397878338003@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA0PR11MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 2827fa44-1950-46b1-2112-08dc323e070b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8JM13+Yp7kmGRtH9aaqUIIpapUPjfUgqhtVnwphhtiDk2QP5wahE4dk0v9i3lppuVNR/Pyvz+iOu+XKX0yoCQDWKeoyaJ+LMdmQXBhs4kC+YKgUhjZ4VEu50KOBg0dL6tkP61g8dEa7VmFhJChzaXjkQAS5PZNgYn8CIYYcAFjzo054WTypw9vDWY3PfHRKBohBM/apO5ig8A6O9S61Kocql966ayIv7lo2t3DgKUtqEgSSNzv8NSGwMOSUbXAcBkenunleCjytOjGEkSDcKBSI9VXjiVT98I8IDP0QtvSiV3OU5d8dcZBBNhTUp+PqohHm/1kzQ41v/Tsk8lUMKc/3ujCBUxo/+XbGxpEv7DUeXKcRBYvnyQl/7XilWbzOo2y854Iu3U+n98okhMmH4PvZIaQLDvyYBhFn8weXTgiOz8k5/3BMa5xg0EWRs5t/V36d6tNcI1z0l93P0xVz/CEDqSrOKmPBFUSQQQW4bLHqrkNYYf0vdP9IAQJOnNVFnTs9ed9UVZWS0vjP8g1wdjlT35qH4JrZvnYWDABfGog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFZFbDc2aVZoUmJ6UW1PakJ1WEdrVmw0RXRnejZuNEtmdWJIMGNFei9iVHQ2?=
 =?utf-8?B?OWlMenJCYjRYK04wWENxUUgyNldDVDg5UldzQnpGalpGRFIxRVlhOWJDUTdF?=
 =?utf-8?B?ZTB1SWM5Vy95dG1Nb2pvQXJtNXN5S1BiM3J1c1dyQ0NwYXlmYi8vb0dhVkFl?=
 =?utf-8?B?ZWZSelUrZ1JTWno0NzJXam03WVo2b0xRN1ZxUXpNdW1VdjlvemZNVEg0cHJX?=
 =?utf-8?B?TURnSmtRQzFvZmVEZFBZays3RUc0RVVTSjBtSGgwRWdMNmpacDV3RExPZTNv?=
 =?utf-8?B?eFJ6Mk5CNUpIS1F6WGdZTnlvTEVjLzBRRlhVTDNrTUo0cGVxbU5CR2F6UmJU?=
 =?utf-8?B?OEVmNVdXUDZ5UzBrQVI1Y3JzaGFDUFowVCtSeGJxaTJpd3VNT01SMWJXWS9l?=
 =?utf-8?B?RnZaK0N3b2RmT1BtZ3hqM0hCNkVyVlo2T2Y0SDk2c2VsMDRRcEtuVHBJVnBx?=
 =?utf-8?B?Z1JFbVBPSEV4Y3djNEFTK1BLK09RZUVyU28rcFdOOWxRUEl3N0dMT1NRdE9G?=
 =?utf-8?B?K3RVNldKWHBsNnkwRGdRUHA4YzNCbXN3bjh0RXhEZWI4c1g2T2M1bUZ3Q2pF?=
 =?utf-8?B?YndWcVVlaGpLZFZQY2NwcEwrdCtvNm43c3d0V2pOZDNpTzVGSXFhTmQxQmRV?=
 =?utf-8?B?NTkyeHpDeTlrZVBpKzQ1aG5JckJYR3JCTWErTU1DSnJIa0piZ3dzK05BUUlt?=
 =?utf-8?B?NUFYS2ZlN3NINWRyZHBNVDhjNTRyNk1yZkpKWjdZamxnYzdXZGJkQWJacnRG?=
 =?utf-8?B?eFdvSWE2WWI1dFJEVmJNaS9iN0hmcFZDY0Zzd3VhMk9WbmhRMUFmNERXdG9m?=
 =?utf-8?B?S3F5UmVOb3NyVHNYenQrd1dyYisveTBnc3YzV0VIYkRaWmR4Q3pVOEJEY2xl?=
 =?utf-8?B?WThiTjFVVmpyWGVhakw2aHhpMCs3OTBhdm9OL1h6Uk5OKzFIajk2U2xHUURQ?=
 =?utf-8?B?VVptcnVzMVlDNVl3UVlBK2g1TzdHQzFMYzQvbXVkdEltRVlVU3g3ODhoOWdQ?=
 =?utf-8?B?UFBtbXRTVmZqUkQwS1U5OVdJWWFwb0pWNldoT2FQSlNEZEJhc3hnUG5WV05S?=
 =?utf-8?B?b3l3dHhWNHdVU1BIZjRuWld5QjlVejd4bHJXSG5SdytMZXZMZHF5ZzdRQjBu?=
 =?utf-8?B?bTVDL21tWjg5VzRuRzhIRnN5WW9FVGV4ZERET1hZUm5WR3Z4NkJIcVFJZk1Q?=
 =?utf-8?B?aFNSMVVUNU9UemM0VFcrcllXWkgxNFdBVU14ZVpDUjMrUjhUWCtVM0t1am14?=
 =?utf-8?B?a1JiTE8yZUNBdU1aU1RseHdwQXB4Ly9tTWNMMTRXemxCZmxaY3NJcXBoRUk2?=
 =?utf-8?B?U2JaWnBkQkNGK2MzS0l5Z3VZY3cwY2J3TU01a2c0M3ZNOWNNYUVUalB4bWJU?=
 =?utf-8?B?UTNBMDRJMmc3RGVVK2hzaWlmMHY4WHIzSXVkbTMrZnEwcVUzTXJGblFRZ1Jn?=
 =?utf-8?B?eWZRdDFCcnU0TVZBV01IOUhOd2FVc1d5bm91QXVWbXZFc0wyZGpBbzBXZVZy?=
 =?utf-8?B?V1pyb2NzVWJDTEFZKzRYdVJxOENvLzZwUFRlTjdoZXlOU2EvUHh5bE1RV3Vh?=
 =?utf-8?B?a1hqdlZPQ05BWm1DY2cvamtmOVllcW94OEdYMXRlTGExcXphUjFSa3pra0dw?=
 =?utf-8?B?QkZwTEVHRWVYSzBKaFIzS29OUWtGRUdROHE1SlVOc1ZsRHB3ZjVKdXQ4b0di?=
 =?utf-8?B?WThRVlR4c242QnBtREh0MUcxazlsSklIbXZwaEtBaHI5VTZadGF2TVZhZmwz?=
 =?utf-8?B?TTJ3MUdyL0hRYno5N0g5dWhBeHdheGdOK3hWeFdXMHE4NVJPTy96SHFrRjVY?=
 =?utf-8?B?Tmc0bXNzL0IxTERKR2swZVhBNWFielNJVlNEQXp6Z2VIUS9XVFJNMmsxWXhp?=
 =?utf-8?B?WGFqNktZdHVUbGJMY21pU25Sb280bUtkNEdJSWtNQkJNaWZ0Y0lRZk5XZUU3?=
 =?utf-8?B?cFJYTlRYMGcwTXFPcDFzdDc5MllhejhnSFo0bWI0MFp6UEtGamd1ZGRvaVpT?=
 =?utf-8?B?T3NqakxGaFBMd3lhYUJQMTVTTlExUG9YYWZmazJUSmtnU2REZEd3a01XM0E4?=
 =?utf-8?B?U3pmZm1kdmdKYXEvQ3FTOWFQZUUxR09BazRkRzBwZVY1c0tPUEZEWWhLUEJH?=
 =?utf-8?B?M3V0VVhHZXhUd25OSWxHYVZpaFZ2SHQxTEt5b2RRaEZJN0JnQllSL1orK2ox?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2827fa44-1950-46b1-2112-08dc323e070b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 18:01:57.0486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww/IeoyN4UIZypo8wM9RnnwX01LXZMM+zCOlhZOjqKpz5UtfEG2tr1oV4JFqxFwk1M3EE+HZ9oiWbROpu7Rfag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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

+cc Ravi.

Quoting Gustavo Sousa (2024-02-09 10:55:27-03:00)
>The test pipe-fbc-rte updates the primary mode parameters for each valid
>dynamic test case. Because of that, we might endup with invalid cached
>data due to differences between the initial state of prim_mode_params
>defined from the beginning of the test program and the possibly changed
>state after pipe-fbc-rte.
>
>As an example, in a specific environment, the command
>
>  ./build/tests/kms_frontbuffer_tracking \
>      --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc
>
>would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
>it would try to read CRC from pipe B while the test was being actually
>done in pipe A.
>
>Another potential issue worth noting is that even pipe-fbc-rte could
>similarly fail if the set of dynamic subtests spanned across multiple
>pipes.
>
>Let's fix that by making sure that cached stuff that would depend on the
>primary mode parameters gets properly invalidated when prim_mode_params
>is the target of init_mode_params(). This should fix the issues
>mentioned above and also future-proof the code for any future test that
>would need to modify the prim_mode_params.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
> 1 file changed, 13 insertions(+)
>
>diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_fron=
tbuffer_tracking.c
>index 912cca3f8d45..17f74990979e 100644
>--- a/tests/intel/kms_frontbuffer_tracking.c
>+++ b/tests/intel/kms_frontbuffer_tracking.c
>@@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_outpu=
t_t *output)
> static void init_mode_params(struct modeset_params *params,
>                              igt_output_t *output, enum pipe pipe)
> {
>+        int i;
>         drmModeModeInfo *mode;
>=20
>         igt_output_override_mode(output, NULL);
>@@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_params =
*params,
>         params->sprite.w =3D 64;
>         params->sprite.h =3D 64;
>=20
>+        /* If we endup changing the primary mode parameters, we need to
>+         * invalidate any existing cached stuff from a previous configura=
tion. */
>+        if (params =3D=3D &prim_mode_params) {
>+                if (pipe_crc) {
>+                        igt_pipe_crc_free(pipe_crc);
>+                        pipe_crc =3D NULL;
>+                }
>+
>+                for (i =3D 0; i < FORMAT_COUNT; i++)
>+                        blue_crcs[i].initialized =3D false;
>+        }
>+
>         free(mode);
> }
>=20
>--=20
>2.43.0
>
