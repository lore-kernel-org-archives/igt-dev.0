Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C5CD11DF
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 21:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09F210EBDC;
	Thu, 28 Mar 2024 21:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imEbY2hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314710EBDC
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 21:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711662220; x=1743198220;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=x5VG3yd09u+c2lkzttjiVjYuAK13myCBpMVDRQ7J7IU=;
 b=imEbY2hm0Fv4C4aiCLVqenmuoHu5hP02LQzOk+ozqUP3LsB0CCDrG9HM
 xbQMaijrydu8Jv0ZpmTp9Fne/p8DFtIJ77p3Ge81JN0AiB2zr01qjuQlC
 wNngvkU/fQ6jgjMtL1o8KMSTuNO4CXwYr4mG73JVv05wLfU5EOm5x84O+
 yiSsuWx2mhy/EAIYBSAITNB068YDphb4zePvWmHP3UwycLhWKE5O1c5R5
 gqcIUSlXmF2pGrYkncjdb29V/HvzquQp0KAc3n5NhnkN1fT1ANKKKMesL
 2ydfbZi8xojHCDUEQV6c1jJVYh177b6oW6TJoe0+QglTrCbUh59C41dwx g==;
X-CSE-ConnectionGUID: /hM3O33aQKCKvCcpa/bKTg==
X-CSE-MsgGUID: wFSB3v4cTJyNLdOj7YGS/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6680256"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6680256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 14:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21454712"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 14:43:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 14:43:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 14:43:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 14:43:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDjBe/OfNE89vT890Wt6RT1b457wT1sV1ujH4AonhrGi2qHRFOUv4PsqQEwfcwo6GqSsAYVnMfnYi9YM0ezjygmiGvdEoeDE3uegbO/hCUoW/HbwINbOlwqdkazs33aqI74e5xBXa9cyx6XjmR59MP5bw+KlORu4Lh90BW/VqbYQyozVMoj8wbvNvFz4LV0ikH1XxUeyhIzNu3uQcg0HH0DsLgNalcgTMPG1AE2cF4ETzjEJHUfMiCbIdcb/vvPL/zpbIVdU+OTdMaZdkfLK8OBQinw2AyBnq6gKjz9KIwLPLrZPQpfTIV6ysOhi0zMwGcM2Wtl98b8ih5mxanZ/0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLPgUa8phctsalIQqx6aFDIj7rBErd07BWXUDVBSr7Y=;
 b=LbWJYFRpVasvD/HAIQvUej6RqdZcjHnr1Fw6X9iGmHasj1cvopnpRiz4BbVKVyK9qeh0XF7ysUYDbaZ8yz0i/+u2tWLrSSOen2BrPSQtdvqY40mjASRYuIy+K6XJG9VP3Rnw9vrzdrpwmLECN4uD1Ip5CAAIpwGsaeFQfoGXyEPs+BKopmZNy/Il43KmgIyUtJ5teZZR6MN2G7A/eceJyKtF8i+JTSVUelOhYz3IQPyzXTYkPHi5zAPfaNJZtsUopPQ7w0DHRXhZu7blo4emRqyaaA3THtum85xHssg/UKyxe6rHddn5bLFAFVRsIo8x0OGegfLWQLXcyj0UbghNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 21:43:32 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 21:43:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240328174139.1533658-1-matthew.d.roper@intel.com>
