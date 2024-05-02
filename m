Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561B2C4345F
	for <igt-dev@archiver.kernel.org>; Thu,  2 May 2024 06:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B3710E5BA;
	Thu,  2 May 2024 06:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MtBOuHDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7028510E05B
 for <igt-dev@lists.freedesktop.org>; Thu,  2 May 2024 06:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714632866; x=1746168866;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UlaYYU7Vm/4GVdwF3/efbaclICRkhScBMDrD36ojQ9k=;
 b=MtBOuHDnWHTPaeP5HqTXSjFknrsoVzROQeTWjmRip8vEOOr24UZakB8i
 Zwkh9moZau4siTQvk/rtOH2ZrJVLwpu0hLg1hTP7A7Xw3SZfWmMW4NAtS
 cRWKpotjWx6ZzXTJPj6XWsW4MEkMuY+2ZxsfCtaI+IiFeI1cvlycRSHev
 HzGzMTjUu11kyVG2Jm+d/BEDr85csmBMx7AIGugLHCqhDGqZN67aMUlhf
 2/nHCkxDeIu5+AsHG6q1bMBDBDvpdYh6yzreXUACY9JQTMlZyFxtY2bYA
 6aM0Y4IAIitiQryvFr+FC7nxh2cV5axtUw/bTkYmX6jltGdon0Jgz/tCv g==;
X-CSE-ConnectionGUID: o5gJmjS2R26tebaLUjGgcA==
X-CSE-MsgGUID: KlbgtNfZRI+yBq0PaLuqXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10232763"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10232763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 23:54:25 -0700
X-CSE-ConnectionGUID: 0leizfuhRz2EZT9iJ6Xt9g==
X-CSE-MsgGUID: V03ZyqfKTBCM6FawX3/0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="57919526"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 23:54:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 23:54:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 23:54:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 23:54:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 23:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUX6QjeO/tf+SCpjrbpbm9wgcZ/ERyI4rRiKYJuv8FOj9+33GmBsLJtm+Ed7GJeg54DILm5RQg6ndDW8U6A+7n/W3FSqWh8t+7NjNHIuWadwXIsxdmlFC9qLvtypKyaOqbrdrNqJzha1UM3p+S0Jq+Dm1akRulMEjferzZjY3La2bxE2p6/u1604nj875ENpxpPJjWLKAh/Be0szXmsJCb+udJ2/F8Z9zhD1L7brx6/RZ+zHNghqwq9trs8wfAe6ulIcFeM91cO+qPyNWftwz4sJN/cZSJRY3mHShaVXdRTumct0GFZUil2I9KwEP6RXlogBZb9XmeRNQuRPq18ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9cXzHdg1EzVKfsQxZsFBayBzCXIGW+U/hMEmZ132gg=;
 b=bwVPC8717kHdcik3YHZw6OrJFvS6+AEHM50VgkrQqQGkg4D6YcMbmsQe1xaPa+02X2jTu2f9fpXSDviICXlbLQSaJ88K9uUksV/CNTj40/e7emL6MH10lr+J2AUnyeSJimNQzXfLvx4dB90gAv9hDuC9QXA5i5qFHkhBA9dyeGdoJ+39Sf7Zs3n+Sei/hxkzT/bZ3wP9O/ZgmH+Rh4548TetVoHmhXDdbuQqAJ3+lVK/qvAeo2R8h5vRWgSPVsAZqj4K8rPCh9F/Vk53s4c+mq12s1r+G77aWQwWCEtyzzsOa3LlOnm4FXrTdcZacnBW/vYvuC60yJLraXCGJERTmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 06:54:21 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 06:54:21 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_compute_preempt: Check skip
 condition from parent process
Thread-Topic: [PATCH i-g-t] tests/intel/xe_compute_preempt: Check skip
 condition from parent process
