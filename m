Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC937CCD18B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 08:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8851F10E55D;
	Wed, 18 Sep 2024 08:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is+HOruq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF510E55D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726647126; x=1758183126;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xWi8J6wfbgxSBaV+WOSIaq+zx1ll8dQc663erH8QrYY=;
 b=is+HOruq43pKfgSBS9V5Qs5aNfc3eyzo1EtKPVotliVVpfhcuLCCzL6i
 gSVniGG2R2JxQTiGfC8YoVBxgUccWLSvB1gluMvPdcgTmFwisQ3/oTJ4s
 8VhkUDLv0BrP2Jk1BDV/ZIX31x+apLnhxKBJDlIsFVipHZG+Z63F9Hyn7
 3NATjtUIylW1FQHBZveogTJ4NEofJw8J680HcdNwSzWmIA31EInkX6vFC
 5tNVwBCBulQD7B5L14AkXjaS8TQRFjEp5/vfUYe4r6CNZ9c+KV3E9/T6Q
 DTHE8Z9uRYd/Kdi3it7Ex7IkI2OkjWtsOqWpfPzcK3DFOL+vsJvIJUVNv g==;
X-CSE-ConnectionGUID: bHztMh6cSNq11G6/6L6YNQ==
X-CSE-MsgGUID: 5wVyod61TQe0DmZCetZB4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25737597"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25737597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:12:06 -0700
X-CSE-ConnectionGUID: 1IonQWUfS3mT5Bf750Nk5g==
X-CSE-MsgGUID: 2NeueZTzQvK022qPqQBMLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69466370"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 01:12:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:12:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:12:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 01:12:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 01:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFB3H1l8mQHmUxpN1Z3jCX8q9nZX71nJfp8r8QzMzTDZy14KMqkhiB9V3CFd8ZqfugVs+X5gvOlPdDbmVY4tgBAdsCqmq6UYYFGMI0NLTx/GHhUlUkmGQFSL5FwziK/7IFb2Y6fv8l9sPGoN5AZ72slBl6ke/oEGJ+9Hz1T6SebThpekN9ri6qj+5pQ1pDZ26NXTUL/R2z+DKBXlOqd1UKFi992YIJNR0lhQwtsyn428qmX/HnKeP+JGtGwQa7qjalIKFDPN9rwo5kMocf5actyj6sBiulvAjFkKoXOablUqhUTlLdONdsrCxzKPTiOCgrDn3ecbp6XTaH/ua+9Vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YGzEAftcjrHHE+NTzon9J6PU+rDkC+uqQe+ycWCjOE=;
 b=yBKVe0g8AvTjhpbHxbft+cSz3iYakSacLni+47hZUhHPkEt8xYW69EzyLiyD77G5VTpf0U7rKe4V0Aq/pfPV8//e2L24lcIUixfqWibWv+a/HDPVpXJam12TfNcKGVFNphZvA9tD0zLUnLGJBsdX+aAxWYPz1yfmpHiNArS7plFy2foRvC8Ao9qXME2Q5ctYwbtt7n9wDKyBnn776RjZNPUE5psqiYx1h+W4JwDUc9f5C/zeDvQJ2WhYru78aYcHqZJ/Ey7ksFFrSsjwByJkWaBciya5Svc6X+yh694g30Oirg8kbnBeb25vogog8AwAoknni7086GQqm3uuQAKRLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 08:12:02 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:12:02 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [i-g-t 2/2] lib/igt_kms: Don't abort in lib helper
Thread-Topic: [i-g-t 2/2] lib/igt_kms: Don't abort in lib helper
Thread-Index: AQHbCOeOrRfIsmt2OEutf49piZIvYLJdMwDA
Date: Wed, 18 Sep 2024 08:12:02 +0000
Message-ID: <PH7PR11MB605332F0FE0AC1ACCA6F4AC1E7622@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20240917094422.938032-1-bhanuprakash.modem@intel.com>
 <20240917094422.938032-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240917094422.938032-2-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CYYPR11MB8331:EE_
