Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF62FD875A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 12:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422110E5C2;
	Tue, 17 Mar 2026 12:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyC4vKbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D37910E5C2
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773750865; x=1805286865;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=boLii8r3VJXT7KFjetZsGIGH62Gv63GzQ2Y7SqDqkXo=;
 b=SyC4vKbK/qLvOwWxHHe1dGw1ofhR2NRZQSrXW3uOcn2o37VX2ue8CnKt
 ghT2MrTuOwCm9Gi3JJ1LrkuuNdPAwKXZ5WZ9vW7RWJ+ZkbNeeYwqoIUrN
 I8vnK/XbGBwbiwLj+Xi4OsdrQW6Jila1n3cZW7c/TUlW5jsDFcJZMM5+f
 yCtFJfgZsp6NO02LFjwMmD6NUFZv+r6xjRX4W2ITOFuTGaFRdlQZZRs1q
 ClmX3tDEeTcHxZgKpBukK4YGljCswLVAmQJfKEhrY7wjug4ifszZUEyd6
 SbNp8jmnufjWh4sV1f7MjCVQ/o+OB2LDNVfH4nzOPpMksMBsTixDXLZcs g==;
X-CSE-ConnectionGUID: Z4nQKoiMSuCIV2MnBY8syw==
X-CSE-MsgGUID: 9xep/OMAQsGxhgKRuSHnUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78385737"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78385737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:34:25 -0700
X-CSE-ConnectionGUID: ONk0xCwnSD+qxHMClqjD9A==
X-CSE-MsgGUID: dWacBT/tTiy/KrMWEqtokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="252739212"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 05:34:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 05:34:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 05:34:20 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 05:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAanQ9iZL3/xvoT46eW7JxOOFwKsaJ7+XZvbKYzHJ61HtpQPnxhZA8RAeH4EIvs4q1I+UTstYp6LJyfHV6w7FGsGAOoOBlkcUZhQsk47yUU6iq2P9ZMkrFzg3ZI1kNSK5R8f7IhyrJVFWB2baTsvFusCEJoqxNv+kknCSXmAcLrBjs6sVyJwhMuMCsE4E1j0exFa3838S/bQBZte4s+cIUKC9/qdTLHsx+cL8HOsNlJAF4M+i2Cbq1fgmUCfRU0tVgLY33gYOjREofutaiPIOUDD8vgZS0xcAkfbgwkQZ0E75/OL60WsDFjOVDiR+kdnZZ87PtDlj817k3R4OYjx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8bIHKDV68hSsAkyDsZ+1Dxt4cNvyVxQrTVmxRKg1PE=;
 b=Ht5qsa7WmcKr6LCnnJ0oKMlgFEIFenttEutltHbRolyjMnFp47ZjuTCrCyz7wyu0EDXOUOEB1ngZMffFuo5vO3NAik1irNLgsYRsIdLLN572wpo1Ubsf7frmGy3sN8E1iRohOnYrhuxj+sCJjFhH9f7QTrT8x4r//cq0u17+vBxnwzREuCe98m8SEDkUGo1mk7+DC9cW/Nz6rbMrrUJDZ2TfS3FmqZC/zImm4C0vcBQnhQVZ5jSE7oFavpttF5QAlpbcS/GPIYhMVxK9OvfkTCm71NQbfTfxRDGxCyYi9szxLYzuREXGDbvsysSDKwKni/XsjcUwFXJZaOmJRgyQ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7387.namprd11.prod.outlook.com (2603:10b6:208:421::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 12:34:16 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9723.014; Tue, 17 Mar 2026
 12:34:16 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_prefetch_fault: Add SVM and
 hit-under-miss validation
Thread-Topic: [PATCH i-g-t] tests/intel/xe_prefetch_fault: Add SVM and
 hit-under-miss validation