Thread-Index: AQHamtNonMpa/wU5rEaIuQqvdeHSRLGDhVHA
Date: Thu, 2 May 2024 06:54:21 +0000
Message-ID: <MW3PR11MB4748896F49FE678F7A0FB215AE182@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240430075310.1676863-1-nakshtra.goyal@intel.com>
In-Reply-To: <20240430075310.1676863-1-nakshtra.goyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA3PR11MB8120:EE_
x-ms-office365-filtering-correlation-id: a3040d48-f1dd-4d01-1056-08dc6a74b229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?gvQOzm2iq0lecobEkrf5T3zd3iyLTtMzVOduo/Kgg3R7IZ0L/63eAb4ZmpeA?=
 =?us-ascii?Q?hUZTxapx77qn4w31AP9yc/+6kA8XRoWe3KmbMB+7RFtWE3dvF/Vzz1IBtpi+?=
 =?us-ascii?Q?dYKce8JBYRepV+uEKg5ImRVb47GNrvycDz25x7DO5HGwGIAMZqJmGF+u9QGu?=
 =?us-ascii?Q?s022rutaw7y67QfDmjKiPfAlMcND6XflwFzYUIk1itsZswNhHK4HpAPO6kO4?=
 =?us-ascii?Q?Gze8tkpw4KhTIFtz5/igIPEPsLMBOug9i2hpwp/2ehLWaq0t92tEp8o7FKYV?=
 =?us-ascii?Q?3RszGKkv9A4rs1I1GVJcBJIUJl1pB70qlJFpwjNxpSuNa4mG+XKfnzl/gMqA?=
 =?us-ascii?Q?UIgF9Ge8OYM2E1XaUusq8DT0iZtt9NE3KVJWSorRjEEiZCNlWG9Illg65Jdb?=
 =?us-ascii?Q?XyxDP0vIcXxL9nWI7YOZuCUO9HkcwWuJCNFPTM3FkcwiM5DBgI9LZnzu4mV+?=
 =?us-ascii?Q?fbh+WQD4RqVOLbki05FjG5Ml3FZXqvDiflk39g6WoEIhRClOrLzDV3kz8Uwd?=
 =?us-ascii?Q?Wpz2vk2xcGMMyNuftzQnkiUPZe79zlA/AWQggPsZluqrIKJCe2ikB399d9GN?=
 =?us-ascii?Q?ZczNrZ4QAAQ9fgIbL5UI/ebPUoUdT4QL7WyfeYZXC7W278O0en662sQZpKUZ?=
 =?us-ascii?Q?cMbJrgMMGFnisYPtdxrT2NXGMyOpKZN7HO6v+yHw9JAIqjFvcOZucggGmWF0?=
 =?us-ascii?Q?64R0ME8zl9bA0tcWcVgP1/KllAnmdUoy1SL+rdcf+gG8ShK/Wfl+2onXLOgN?=
 =?us-ascii?Q?ta/9YO9ZiRg2UKo1es3cz0yoytbj+DUEQKZ5l5lZkI4ItzoiyPUoQ2m1xVSM?=
 =?us-ascii?Q?LdnpV3YKkZGgmfMa9P4psDdjFDKnxmsElnP/c+qKZDXBt6qLjO71BNw22Wch?=
 =?us-ascii?Q?GLVK8zzGDDSkxICQFHVgbdK+ykqeDynuM4AoPFmL6s1C7f6+y7xtND98yBrO?=
 =?us-ascii?Q?pRwrO//UMebBYlyvrlfFRlCJQ2cXiwr0Z9AjBXbjp9aP4tcx4NM4IL7rSlV0?=
 =?us-ascii?Q?lY5jsQvvUtPVpUpOQp+UM7M5epOkzKF5zH0klFlSA6SZ/FSiL7nVHbZzRbgA?=
 =?us-ascii?Q?ronm51jfS5t3pNjMIO0GOzDYvWGcXVXBRtJA93CFzf0p5jegsQx+TGhuWVxo?=
 =?us-ascii?Q?Tbu2IVKsajAFH9w9ifGuZW6ArBHGO8V5oyt2O6rq1iVNYcRuqFfjhJTuF3+/?=
 =?us-ascii?Q?LOpSE9p/O0HgfObzOTlz226iZClxtqcegftLfXT2n4Frf5aELWZdrvHi/7B1?=
 =?us-ascii?Q?WfurL7wluAXoKSPshlfBj2f0cq/2hpDkfjzwgKDlX8qMlTBYirHqxM9fNvQ1?=
 =?us-ascii?Q?tW1cyy2u83GSqj9N9mPgzS+hySxJZW2Ge2EFUqRj9D9EtQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ENLud2y5OlhT3T68pY2ylmPYGUelEHnNXm2QIQe2pkPvnHk+XwVTv07v6gdB?=
 =?us-ascii?Q?/6i6dcT3i/7jLO+uNldhDndd2sWOSKdxu1DTIIcDyxEZWPFmcqAzruAObTQ7?=
 =?us-ascii?Q?iPJMbzqZ9DRMux5tyN2dr14wrS891R+mSD6p8h+v7UtSsPhBJKTTz5lSm5HO?=
 =?us-ascii?Q?hjoO7IPJOy3WPGYQ3z3nN7LwB5XrFKJwjpQGCZTAaaSCWAIUBJrc/wl9kmic?=
 =?us-ascii?Q?u10f2g16RPzpUGFds6NH7f24kRI9nCe24rl0jyEcrLbeAnhFLKfO+efYHagj?=
 =?us-ascii?Q?/keIBZpGKWkrHAN0hY938DlP/IaZOBuEvTB3AETMd7l/SHIoEHhz4f8RnwID?=
 =?us-ascii?Q?JaSi9ZX2DhaLLHUWRgAW9Kz3r38y4TRBW+0m8BPl+6nglMPbjaWKu3wt2zUg?=
 =?us-ascii?Q?NLTERvvnoxJpSjOjYYYF3wfq9OKz78G+mppNziuTUzNX6W82DxKAgXVmet/q?=
 =?us-ascii?Q?9x5L/tunyCQfK4eQd1QEZStV8hCdugDZ6LRgB6Y3SskM7te+MyHGJcY3z18P?=
 =?us-ascii?Q?cKkqWKjFh7tp0f8p440XMVgTLMXW5ODYOfiGN5/sW8HvDXoc/ipErzcV2jWu?=
 =?us-ascii?Q?hXjDT7iriFSdnJG/d54l9gsI8WfiRJoiH9j9+Ed4LnvO/Qo+3c3XjiJpGZKc?=
 =?us-ascii?Q?Y9qFpyV4qba/409nGQC7fQZc0iuDvjuSjpXjWOnwZlxCoxYPDuChpSTMo5FM?=
 =?us-ascii?Q?bONjGQXwNN0wn2/MdNKPwDXDUm4e3jy6Wy9QjaPT5Sht1hLAEiLDi1I0A2bP?=
 =?us-ascii?Q?3TpRQnusWYS00TuYngV765Pd2aEJ0dHRlDnKGx/S68eQMVyxNvbjFtbR30+M?=
 =?us-ascii?Q?7XcLnL2dW7u4r1r11oqEm7At0q3+YDUyWvpulpgQkGcABtrBRAKaAfJlR62D?=
 =?us-ascii?Q?iByIR77iKCUwTHIuD3MQMjCZWJUATzzu9TZEU8hGhdWysM5dDIBA7CqJMLMk?=
 =?us-ascii?Q?DZ6m5kfLQS0sEE9weESIkPyb5GcAgho4HLpD5q8mQBXUp5tn51tN/PuCc8D3?=
 =?us-ascii?Q?m/Fh/+2ANsY7ZNV3jTObwIBOWOkUeM/PnByosCiKh1K0plnevNPc//6P1Lsp?=
 =?us-ascii?Q?a14yf58S/FB0rko4Bv8frUgXpLhbrq34nAnGf7Re/ut2Qysa8v6ixhwivEeg?=
 =?us-ascii?Q?niqZwfSVocSOfzF9E3Ju+J2h+JK9f+dOIjQHH9QaQaKMJDd1lvBjhpnfKJA/?=
 =?us-ascii?Q?K7IybO7Acb+c49fiGRHV3Z1M3INEit+7iXMzrRAyEFcBrWIA66CcNrSJdZN/?=
 =?us-ascii?Q?6CiqAM2WdK+iCVZtCzHSIzr5jHy7NRtcUnI4uaggk6muA1NkOYpR5rBNEt/1?=
 =?us-ascii?Q?qwCXKtr3VgiJ2MI1AgMGN1FeVKbLAqQWvP1hSQT5kWpJ8vwPoRdN/p1kMkkI?=
 =?us-ascii?Q?MDaFnogAUB287VPVlSBB97H7GOOAxtGGVsQJI/mf/Fq/XcLTaiiXL+Nm5tGg?=
 =?us-ascii?Q?JwK1gEv6n1AflbF35Ut64ZFtV0YOIAtF/14EsjnsIasnvpIgk2XQnIcvyeE6?=
 =?us-ascii?Q?jad3FPq96T6Udca49k+DsBijN8ire3/1MvahC7thAJRCe3YGbNNRBD7dSt+N?=
 =?us-ascii?Q?UTnnR5fp5WethzXj4jA0f7CbE10+bFUvuA8z+gk9vwYr8Zk53iw9hRgft6mV?=
 =?us-ascii?Q?bw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3040d48-f1dd-4d01-1056-08dc6a74b229
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 06:54:21.7029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +6U+v3ZbymzN/I9DDmBh25nKuQLT8fkj76YxQxmgoIeMjINUCBlc6SpRdaeswS1/6DrDy5zVDNCeWV3/gBsYaOzYVNUEUlWpVlqAHzg9kVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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
> From: Goyal, Nakshtra <nakshtra.goyal@intel.com>
> Sent: Tuesday, April 30, 2024 1:23 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_compute_preempt: Check skip conditi=
on
> from parent process
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Check test is supported on a platform or not from parent process and run =
test
> once from parent process before creating child processes as skip check is=
 not
> allowed from child processes
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> ---
>  tests/intel/xe_compute_preempt.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_compute_preempt.c
> b/tests/intel/xe_compute_preempt.c
> index 78b19158d..3817b5a30 100644
> --- a/tests/intel/xe_compute_preempt.c
> +++ b/tests/intel/xe_compute_preempt.c
> @@ -63,6 +63,7 @@ igt_main
>  				continue;
>=20
>  			igt_dynamic_f("engine-%s",
> xe_engine_class_string(hwe->engine_class)) {
> +				test_compute_preempt(xe, hwe, false);
>  				igt_fork(child, 100)
>  					test_compute_preempt(xe, hwe,
> false);
>  				igt_waitchildren();
> --
> 2.34.1