x-ms-office365-filtering-correlation-id: 738e0d3f-d47c-4506-1680-08dcd7b99397
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jWWyfZ2VMPCx9KcbwCYNfodFz3ucFilWoUspc84Mk3ceHVEHFNLhxhqcbNMa?=
 =?us-ascii?Q?QNPUxSwPOzQqzfUw92QLG0z7KhyW5T7/YDaRb2p3HhnOHEgEmZZcIKsGilbO?=
 =?us-ascii?Q?yvW+dMCRXGOpG8chHUB0naeErPrgtsEbZunukY/HDeJm6+QhojfM3FTk5Gu1?=
 =?us-ascii?Q?N9c0T/yHFuRKJ9xDmXKJknvLAo1zWkkv5MnuRYt2fbLfmJ3+Yl7vPBO/riZ4?=
 =?us-ascii?Q?e7YNBV72MKm7hpvnumQ3EaHugsd8/XrlZqxDkPlWl/ObS0fJbQx8rWOXRohF?=
 =?us-ascii?Q?ZXFJ2EqINzbSTaGMwGqwuIlqn+4sOoJNIna6iLnUAhss4RhEttUNjHLPogJL?=
 =?us-ascii?Q?z6W+EVDHjDP1Utyx+gmBXkhWoakE7i8p+a5yW60QwGdsXjkr0EcyNmmnq/sc?=
 =?us-ascii?Q?ymifbjrtDeigKtxImmYjDyQ0UpmW2EfLkljaFKww6ZiS6NQ1w1klzw8TZv8D?=
 =?us-ascii?Q?iuVZRg+v8bUwhVLQKmz9nV+K79xayIu3HmYr/ouY0dzxitHQ1iGZz3mu8RmZ?=
 =?us-ascii?Q?rVXhkVRaRvZKG2SsaQv/mhfGbEuGytlhcm7QfePERb5ZqYHHhOJq7FJDnYeb?=
 =?us-ascii?Q?LwlIDfyVRWt3OX51Hke692N1QOBo972UIF149Lmv2XskUjST2uoHBi/0+d8w?=
 =?us-ascii?Q?iD2NleaFtGiOZxu0+RFnGBhQKXjYrc/GMj250y/kp6Qz21vTOaZ4gNB8bNIq?=
 =?us-ascii?Q?maECTh8I6iY/3cn7PYEQTM3zKg3RVqYp1qbSL19PW9Tox0NAnBsIupAgi4qS?=
 =?us-ascii?Q?XbJRfqDrhPyBRE+INpJEki+Pb+VJl+0ztwHtnygCi2oU4u8blB1ZIhB3rE+e?=
 =?us-ascii?Q?FRvMuzrTJ7HfV6+VWlbV3XmTGzEzL4u3QwD6e7A4/N1wgh9QHJBsUQEHRetB?=
 =?us-ascii?Q?S3V1qsZ6pMS4yep8g1lPvsN1afAjWJCGIW7D26sGMRsTColArRpuJ8XgOZhk?=
 =?us-ascii?Q?zDf3W2bTIgK56CEGey2euSAxpDt+rjZgJ3GJaxA5a0Q2CPt+vuDTfOVri4dR?=
 =?us-ascii?Q?6GlHaVA6j+aZ4TW/FP/Chp0LQQsMX5G+1lrYXL8eEyBJovIW3BlX2LsWvFDq?=
 =?us-ascii?Q?0tfsMwZJSW3ld+ftKreShxHEPv60RA2Fd5kZ674h65m6nQi3g080pfevys1+?=
 =?us-ascii?Q?7qNAxlvbqyt8Jwix3ioviPLq5zIQ2FiADAMXJHM7ZEJPH4B4UxDzn96aZPj2?=
 =?us-ascii?Q?WljK5/sJClwc35fxcmlUbZg7/UcU/7rRnXOeCRvr7EeWLlNc32CaJ7nEVbuF?=
 =?us-ascii?Q?cahabHbPZEG8M94kIRQ00hN5mQAXthle8kJpODxi5QqP3voIAs8Z37qs98sx?=
 =?us-ascii?Q?J6e6kT2o8c/4UQHcWq8JV0an7vxgKFAykwKgZQL0ENOjj282guAiij430VG8?=
 =?us-ascii?Q?T9QmddGDvYxytySWrdK8jS8Su9sXITH/UDPvr10ldxhlDk2FZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KkvScujGA+w532LapRsltBKb6jX5bn9li/ql4St0WwbndiRw7RWPC1P6Dbrm?=
 =?us-ascii?Q?4osEadNBBuKqqMu57o0wlDEVmdmbWoN4CpX1syUD9x07/uw0scMBuGu0sKZn?=
 =?us-ascii?Q?wCjSmQn9yZPt09jcW9iqrn8X2ubggYcLVKACg9Zd0kHAVqZl0YFU1ozDl7vr?=
 =?us-ascii?Q?rW+7ovyz3B3o/7tL1h36uFwGMMrMePvJd+2RqgZ3dorrRZ4ntgz91PXMRsMU?=
 =?us-ascii?Q?+vLz//wgfc6AImCvR1LIhwnoFZQysKTidTGaTdG1I0kikCeaHthxm1pL9U58?=
 =?us-ascii?Q?0v7rr2LBZ4FDTjbgmhcooyURy3tuKrri8/+a4NCFdfmy7G8q0u9viKiJirL/?=
 =?us-ascii?Q?Jjg/YYgdZ7BfFAmdLlyKaiuBcOQoh6LgIGzADjF0pzCqDCRTLJr2zFk251gg?=
 =?us-ascii?Q?EfdvR5UwTZsByxamqjDwQZaunv+EYXtBYc1BlxmCOWFLau+rk772F0NK/ZGA?=
 =?us-ascii?Q?2t7iOfu/jtVjTMT2tBku3mXxvnCO3GwmsjRLEWhzesAy4tK8m1jb2A2kpLNU?=
 =?us-ascii?Q?0qAcFkH9i9PLfCknPMBbPnf1bLO6z/+B4IWlihzN1zvzSWQqYniJO75vj4wB?=
 =?us-ascii?Q?N2kpEOBgdMZTsGQWZ18my2+ehcCuo8/G1TjqYr7vUxrY/w9H6Q6mvjNFHpi0?=
 =?us-ascii?Q?hx0CfG0zsGYdwaPYvFzUmQdbb/OGaphMlm3dXZyzRiHlN7kb5klhIdFxQHVa?=
 =?us-ascii?Q?h8YizYUi2Z5l65CXJxltoxUwlm71mQ9duEFLMCiJYzTD5yiztHZGgAt1Icps?=
 =?us-ascii?Q?CBc8BxHNllCFo8QslDIwnRkQa6lRmtl/rTsYLzV/tXwQ97gkHxsjEJLbpAhK?=
 =?us-ascii?Q?n/APNzxaep1mlwR1a4DSTUZmdCiqnJ8Q6uKbADHEEBPPBd9Ao1sD8nNGa2vz?=
 =?us-ascii?Q?vDz66lBLdaC6QbOBIsj2dM9T3/D4k0CoRNkW/bYWKS1cOggiEBhpO9EgRupp?=
 =?us-ascii?Q?Mtusa6InZ8HVf5qc838y7QpEYS99gwJgC+triJ25E9DvlKPOjbM/XzR7Bm9v?=
 =?us-ascii?Q?+x3yCwgUphwVQX1Xa8m8LhQjTZwTnubHCi+uxineRePG5EGjf+cyKKmyBes3?=
 =?us-ascii?Q?8NZGlPy/3rAs6nvSJxk+rgNA1LR5TWDytALYwSlOMgOcXAuOUCp6xMAw8Fhp?=
 =?us-ascii?Q?3uoOhlMdJVvj6FtH6tsCb1UV+kbPFUdTx+7pFYqqtdecqcoBX3/0OxeCX0vo?=
 =?us-ascii?Q?abu4iwswdj5cZ4oQQkdhhrvxceVL41libH8clfVgCeIdJBh9A8j6Y1nq4CL+?=
 =?us-ascii?Q?cJ3N0sHmCI28g8PoS/0Au4zO/NcWFsNBDWeyEqPMFmw9c7W4oR92yXYqz3gR?=
 =?us-ascii?Q?YFgHWhxn/4bXwCwEvuTQhxQAYBfgxCNykWeHwGMBhWqnV5+AoRfuWBhdUQxa?=
 =?us-ascii?Q?Uqb3/2GLuBldlv91f4pf7P/Wl/i1Sbzd/gfbhHNkhXD8Py6q5ZCzfBvasCUK?=
 =?us-ascii?Q?1MLd7/xLBBTPhGQTV4TlPd/w8cLsISBALoJ6zIhbOXaZgf17jlMK1/752JHB?=
 =?us-ascii?Q?Bs64mDD1oxsNq4x7Hh7/t6iHdJfamMyy4+v7EntEVJmPW7URBdUEPcm3vUfx?=
 =?us-ascii?Q?6f7khRtXuE7vwNkfx5YOCYJlyQiXYsFEBMnPrDDv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 738e0d3f-d47c-4506-1680-08dcd7b99397
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 08:12:02.4250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SObx2b9SSDTymzcXMuesMhDMcRdXeKY858QLrcOdA1dL224vOg9jpg20TiSPEPGu6cvOE+KCa+mseoAsvpY0sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, September 17, 2024 3:14 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 2/2] lib/igt_kms: Don't abort in lib helper
>=20
> Instead of aborting from lib helper, simply return the status to the call=
er and let
> the caller to decide to abort/skip.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  lib/igt_kms.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 9313e4c27..b40470c02 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6596,7 +6596,10 @@ bool intel_pipe_output_combo_valid(igt_display_t
> *display)
>  		combo++;
>  	}
>=20
> -	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
> +	if (!combo) {
> +		igt_info("At least one pipe/output combo needed.\n");
> +		return false;
> +	}
>=20
>  	if (!is_intel_device(display->drm_fd))
>  		return true;
> --
> 2.43.0

