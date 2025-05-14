Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A7CC3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 15:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E675310E26F;
	Wed, 14 May 2025 15:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X16o34cN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B691C10E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747234832; x=1778770832;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aYOwAYIr8duNRoQWM+qz+39CcrNlpD+9PsR1B0wB228=;
 b=X16o34cNExzfyKD+WO8PvGDaanc487T4A3YlLmARrfPBw3ylNTqNdlxI
 DEmG8tZPq+lzymxzoxA4jgboc3JOjUkfVdsa9ZNabCr0rgFJ+2b2Qye4X
 c6ZEmVZ915mZFYCwzdr1Y5nxksYr2amrjpr5bSsSxy0Q3kOhUOA6vu4Z/
 B9nmotyzFZxEU+yCnQ7L483tHlrn9HCfmASxFjEWHDibJTML1zD4KV6xZ
 k0X4wxsagTxnl1WATPm4AV2oFsu3WI5juiZTi/DbHoTcXzcvasMVdunOa
 1sDg9sZHYHha/1OrT84Al0eGRE3vhImlzP82fExzY++Ri7aSp+Sn33GrQ A==;
X-CSE-ConnectionGUID: y5ZVdMRVTJO1TnKgPb6NWQ==
X-CSE-MsgGUID: IY6HPpqfTFKj366yJPXCsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="71640448"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="71640448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:00:32 -0700
X-CSE-ConnectionGUID: 4qE8atmoTxCIe1GObbRjMA==
X-CSE-MsgGUID: AKah+2SkQa2bp9QcDMcSgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="139060719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 08:00:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 08:00:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 08:00:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 08:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOJ7mAOyW6Bejt9k49AXjqlUH6sVAuuXRkP9r4A/qCox2mbzBchwU3PvKi9QBTMzg8IXqepAg/smi35Y2vmcCGy6WtvAeYInFW61cm0BY/Y6zFzENRtVdYGJcd2Au2ECihmJ+dstlLzN2pHv6tGPhC1UZLE1gOofYjEwVUm+VDdl6eQ6vRL+4UKv1VU381x/dgI9498Lag7ddHVN2OaD04QakPCXhrBkSeRF1W433jp0u/l6MeiHPc3BskQIEVfXSiFY1hpG9FuvFm6DZ8zvmprlsxbO3d+wgP+mtc+BAiRO+9vDYw3G2+EGT3Np72GUSkbTMjLPrL5Zu16AEkknRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYOwAYIr8duNRoQWM+qz+39CcrNlpD+9PsR1B0wB228=;
 b=G2DWekAftdCyH3lVzR8FXBwdaaHKwAhDSeuTgPNIyED0JDQm9vorz404i+TXNv2ZylF42fkDnniK5j3LYe8dSQnRgKG5Vz9/svf4yAB9LlVG7WARMvck3i7BtsBLcvdmCqWKDQ3ubQ8pEZtV6/jjt2wRuv0LT+uDJYFz68dUYtCf9MT5tjljNK4IdJCzdyCD9JZIaPRnT4opY3I9g+S/zGV5HNOcfwZ5e229ua2MutUW3ZzDPdB3gzisJICgiPat2uKKLDVShAyM4bWV6/EVOZF08yBBvJnDyOu1e7U0vC7brg1iarJMYD2EdTUcgBXLxb1wtoGQ2N7fMHFaryuCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 by CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 15:00:24 +0000