Thread-Index: AQHcsTc8uytr3lapaUWGNL6EWBcOobWyshwQ
Date: Tue, 17 Mar 2026 12:34:16 +0000
Message-ID: <CH3PR11MB8434137B27F814A692B6A58B8D41A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260311091230.28360-1-varun.gupta@intel.com>
In-Reply-To: <20260311091230.28360-1-varun.gupta@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7387:EE_
x-ms-office365-filtering-correlation-id: d9955c70-4449-47ca-5816-08de842180cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|7053199007|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 7iEgq9N9GbHLjkuiZpbu+q2c4oRjxbLJtMLbin2/WdtRH4SPVuzLNEhl1I1OmC0rTv9XL/uIBBCmXj9z0iR4Hy0LI263WzXKquHg1IdZUlfedLIxROE2coQgxtTARhwzKLQYT9Fm/HafqXbp+bokXIhL7kAcBAna7U7I9fnLJLVfnRz+qU7zizOhMN7GQSMo3jM6STrdYP7qPSMYl4lmQVVHo0j0W4nxR8MwWsh4ATMM0dUm6GjrGVd6iBMmnfMIx65O4xXJT7PiqoNHVNOWeiGJ1H2yvy5KINNMSpvofbIUqo1TMAdbETU7dGiGJEec82Ssrb+x1aF4J/VubwMiOeAZxEopIE+6ptPJSZ9vsitTzteC0pcfIbSusrSVGfhcjSQJ9qiq7yIsOA5CF/k+/RU/8v68TMHktJSE7rf8KZgkR6wtqDx0hZHpHf59zDPpuL+EpYiChnHHxPBygc2Bg78t/HZrH4mRDkSwYpHmXt8htBZYcDMkGA+yHfPA6mlkFMhTYgTPBsF6zxIfc604xW9xbW3MR2nImnZWJ45rI9wMSqb8Xh7EDDRqySxbsgToVtrNC0MsFF3PzOBYrj7/mU6sQzMQYhUvITUuipZzfSn2EiXFQReErW9EorxChpGThsF2nn87PgWsbhNcAonb3XTjorkk3bAwzu0rrdrkD4UIU+BCQxtxrKlZFtbx+4tsIE4I+llVIiuqBbjg81FJ7EV30CFj3hNHBR64tzOT2o08UOAB5edhPbRlWSvDxsVmSeYWrkWAVMuO2yB1aiXFXCoZDGR+LCKHk36v1XupNrw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wxBzqExU3P9UGhxXp9n5iHL3SJYTLND8SJyv7jufxzXUvyRwC8r3/mbeFWss?=
 =?us-ascii?Q?TII0mXORFLGAe6qA27rNyH6WKgttRTXawwMSG/6gRk4KGDXytYWSRjAQ0/Fi?=
 =?us-ascii?Q?x0fn4q4Z4u8AMn0AbDBMLVhJmxrQJqrXATGZhhN9BIVdyeyA/oo+tT25kdY2?=
 =?us-ascii?Q?GITWP78NTUbds8hfkHuxikCpS/bMXfAD594pxVsjLRqUtFCuGqBaIF5Kil7E?=
 =?us-ascii?Q?S+giOzlkVWD6td4Q1KBdlg2ns2CY0x79Tg1xwpwUBeH08bhIvEZi/g6OCDm8?=
 =?us-ascii?Q?a9TbbzFj3Hzgzq0Hk11oi3OU1gan/zXvUl4Tt16pYcKVN35rjhKBtTPR2ldM?=
 =?us-ascii?Q?iDbQ4JCZcSW7n1uTr6QbNxj1nDWL58ylu1q7qMwUp7oot+tlNHzt5/4mLZ5N?=
 =?us-ascii?Q?PT/sMy27owV1Y8oJxx0OYeQXgnb2T48N9MVFQdNqnJgm09pYruQgi+x5YCcc?=
 =?us-ascii?Q?cqu1ywlOw5YnQ/2cwstlfsolQw4SkZoOwu3Kd/xj24LLaTfNKbdnqq9FruAO?=
 =?us-ascii?Q?4sCNb2+G76Y5mb7+RUJvzGSQX06/NpqjmXvOnG4EnuQoHeRAJHzQGH1V6qVH?=
 =?us-ascii?Q?L5qsSunEDmc9lZ4GOD6xOiW/5XDeUNgycGzHCcMK5ys4ARdrqZEnCowLUTlq?=
 =?us-ascii?Q?GAN4PCS2dgA6OLcUFMUhVZiBwmVW/wsmZyKGCH/KyzPCfCMdv397r6xBDEc4?=
 =?us-ascii?Q?gpipuhMdNrRJRNVl8IEX/RC0g8mYWjBIApxgKQH9juwBlOEcAv+M9jcPQT2i?=
 =?us-ascii?Q?RIFchynGfYPQjxwYJe0UlIR30FVGhKsYIrwakSt7LXPsjKk+ppxfaGVFFwWW?=
 =?us-ascii?Q?P/KgCl3ShswlmQrR7rGvt6kE5+6+toGzB28N4H9tSjdy2J+PVt9PDS1QaAxK?=
 =?us-ascii?Q?pqTpQTphIYv6URM+TgWnJyZA1nJRZZzEpXjy0XG9OKbwjFMhqVlv8B/7ghTH?=
 =?us-ascii?Q?FeWLObeX5gOSTLEnKO1wvY0kU71/QjImo9Aw6QdEP+qTqR/985S13Y7VPdzR?=
 =?us-ascii?Q?kKza9eAqWMdSPswxBMjcu42WisK2C9CKrGCaX0/j0sMwu/hLSwY0hznHQXjc?=
 =?us-ascii?Q?vIvq1g82Xbj2ej5ICfx4ZCjaWFo8xL+cVtcFKB0g4SWHnWxmlG94uO6Zb05U?=
 =?us-ascii?Q?Titj9ZcRIyRJCk0ilFN4ZQglUHJ+wbn1S++Tj16TtzbkJbIWua/z/Eg3NvBg?=
 =?us-ascii?Q?8Wu1+S+ULWXoZUI0KzQJ5Y7wAxN3UhMuWMrsUBPQXNrZI5e+uqr/L5RpuqiS?=
 =?us-ascii?Q?ablWkX8K1HGndJbpMlQA0q6JS34gtbTD8ZYPlSUeVGo3rhxIRqHGQVaV5r6w?=
 =?us-ascii?Q?cpw360mM7nyQvj4KqcZnnzgxnfH5PBbR+PojxkIYD77y2J5DrXfc7ftSc/FM?=
 =?us-ascii?Q?FhX86jQF7FubnklRTa+zGs6lhl1DwAyr6nOB5pK5WWUSqm7fqPtLYs+/Shjm?=
 =?us-ascii?Q?SKku1b4QWv4+FKWAMZIqgTdDBfwC2LHA+WSW3m+Z8VfjPx/mX9lc+OS+OFuD?=
 =?us-ascii?Q?2Yis/gwcTDvXpbZ9AtmbdS0BW7hc4QtMGU4JUwyTuqyGnsdvdKEAsODqboAK?=
 =?us-ascii?Q?9S+J66XFacp1GF/QMtVS+P7PJN5zzjp0qVgq/oj1L9Q8ry32udm5c6IqButG?=
 =?us-ascii?Q?oJ7auaXcnIozhLo6Gnk26Fke7nH7tUPqBBvmNK/gaA4oM7fIdSlXFub4abPX?=
 =?us-ascii?Q?lfzN8IeGkxsd2EbaTBkJoESxjKAN0r/ZKNxxeM7hSeiw7ImPGu6D8bdYKPVq?=
 =?us-ascii?Q?odUMdtrrigvADEksl0isJypQwmZkIjhJ9LaCMuexUgmDveGBOzxX0HSklUdx?=