References: <20240328174139.1533658-1-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t] tests: Use MI_ARB_CHECK definition more consistently
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Mar 2024 18:43:26 -0300
Message-ID: <171166220626.2359.13836196243840175558@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:332::23) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB8177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nYobmn5UVfu8OTyrVlIoJyp6VCdQAGJBF+EG01PelL5n8h7dW7qgSNOLwDbyqnDGXANrmyvkYqQQ4mA4KIGy6ioAxql8dtJyFAAg33+qdyk6FKFyCJM81fB7pmOEb1dWwbo9VuME/RwTsKfs/Y5/cj4SkzfFQCqFfTKKAigD/hN44iehoTnOoZZjDR1gVOxZgN8Oz29S9RE28hedpN2daAcENPUREPQnbKwN7uyvWQRh/Ry6SkPIw4jhBETS6rTvy24n1gffOu5c3wSX8JHiDqWuXfOrmmvz7Rr306kfl3qKeULEXESTItE6Rcl5qtf9LXI62CPrbpDsjkx3C5WhFDcf2ySu/2ob2Y5rXK0mxozbKUaZ9O4/TmTxabrbWJxYEnt5Jp9m/nEQ3pi99TYRwHiNNIiN5TjJV5154GA45zTwtrsFg5H8hqbi1BvqXgkOva/63qlj2ATvZcpOztGRNvw6axnSvm/HeElhMgrwCow0Rpblm2ZfoiuZBmMqVt8YsA840sbbuh3ydm2xq94qxbw7iAoEEMOXsZISYbNxnyuH/hL9jfxCjPvpMnDXUMa0S1Zc4TUFtCtLTGtv31w6jTLfz3AKkWzbFrUy/YGW/1/L3STz3MSxXFaYcEKHHhXJf3xUS1vKK7oerpVVwMdux8sYsR1AdvyqifLWIzQGP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1laMU5waEFIN1NLVmdQRkw4V0ZsWmJGNXdpTHFLVmdPMEpYS0FVblc3NlZk?=
 =?utf-8?B?ZXBXa0tYa2ZleUpJZTM1QjdtcFA1MWFEVTZVVzIwcWlFVkNWUGdqMElIMkRK?=
 =?utf-8?B?U0pFQ2xNK1NCZEFuREQxTWR5U2FGUDlDNGhDeWdXN21DWERBdGtDdkRCbEha?=
 =?utf-8?B?Q0NXcXRRQm0rbzVVa1E0UzF2TElGYjNuc0ZPYUttbkZ5L0MzaHdXN21vNDRm?=
 =?utf-8?B?MmpnTzBFUnFPaHQ4UWRKL0tpU2FwZ0ZiaitibTY5T2tuUjZvQnYxczNsOVZs?=
 =?utf-8?B?aUxmQ1p0YjNZZm5vYlFiQXBLVFdBTkJlNDZWMU5HYW5udzdhaVRDQWJTdHZB?=
 =?utf-8?B?RWpib2NWQU5sOFJaTmx1eXFXdXNjSlhOQTBuOSt5RVcyT1ZST2YxNkF3RUJ6?=
 =?utf-8?B?ZmkyK0lxcFcxaEs1RmNNMFJZMnpTOC9kS2tLTjhOdjVSZzRRNEZtM1ROZ3Jo?=
 =?utf-8?B?UjNWVkRrZGtIZ2Q5SStET3pVV0V5RUFpemhXOWY2c0FHdHlyd3ZncVRWWktV?=
 =?utf-8?B?U0dKQmZKRVpoOFFqK0lhR1dwVXMxRXY3aGIzaDljYXJDL1J6am5iRG9GVVZ3?=
 =?utf-8?B?SERQalFJcFpTNWFEREtJczI0cmduM3ZVN25VWDJxWjJoZnVxekhqOUFIT1BT?=
 =?utf-8?B?L2tOLzkybXJIWkdUbWEvTmI0UFBBSnJJVzBKRXMwQzZrUW52eUQwdFFsZjRB?=
 =?utf-8?B?SWNWQmFhelZBbkNyem1ISXFDRDdCUi9kdlFkbU1sMTM1M3FWN1MwYkl5L2Ru?=
 =?utf-8?B?SGVtckdUUnVLaEdZUkFFU09ERG8rcHlwRlduV200Smdrb0pKTFdJWXJlUFho?=
 =?utf-8?B?MVZaa2NrUVRVZVRYSkJoWUhSVU1wUXQ5NUpESS95ZEp6NnJ6d2tUQkNERjRI?=
 =?utf-8?B?ZWtwaHFwZGwvZEE4ckFkK3huUnBHKzF6L09PMml4M2FOTFBNVSsxNExtRGlY?=
 =?utf-8?B?WTE2QS9sanZScy8vdlpCcmNVSEtOS0tVVjJFMWRGZC9JdEw2S2ZoSUlNMms2?=
 =?utf-8?B?ck1iK0sxWVA1S05lL0Z5N014Sko3KzZjOEpUZUR2UUoraHVONWttalFMTXVh?=
 =?utf-8?B?b2FzWkltSElJNjVZcEpyYkJzYVcwL2wxUUJTYlJFWWMxYVZBb0pxcllsQjhE?=
 =?utf-8?B?cFNZRFVvQU52b2hXUmRzbWVKYUlrRUt2VWNFcjlBbndZSG1HSTg4UXFBSUdm?=
 =?utf-8?B?YUFPdXYrK25ZSTI2OXBNbFUrYjZDb0dTcVNVZmZ6ckRmdkRsV2RGdUkrZ0Vm?=
 =?utf-8?B?WmVLb3REaC9vMU9abE5iTUNRd0srQTF4NTNLSjYvNFE0RGU5aXp6VWM5Uk9R?=
 =?utf-8?B?VzJXVEVhYk1WSkU2QnV4cGo5QkN3RTV3UlRWUVNQZ0lEOThLZGNkUUpaalJC?=
 =?utf-8?B?aFRhcXd4NU5HemJzSHVjWmZnMzlmeE9LY2ZQNk1nUzZ1T05IWjVqRzA2MHNI?=
 =?utf-8?B?WitqZ0NXZm1salJBR2Z0WGtwOWhmU0ROMjlIMnNaSll0cnVXMjA4Wmh1VE9F?=
 =?utf-8?B?TEVwNUJnb3NwL1M3d2RSK1J5dXZ4ZW44YjBHVHZkOEU0enVCbVZVd3psbEVx?=
 =?utf-8?B?cXZFckk5ejB3NDRESkowUzZlK1M5UGdoeGhBL3kvdjBHTm4ySk9jVjB4ZGo4?=
 =?utf-8?B?L21Zb1RVQUwxamc1aGk5bExqSUhDOWVxMWw1dzRtYy9Day9KR2xFYWFBd2Vz?=
 =?utf-8?B?K3E5RmJCSGwxL3lpVm54VkFTUmF3czZtSFJGRXpNM3hsc1BOa1hKYmdhTUd1?=
 =?utf-8?B?L2ZoVlkyazBEUGUvQ05YRm5rUUxJSEs3bUFGUTBnWlBIMzYvMVdWV2RlQ0lh?=
 =?utf-8?B?bG50bDd5UHk2c3ZuUTg0a3hVNVp5ZW4rZ2tXamoxQ29tQkd2R1RvWGFYM2hl?=
 =?utf-8?B?QlZBYnpaSWg1ektDN1ExN28vSkJBZGlwUmJ6MnRCRlJnd3BGUFBpc1JNWDNH?=
 =?utf-8?B?TnNnQlh5N0VmYThCNWNacDIrNkZaM0JZTThqVVhxU1QxRXpIY0xoVWUxSGp5?=
 =?utf-8?B?dDNZaUhEcGd0Tm8wQkROT0NGTG9nYzBVUGorOHE4UzVIWlBYcnd5VHZtaGV4?=
 =?utf-8?B?aTRadHFOS3NvRUYvK0VOR1lNcDI2dlpDWTM3b3hsNXVRd2lESUlIMmo3dGJE?=
 =?utf-8?B?ZW1rWGQ1VjBJeE5rZUQyRFkrZGxBWEcwNUZaKzhhVWFEMkFSUnFQRWhVdUJC?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22da2c42-7013-4dbd-f716-08dc4f701cd5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 21:43:32.2162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2E0ofQjR0sBmImQgG/ZV0HsPfOX0S/BZ7/ErEFIlHIg4RYbE14qthD7O+/UGZkYqu/13lsl4SwCKzsEc4P5lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
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