Received: from IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240]) by IA0PR11MB7353.namprd11.prod.outlook.com
 ([fe80::f88b:66da:3b8e:9240%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 15:00:24 +0000
From: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "markyacoub@google.com" <markyacoub@google.com>, "seanpaul@google.com"
 <seanpaul@google.com>, "Santa, Carlos" <carlos.santa@intel.com>, "Singh,
 Sapna1" <sapna1.singh@intel.com>
Subject: Re: [PATCH v4 01/15] Add stub for libunwind, procps and glib
Thread-Topic: [PATCH v4 01/15] Add stub for libunwind, procps and glib
Thread-Index: AQHbv2nZBxXGS5bF3kWWRdn4FPtq5bPSDiyAgAAzzzQ=
Date: Wed, 14 May 2025 15:00:24 +0000
Message-ID: <IA0PR11MB735330013D7B954E8F750D7EED91A@IA0PR11MB7353.namprd11.prod.outlook.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
 <20250507160148.53857-2-jeevaka.badrappan@intel.com>
 <hc5xutqxss2jbhsffjzl2cqg3eu7zmva2l5h2hoqj2htzwwhla@edk5zllh7r5m>
In-Reply-To: <hc5xutqxss2jbhsffjzl2cqg3eu7zmva2l5h2hoqj2htzwwhla@edk5zllh7r5m>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7353:EE_|CO1PR11MB4962:EE_
x-ms-office365-filtering-correlation-id: aa2e4061-fb92-49e3-0970-08dd92f80e0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?6n0rANpmthELql9sMTRKCYtm0fVuUwiAcqfqs/x12XoS+onGIQk2/Al8w6?=
 =?iso-8859-1?Q?o9J3i7S2UWQ85Ew0UOULvS9vYZD8lBq0ZHpD+MwTi62JvUUzh/Hu5i27Qq?=
 =?iso-8859-1?Q?1nI4stpRiff4cGwX53PrYctWFM5hl+AzL89RQ0uFAF/WcZvlNzg7DLhOPA?=
 =?iso-8859-1?Q?uOEp8G6AraERmZ+B+lhpi92u7vhlpSoXeCSds82KZsCRcMhu+GZub8K8CY?=
 =?iso-8859-1?Q?IYSr6pkjy442yZeA8FFFlQ9SvWRvv3o5OsnkHn80476xJjcUCG+4qehyRQ?=
 =?iso-8859-1?Q?p/M22z4p3QRvunHhXdZjNzDFILGW2HAUBUwd1AIZfw7CAuYKWfE0Bl57EK?=
 =?iso-8859-1?Q?+SSa/uIbUWt1oQO6n5jJuotSz7IsT72hYW8p3LdeGEsfm8imF4g2ndN5OB?=
 =?iso-8859-1?Q?SkFX/KYhppfDSyuQC10lw8P9TP+1478YEm12WEHvK8EcGuIGnANVLJinJf?=
 =?iso-8859-1?Q?w21GU5c500jMRRCAYoRUYzR2WhGM+/MXneK4zAqg3HzfZZYfPs1zUmkNe8?=
 =?iso-8859-1?Q?FE8N/Y6to9SJZAjnq9UdTNgQv5zV5vW2N1iSy3nkgEdvgPLGY+JC1hLbHh?=
 =?iso-8859-1?Q?8FQwvaxwvYE9vebRhW1N5ZxPN5O9Z1QG6w45zZZXMrrFQOQ7caOS6N88Vv?=
 =?iso-8859-1?Q?fc8Wks0uxMivQlI5+bGTHSfi+VexWMiwp9/nvWyfwHatkk8KapqK/Mw9jS?=
 =?iso-8859-1?Q?WbDdbi41MkkoxSrZ/n3v93zDK27nFub5jl0bSamFcm9L8vSMfFkSh1mD25?=
 =?iso-8859-1?Q?yo43axoCYZS2SAOVCfq4568n6tRsiEuOxH2L8jly8BSXs9sXMUj2Vg1NOH?=
 =?iso-8859-1?Q?d6csSJaTChNVY5R684ROtcY46u/0c9IpuytB4ddbUAittqqaoBG7CSL+cG?=
 =?iso-8859-1?Q?bk4mAaZwwGRQmxClitdmi2oOoTYFL7JakkLWKAvmsyTuUKMu350R2aoTm/?=
 =?iso-8859-1?Q?OGBGfAWEh2Cd2aerQYZ5d4m/52MXhwpxieyvAK8VpJ8fXjlLFqqCn7u6JM?=
 =?iso-8859-1?Q?uqQ9Bn+71WV072Z9mpt18n3j6FyAay70Ygl2VS+vROtLwGCeMomdUSox93?=
 =?iso-8859-1?Q?4Etvyb8FRowIlbMEBP3uD8s92CH5dLraHc5tOPOst8mKm0WRZxhmoFc7/B?=
 =?iso-8859-1?Q?eTtxfAR4skx7Mx+vTtazInP2t+UmiQYXRYNNQnaMAJAHmUn90HyrM8h6Hp?=
 =?iso-8859-1?Q?9Ge8qeUiXHm/MUSpe15Eow3Hd9ZMBR5CODQzO/8R1R3cM7FvhO7n3VtGAo?=
 =?iso-8859-1?Q?N7dkIWzs4u6k62F3YlzgAX33jRE4SaDWJxhmiNX1k9rdnih4eVsNenIA+b?=
 =?iso-8859-1?Q?vHI8nAVbIzDggLKIKHWg028yts+ByYRtkMt6b7lJkzdlri+09zheKxRB8q?=
 =?iso-8859-1?Q?hiPrFV9zAGL1Ircj8NFv2u948lhBMW8DAiwjS44ML3UTB4yDbXMjjXuXC0?=
 =?iso-8859-1?Q?W2gnvhWVTkaEXky2kTMSZtaq830Xry/2a88S96cr6jFewoO0w5SpcZR4w7?=
 =?iso-8859-1?Q?W2TynbNDBodn/Za7hTzj1z2asFbzLsLcrEMW2mg7XZaw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7353.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6vRgchJ659FT5cNwRwmBVN46n9U9OKls9BrKus/6Z05pl8w9raDuBkYGyV?=
 =?iso-8859-1?Q?8T7Zcembv5CIvS+SxMTtjCQ8UY2+whpvG9DmbIRjQyYkqsEI2hnUBjjoDW?=
 =?iso-8859-1?Q?eQKE6STVnbqXNcySBmW88qLDpLcntYKzPuHeul9jVH41p973GE8aDZJIp4?=
 =?iso-8859-1?Q?PIIahLHhLlspQbtPLZY7o+JY4wCWU7gTcsyTGn2fq8I6QoUxuWXqgJbxMD?=
 =?iso-8859-1?Q?ngyaX588PBFQOoukYDSPKhOBguI2tG9hMoAYYxLgajJBPAxL8AUQsAdxei?=
 =?iso-8859-1?Q?TOGPMEnYuPhhGtZWWXUS9Z/y7SBPxqYr/7dJAkpY3P5ZAi6d84Xa/frvZr?=
 =?iso-8859-1?Q?eLfQ7hcNnP3+hcwSzHg7bSk05umkmlO3a9usgHkcI+nIyJS9S4R6MJlSty?=
 =?iso-8859-1?Q?bJjO+zdPFborH1khLaXBiaHHMaH+Vtjon9HrfIa+/3I0SUHLE9q2TKwUap?=
 =?iso-8859-1?Q?rxgxfqcvfno8TqExpkFRyZH6eUjE+AN5jYyIe64JkH2Zg2KArK8w4BA0cu?=
 =?iso-8859-1?Q?DZu194ieRkk0OD7HGAFxM3Ns2kn6gax+KvDeK9hqhY+H75EJDTbH1oBbrF?=
 =?iso-8859-1?Q?bcJla9pNFgg/T+Hi45EhPf4F3M7ewJHL0ZLydwSP+F7qglMEqTmD9jaqQg?=
 =?iso-8859-1?Q?ueU+CYXXfKvR/Pq4ekeR5ikVW2ABnq6caOteFmsVFsblibXHL3obQTKb0o?=
 =?iso-8859-1?Q?3Jgblf99940ptFb3ctnyDyeGMtdaWJX4m+W3mzkXz+Wf7Nk3XJ2wnHg0bs?=
 =?iso-8859-1?Q?coSZQMmN3hq4sAWv3liJDqQLBtdIFMCuQ7kFKR/g1t2g4KMBirO+HwFjgE?=
 =?iso-8859-1?Q?01ck3gCq0YOPATmTxhuSnGSEMNXGCJFmoW8W7RJeraqTDxhIelIiA/rFWn?=
 =?iso-8859-1?Q?9QRaUkQMV9pziUZPcgw1x1ugHXp4DrbqgoIvQs2yUPYiE3j8DlO+BD4tyH?=
 =?iso-8859-1?Q?qi4e57IukFG/FWKbQzponPUzeS6N0qv1icYFgxfRM+GggtNZl0IJECyNYG?=
 =?iso-8859-1?Q?D/YKPubwdPi5+zGdEGcpjzEWHvU+xquQpxkMKnu06ODui9JwVGlS0sluqz?=
 =?iso-8859-1?Q?LdMjjClPHsPLMSauv45vkAvktPU3A9fqy44Zx+U79RxElZz98yxV2GJcJq?=
 =?iso-8859-1?Q?zg5+gAWUkXt3n7AfsjEDEajP2IBiOScU/LWdRUQtOcvf0ZxGH1C6lvSsbJ?=
 =?iso-8859-1?Q?/qHmxEK3+q4y/AR/vJduyoDyNhZUO/Yc1UDHn1WwGLDzt2mlM5rZE06JV8?=
 =?iso-8859-1?Q?GstB9g4ApqXg1HN/UxobX+0Gg1xhI7ij2uAnrvQ7XoIMNv++FeaAO5dQlz?=
 =?iso-8859-1?Q?rFvWLxyMd0rjh+RZFa+LMS07zzpAAOREMoQoI5y3lQzzTAoxrYDivhPiYK?=
 =?iso-8859-1?Q?u9bbzLdoNyumiCPQmN6OINjMJxl74Yf8ODAfyatuE3D/bmAzAcN9iamg9C?=
 =?iso-8859-1?Q?OUNN2m4A/0K7wohJAvzEA6KtZcNQneDw0fImBxAyHieQfZw4l6aTynJtEP?=
 =?iso-8859-1?Q?N0aOeNTwbra6XyR35lhSdZNUKJwYu/VTJ97oQVqGelK8IqYV30/RC+txs3?=
 =?iso-8859-1?Q?/tbJZxt6tCdXe21RSsMB7eLA+edkZichQs04fHTB9AnVO+GiLwBh3ENq2T?=
 =?iso-8859-1?Q?VGMXDw2P7VcYWlpuwncrxaqgXwjC3m/y+i?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7353.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2e4061-fb92-49e3-0970-08dd92f80e0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 15:00:24.1205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2LCHj7efboUyTyyIZ4nzNJF18zTetT4JpVMWfi4jT/kyx8s92q29+W1qHef9JTCqVSYttqqkHYDQwYML+NrF8SBs7ePFrTk59lzi8AJXSmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4962
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

=0A=
> diff --git a/lib/igt_glib.h b/lib/igt_glib.h=0A=
=0A=
> new file mode 100644=0A=
=0A=
> index 000000000..fc1743970=0A=
=0A=
> --- /dev/null=0A=
=0A=
> +++ b/lib/igt_glib.h=0A=
=0A=
=0A=
> Name igt_something.h may be incidentally included, especially it is=0A=
=0A=
> not protected with #ifdef ANDROID.=A0 So I would use include/android=0A=
=0A=
> directory to put these includes there. And I would name them=0A=
=0A=
> android/glib.h, android/procps.h, and android/unwind.h. For being=0A=
=0A=
> absolutely sure no other os will include them you may protect these=0A=
=0A=
> includes with #ifdef ANDROID.=0A=
=0A=
May i know which one is preferred please?=0A=
<igt_root_dir>/lib/android/glib.h or <igt_root_dir>/include/android/glib.h =
or <igt_root_dir>/android/glib.h=0A=
=0A=
Thanks and Regards,=0A=
Jeevaka=0A=
=0A=