x-ms-exchange-antispam-messagedata-1: AmhnSbIT+Y82jnas6prwHNONjebkJrDz1po=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oQw0HH5EEoRS4Usv85g/4hAe6H/Q1NpLZuISF1lyRNo6GCZM4OSCNv7E7oxQCCGjBSvBp2ig8Bar/fJBMD+wfoN9grx558911rQuSucRPitUateomSks5YVOVyDfBAYaPIcnypWGwMgTNKdYtBF64EOx54AJiSIuO0+2OyPYw0PB9lI6D5OnZuKT8GEZ1faHT16jW/FnYy9RUsdO2zCSXhGYHPGxESMqNVAYFbWrvEiAMbZ/blFmZHiGQUTik4mEHxWlMNMvK/pjUUPVHyoixFaf5iT/2QvjT5n/qqsjJDhYKKzrEp6MU2vTNR1hl5WHvEsNXa3GEHyI6CRfv7tpjw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9955c70-4449-47ca-5816-08de842180cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2026 12:34:16.2549 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sy+wx+jtC/4gnVS5Nr/0LKjQxp8nhVbRHBvObzrze8uEhW+cCZJ8acLGiVf7CBdAg0tjyQcwDj5Ex1fROST/Xwd7Ti6bvFZ199w08YvfN7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7387
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