Quoting Matt Roper (2024-03-28 14:41:39-03:00)
>Even though we have MI_ARB_CHECK defined in our GPU instruction header,
>several of our tests and test libraries seem to be using alternate
>definitions and/or magic numbers to emit this instruction, which makes
>grep'ing the code for it challenging (and makes the behavior of the
>tests themselves less obvious in some cases).  Try to use the standard
>definition more consistently everywhere.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> lib/igt_dummyload.c             |  4 +---
> lib/xe/xe_spin.c                |  2 +-
> tests/intel/gem_exec_balancer.c |  2 +-
> tests/intel/gem_exec_fair.c     |  2 +-
> tests/intel/gem_exec_fence.c    |  2 +-
> tests/intel/gem_exec_latency.c  |  4 ++--
> tests/intel/gem_exec_nop.c      | 10 ++++------
> tests/intel/gem_sync.c          |  2 +-
> tests/intel/gem_watchdog.c      |  2 +-
> tests/intel/i915_pm_rps.c       |  2 +-
> 10 files changed, 14 insertions(+), 18 deletions(-)
>
>diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
>index d3cee9154..2e842929b 100644
>--- a/lib/igt_dummyload.c
>+++ b/lib/igt_dummyload.c
>@@ -64,8 +64,6 @@
>=20
> #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
>=20
>-#define MI_ARB_CHK (0x5 << 23)
>-
> static const int BATCH_SIZE =3D 4096;
> static const int LOOP_START_OFFSET =3D 64;
>=20
>@@ -286,7 +284,7 @@ emit_recursive_batch(igt_spin_t *spin,
>=20
>         /* Allow ourselves to be preempted */
>         if (!(opts->flags & IGT_SPIN_NO_PREEMPTION))
>-                *cs++ =3D MI_ARB_CHK;
>+                *cs++ =3D MI_ARB_CHECK;
>         if (opts->flags & IGT_SPIN_INVALID_CS) {
>                 igt_assert(opts->ctx);
>                 if (!gem_engine_has_cmdparser(fd, &opts->ctx->cfg, opts->=
engine))
>diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>index 2c9b5848a..d142f2cac 100644
>--- a/lib/xe/xe_spin.c
>+++ b/lib/xe/xe_spin.c
>@@ -97,7 +97,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_o=
pts *opts)
>         spin->batch[b++] =3D 0xc0ffee;
>=20
>         if (opts->preempt)
>-                spin->batch[b++] =3D (0x5 << 23);
>+                spin->batch[b++] =3D MI_ARB_CHECK;
>=20
>         if (opts->write_timestamp) {
>                 spin->batch[b++] =3D MI_LOAD_REGISTER_REG | MI_LRR_DST_CS=
_MMIO | MI_LRR_SRC_CS_MMIO;
>diff --git a/tests/intel/gem_exec_balancer.c b/tests/intel/gem_exec_balanc=
er.c
>index b1a108a5a..7504f3737 100644
>--- a/tests/intel/gem_exec_balancer.c
>+++ b/tests/intel/gem_exec_balancer.c
>@@ -1276,7 +1276,7 @@ static void disable_preparser(int i915, uint32_t ctx=
)
>=20
>         cs =3D gem_mmap__device_coherent(i915, obj.handle, 0, 4096, PROT_=
WRITE);
>=20
>-        cs[0] =3D 0x5 << 23 | 1 << 8 | 0; /* disable preparser magic */
>+        cs[0] =3D MI_ARB_CHECK | 1 << 8 | 0; /* disable preparser magic *=
/
>         cs[1] =3D MI_BATCH_BUFFER_END;
>         munmap(cs, 4096);
>=20
>diff --git a/tests/intel/gem_exec_fair.c b/tests/intel/gem_exec_fair.c
>index 29d732205..c903b6edd 100644
>--- a/tests/intel/gem_exec_fair.c
>+++ b/tests/intel/gem_exec_fair.c
>@@ -236,7 +236,7 @@ static void delay(int i915,
>                 *cs++ =3D 0;
>         jmp =3D cs;
>=20
>-        *cs++ =3D 0x5 << 23; /* MI_ARB_CHECK */
>+        *cs++ =3D MI_ARB_CHECK;
>=20
>         *cs++ =3D MI_LOAD_REGISTER_IMM(1);
>         *cs++ =3D CS_GPR(NOW_TS) + 4;
>diff --git a/tests/intel/gem_exec_fence.c b/tests/intel/gem_exec_fence.c
>index 3ed61b5f5..e4263b3f9 100644
>--- a/tests/intel/gem_exec_fence.c
>+++ b/tests/intel/gem_exec_fence.c
>@@ -318,7 +318,7 @@ static void test_fence_busy_all(int fd, const intel_ct=
x_t *ctx, unsigned flags)
>=20
>         i =3D 0;
>         if ((flags & HANG) =3D=3D 0)
>-                batch[i++] =3D 0x5 << 23;
>+                batch[i++] =3D MI_ARB_CHECK;
>=20
>         if (!ahnd) {
>                 obj.relocs_ptr =3D to_user_pointer(&reloc);
>diff --git a/tests/intel/gem_exec_latency.c b/tests/intel/gem_exec_latency=
.c
>index e5399de17..b9d086afc 100644
>--- a/tests/intel/gem_exec_latency.c
>+++ b/tests/intel/gem_exec_latency.c
>@@ -816,7 +816,7 @@ static void context_switch(int i915, const intel_ctx_t=
 *ctx,
>                        I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>=20
>         cs =3D bbe;
>-        *cs++ =3D 0x5 << 23;
>+        *cs++ =3D MI_ARB_CHECK;
>         *cs++ =3D 0x24 << 23 | 2; /* SRM */
>         *cs++ =3D mmio_base + 0x358; /* TIMESTAMP */
>         reloc[0].target_handle =3D obj[0].handle;
>@@ -871,7 +871,7 @@ static void context_switch(int i915, const intel_ctx_t=
 *ctx,
>=20
>                 *bbe =3D 0xa << 23;
>                 gem_sync(i915, obj[1].handle);
>-                *bbe =3D 0x5 << 23;
>+                *bbe =3D MI_ARB_CHECK;
>=20
>                 v =3D results[0];
>                 igt_mean_add(&mean, (results[1] - results[2]) * rcs_clock=
);
>diff --git a/tests/intel/gem_exec_nop.c b/tests/intel/gem_exec_nop.c
>index 8a6d6c42a..6c547a412 100644
>--- a/tests/intel/gem_exec_nop.c
>+++ b/tests/intel/gem_exec_nop.c
>@@ -154,7 +154,6 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
>                       int timeout)
> {
>         const unsigned int gen =3D intel_gen(intel_get_drm_devid(fd));
>-        const uint32_t MI_ARB_CHK =3D 0x5 << 23;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj;
>         struct drm_i915_gem_relocation_entry reloc[4], *r;
>@@ -206,7 +205,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
>=20
>                 b =3D batch + (start_offset + 64) / sizeof(*batch);
>                 bbe[start_offset !=3D 0] =3D b;
>-                *b++ =3D MI_ARB_CHK;
>+                *b++ =3D MI_ARB_CHECK;
>=20
>                 r->target_handle =3D obj.handle;
>                 r->offset =3D (b - batch + 1) * sizeof(uint32_t);
>@@ -240,7 +239,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
>         do {
>                 unsigned int idx =3D ++cycles & 1;
>=20
>-                *bbe[idx] =3D MI_ARB_CHK;
>+                *bbe[idx] =3D MI_ARB_CHECK;
>                 execbuf.batch_start_offset =3D
>                         (bbe[idx] - batch) * sizeof(*batch) - 64;
>=20
>@@ -267,7 +266,6 @@ static void poll_sequential(int fd, const intel_ctx_t =
*ctx,
> {
>         const unsigned int gen =3D intel_gen(intel_get_drm_devid(fd));
>         const struct intel_execution_engine2 *e;
>-        const uint32_t MI_ARB_CHK =3D 0x5 << 23;
>         struct drm_i915_gem_execbuffer2 execbuf;
>         struct drm_i915_gem_exec_object2 obj[2];
>         struct drm_i915_gem_relocation_entry reloc[4], *r;
>@@ -334,7 +332,7 @@ static void poll_sequential(int fd, const intel_ctx_t =
*ctx,
>=20
>                 b =3D batch + (start_offset + 64) / sizeof(*batch);
>                 bbe[start_offset !=3D 0] =3D b;
>-                *b++ =3D MI_ARB_CHK;
>+                *b++ =3D MI_ARB_CHECK;
>=20
>                 r->target_handle =3D obj[1].handle;
>                 r->offset =3D (b - batch + 1) * sizeof(uint32_t);
>@@ -371,7 +369,7 @@ static void poll_sequential(int fd, const intel_ctx_t =
*ctx,
>         do {
>                 unsigned int idx =3D ++cycles & 1;
>=20
>-                *bbe[idx] =3D MI_ARB_CHK;
>+                *bbe[idx] =3D MI_ARB_CHECK;
>                 execbuf.batch_start_offset =3D
>                         (bbe[idx] - batch) * sizeof(*batch) - 64;
>=20
>diff --git a/tests/intel/gem_sync.c b/tests/intel/gem_sync.c
>index 80119e30b..041ea5959 100644
>--- a/tests/intel/gem_sync.c
>+++ b/tests/intel/gem_sync.c
>@@ -876,7 +876,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned r=
ing,
>                                         *b++ =3D offset;
>                                 }
>                                 *b++ =3D r;
>-                                *b++ =3D 0x5 << 23;
>+                                *b++ =3D MI_ARB_CHECK;
>                         }
>                         *b++ =3D MI_BATCH_BUFFER_END;
>                         igt_assert((b - batch)*sizeof(uint32_t) < sz);
>diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
>index 98da6cdce..b66667f46 100644
>--- a/tests/intel/gem_watchdog.c
>+++ b/tests/intel/gem_watchdog.c
>@@ -356,7 +356,7 @@ static void delay(int i915,
>                 *cs++ =3D 0;
>         jmp =3D cs;
>=20
>-        *cs++ =3D 0x5 << 23; /* MI_ARB_CHECK */
>+        *cs++ =3D MI_ARB_CHECK;
>=20
>         *cs++ =3D MI_LOAD_REGISTER_IMM(1);
>         *cs++ =3D CS_GPR(NOW_TS) + 4;
>diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
>index 5aa5c6dbb..648765b02 100644
>--- a/tests/intel/i915_pm_rps.c
>+++ b/tests/intel/i915_pm_rps.c
>@@ -653,7 +653,7 @@ static void waitboost(int fd, bool reset)
> static uint32_t batch_create(int i915, uint64_t sz)
> {
>         const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>-        const uint32_t chk =3D 0x5 << 23;
>+        const uint32_t chk =3D MI_ARB_CHECK;
>         uint32_t handle =3D gem_create(i915, sz);
>         uint32_t *map;
>=20
>--=20
>2.43.0
>