> -----Original Message-----
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 11 March 2026 02:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Gupta, Varun
> <varun.gupta@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_prefetch_fault: Add SVM and hit-und=
er-
> miss validation
>=20
> Add a second batch to validate hit-under-miss behavior: placing the BB at
> PREFETCH_ADDR ensures the page is already mapped when the shader
> prefetch runs, so the prefetch fault counter should not increment.
>=20
> Add SVM mode (prefetch-fault-svm subtest) that creates the VM with
> CPU_ADDR_MIRROR and uses mmap() at PREFETCH_ADDR to make the page
> GPU-accessible before the hit-under-miss batch.
>=20
> Other changes:
>   - Extract PREFETCH_ADDR and USER_FENCE_VALUE into defines
>   - Update stat name to 'invalid_prefetch_pagefault_count'
>   - Add missing cleanup (intel_buf_destroy, xe_exec_queue_destroy,
>     xe_vm_destroy)
>=20
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  tests/intel/xe_prefetch_fault.c | 108 ++++++++++++++++++++++++--------
>  1 file changed, 83 insertions(+), 25 deletions(-)
>=20
> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fa=
ult.c
> index 4a143374a..fb0afb0a8 100644
> --- a/tests/intel/xe_prefetch_fault.c
> +++ b/tests/intel/xe_prefetch_fault.c
> @@ -25,6 +25,8 @@
>  #define WALKER_Y_DIM	1
>  #define PAGE_SIZE 4096
>  #define COLOR_C4 0xC4C4C4C4
> +#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
> +#define PREFETCH_ADDR	0x1f000000
>=20
>  struct dim_t {
>  	uint32_t x;
> @@ -118,7 +120,7 @@ static struct gpgpu_shader *get_prefetch_shader(int
> fd)
>  	static struct gpgpu_shader *shader;
>=20
>  	shader =3D gpgpu_shader_create(fd);
> -	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd,
> 0x1f000000));
> +	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd,
> +PREFETCH_ADDR));
>  	gpgpu_shader__eot(shader);
>=20
>  	return shader;
> @@ -126,63 +128,108 @@ static struct gpgpu_shader
> *get_prefetch_shader(int fd)
>=20
>  /**
>   * SUBTEST: prefetch-fault
> - * Description: Validate L1/L2 cache prefetch fault.
> + * Description: Validate prefetch fault and hit-under-miss behavior
> + * Run type: FULL
> + *
> + * SUBTEST: prefetch-fault-svm
> + * Description: Validate prefetch fault and hit-under-miss behavior in
> + SVM mode
>   * Run type: FULL
>   */
> -
> -static void test_prefetch(int fd, struct drm_xe_engine_class_instance *h=
we)
> +static void test_prefetch_fault(int fd, struct
> +drm_xe_engine_class_instance *hwe, bool svm)
>  {
> -	/* faulty address 0x1f000000 should be beyond bb_offset+bb_size.
> */
>  	const uint64_t bb_offset =3D 0x1b000000;
> +	const uint64_t bb_offset2 =3D 0x1f000000;
>  	const size_t bb_size =3D 4096;
> -	struct dim_t w_dim;
> +	static const char *stat =3D "invalid_prefetch_pagefault_count";
> +	struct drm_xe_sync sync[1] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL,
> +		  .timeline_value =3D USER_FENCE_VALUE },
> +	};
> +	struct xe_device *xe =3D xe_device_get(fd);
> +	struct dim_t w_dim =3D { .x =3D WALKER_X_DIM, .y =3D WALKER_Y_DIM };
>  	struct gpgpu_shader *shader;
>  	struct intel_bb *ibb;
>  	struct intel_buf *buf;
> -	uint32_t *ptr;
>  	uint32_t exec_queue_id, vm;
> +	uint64_t vm_sync =3D 0;
> +	void *cpu_data =3D NULL;
>  	int prefetch_pre, prefetch_pos;
> -	static const char *stat =3D "prefetch_pagefault_count";
> -
> -	w_dim.x =3D WALKER_X_DIM;
> -	w_dim.y =3D WALKER_Y_DIM;
> +	uint32_t *ptr;
>=20
>  	buf =3D create_buf(fd, w_dim.x, w_dim.y, COLOR_C4);
>=20
> -	prefetch_pre =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> -
> -	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
> -			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
> +	/* Create VM based on mode */
> +	if (svm) {
> +		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> 0);
> +		sync[0].addr =3D to_user_pointer(&vm_sync);
> +		__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << xe->va_bits,
> +				    DRM_XE_VM_BIND_OP_MAP,
> +
> DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> +				    sync, 1, 0, 0);
> +		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
> NSEC_PER_SEC);
> +	} else {
> +		vm =3D xe_vm_create(fd,
> DRM_XE_VM_CREATE_FLAG_LR_MODE |
> +				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
> 0);
> +	}
>=20
>  	exec_queue_id =3D xe_exec_queue_create(fd, vm, hwe, 0);
>=20
> -	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm,
> -				     bb_offset, bb_size);
> +	prefetch_pre =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +
> +	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset,
> +bb_size);
>  	intel_bb_set_lr_mode(ibb, true);
>=20
>  	shader =3D get_prefetch_shader(fd);
> -
>  	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> -
>  	gpgpu_shader_destroy(shader);
> +	intel_bb_sync(ibb);
> +	intel_bb_destroy(ibb);
> +
> +	prefetch_pos =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
> +	prefetch_pre =3D prefetch_pos;
> +
> +	if (svm) {
> +		cpu_data =3D mmap((void *)PREFETCH_ADDR, PAGE_SIZE,
> +				PROT_READ | PROT_WRITE,
> +				MAP_PRIVATE | MAP_ANONYMOUS |
> MAP_FIXED,
> +				-1, 0);
> +		igt_assert(cpu_data =3D=3D (void *)PREFETCH_ADDR);
> +		memset(cpu_data, 0xAB, PAGE_SIZE);
> +		prefetch_pre =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	}
> +
> +	/* Hit-under-miss: BB at PREFETCH_ADDR ensures page is mapped
> before prefetch */
> +	ibb =3D xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2,
> bb_size);
> +	intel_bb_set_lr_mode(ibb, true);
>=20
> +	shader =3D get_prefetch_shader(fd);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
> +	gpgpu_shader_destroy(shader);
>  	intel_bb_sync(ibb);
>=20
> -	ptr =3D xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
> +	prefetch_pos =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> +	igt_assert_eq(prefetch_pos, prefetch_pre);
>=20
> +	/* Verify buffer contents */
> +	ptr =3D xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
>  	for (int j =3D 0; j < w_dim.y; j++)
>  		for (int i =3D 0; i < w_dim.x; i++) {
>  			igt_assert_f(ptr[j * w_dim.x + i] =3D=3D COLOR_C4,
>  				     "Expected 0x%02x, found 0x%02x at
> (%d,%d)\n",
>  				     COLOR_C4, ptr[j * w_dim.x + i], i, j);
>  		}
> -	/* Validate prefetch count. */
> -	prefetch_pos =3D xe_gt_stats_get_count(fd, hwe->gt_id, stat);
> -	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
> -
>  	munmap(ptr, buf->size);
>=20
> +	/* Cleanup */
> +	if (svm && cpu_data)
> +		munmap(cpu_data, PAGE_SIZE);
> +
>  	intel_bb_destroy(ibb);
> +	intel_buf_destroy(buf);
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +	xe_vm_destroy(fd, vm);
>  }
>=20
>  int igt_main()
> @@ -201,7 +248,18 @@ int igt_main()
>  			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
>  				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
>  					      hwe->engine_instance)
> -					test_prefetch(fd, hwe);
> +					test_prefetch_fault(fd, hwe, false);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("prefetch-fault-svm") {
> +		xe_for_each_engine(fd, hwe) {
> +			if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_RENDER ||
> +			    hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE) {
> +				igt_dynamic_f("%s%d",
> xe_engine_class_string(hwe->engine_class),
> +					      hwe->engine_instance)
> +					test_prefetch_fault(fd, hwe, true);
>  			}
>  		}
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	}
> --
> 2.43.0

