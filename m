Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87B2C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 10:58:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A35D10EC41;
	Tue, 22 Sep 2026 10:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kF4f2hHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51DD10E4EB;
 Tue, 22 Sep 2026 10:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790074691; x=1821610691;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xHHOMBB/HDy7gD+aAfzEyjFw6osDS3zlDoavl0edaGI=;
 b=kF4f2hHMdAnsKzaXzscqtzRULRidpmGgi1E2OIHDf+FsBEL+7OGbX9lh
 ARq6crRwLMxpR9ShJ/zJqkWwGwXDHwYGDbY5uW3qD5V+Hw0ismVuSrpMT
 ILYZJXpW+LEr3Iy4oN9W0rOaWQVNU4kR+BRDmz8AukdfA6+i6D6Qrb38L
 bdq02kN9gpDaSj05s0xclZawv99fomZFFoAbTCV+gaKeLz8a89kIjk9Dw
 YO7BfJI4rXJXNVhULVFrg0ZH+dC7q9RwT6e2DKVlsxzjDDoORLC6ngRG8
 76kiMcRgeuxgHcq/MInOd6v8QcGgsCIO65xJQy9HbKCR6rjU+rlhuHSKJ g==;
X-CSE-ConnectionGUID: QP6uWAPaSxyPAvfqSzI+FA==
X-CSE-MsgGUID: OWkd3+MVSNWHTLuN+GTUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90534550"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90534550"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:58:10 -0700
X-CSE-ConnectionGUID: KfrCpGNsRYCODZbiyyUitg==
X-CSE-MsgGUID: ioEoig+2TNWk0PsbGTR0aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4188381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 03:58:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:58:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 03:58:10 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 03:58:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs411+VShgM8rQvdGSvgMYE8c+D4pIc+j+C2jLMyw0qWoSjF5rGcHsrW7sKsMUzjXA/V/zF6tuBW5Y1WVUP0xT6vCiMkSJvXn9O07qqMzpEhas+j8CUZvWUt3N/TeqJsn5MMtOWYyDOgzu9x9IiJfuEe/WVq7FvpPZrRvfxMV3Gv96TlEp2WQ/3f4M0gy0ylmzwoLjj4SFsYO88kgMZXfx48OdKgOva+msQCJ1IXcQa64gaq0GOYFsCogv+oQKC/Ch9LADRyOQIe4VX27A0KpCUALvTxJ+ZbZvgTOMMLzYrK6AAXic6JCTSWil3d7CAzQMcd6tpqTjyxNWzojhU7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHHOMBB/HDy7gD+aAfzEyjFw6osDS3zlDoavl0edaGI=;
 b=vs7ZQ6oL5r0p4kDm72vOKU4QJs/tBOKAIPprdlASsUPxKpZ1QpZj7eRmAQk3NcgpFrbDxlHFFxXRzCM1739tM18Qln59WZrj5r4Ag891nefHUSGQCcNIeTLzpu+HkbPQpMwU7Ue5Ykti4TxLehp3qvdRmnSyYN8oz83eECaLqHnU9TXasxHj1zAmHpkIREn77fpjwDDQM1zrrtlVguZbzbx0CsSDbtAvDuOSsBSE65Ep7Q1d+WkuXRsWTCJUXTdVan360qrNnWAozb2WisAJ+zomWsrnHdOA6gYVJ4sFgTm/1LtYrkGSzVEKjGeLSUaw8qlrC6ilEZdv8Qv0gkBh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by SJ0PR11MB5769.namprd11.prod.outlook.com (2603:10b6:a03:420::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:58:06 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 10:58:06 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9jb3Jl?=
 =?utf-8?Q?:_Make_build_reproducible_(rev5)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBsaWIvaWd0X2NvcmU6IE1h?=
 =?utf-8?Q?ke_build_reproducible_(rev5)?=
Thread-Index: AQHdSnhEyD9pV5Xei0y2CpyX3MohALbaXFGg
Date: Tue, 22 Sep 2026 10:58:06 +0000
Message-ID: <CH0PR11MB54910BA9C64DDD7D04C9A4C9EF832@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
 <179002292294.188435.348951557947320157@61270ab9df2a>
 <20260922095241.dnbofkcpeto2wgx2@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260922095241.dnbofkcpeto2wgx2@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|SJ0PR11MB5769:EE_
x-ms-office365-filtering-correlation-id: 20012a9c-24f0-47ac-77c3-08df189861ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10070799003|13003099007|38070700021|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: r/ezvK7jQxvbILb5iXpek7C8SrfpLrbiZxef3J4GpGRzSKgnAoMLhifc0FERng8FMFkarxwYkz02ymDaFAeuqmQmXcnn8Iv8GN+O5SyVUEYUFwirI0XYTZlT0NMH7+4e83M30u5zdszRr3UDCXXsykz2I7Ep3LJzLQ2yf2zR8lOdROdv/IpUaU8bF5FCxR7XBxQ3Hw+VmF1QF73IQjVU63PEicA8vod5Xbsoqi064jmPtrJ63uioocwH7vOfCfTVr1rLOZxCUpg80tnF9Yj6LywVj8cETQN/hGLOffvbMZvmH5LtO5Gtqkdnpb2nVaK4sSkPitdyUUbCpvOI2LNZBAOdq57RnPU8HgrTKT+kKL+8tRw7FW2bkcSCUN1zGWxeWLvBWwUs7rXRsAOWCSRfHYz2L0iVaOe9ypPsXbJepZYKB16cv893E127XfNGJNfAY0hY2Hy2z82Ga9YYRsTANY8UO9XTqzlC0JTq+a3RlrVdCDZMRN0PdyUciNQwHH+5Zfi1ybfqI2ElttfkqkbXqqXCRcnNb4b9rF9ASPA0Z/Bpf460nKXHF5ZF0N2mQEpp23tBcUVm+/vF+rS4095FbTBpskQIEvnoSFx0o/K819A4x7E71dG//ld1hdVYCqCMhLBhxGtq7pHggxnZ69u7bFyJJDtnvgd6yMWkMIoc13o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10070799003)(13003099007)(38070700021)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THAxTTd5VUpuaVg2bGc1U1ZLMk9nKzRYaHYrNUs2OXNkMkMvdFVaNXZ6QzRS?=
 =?utf-8?B?ZEtZZmp1ckJzL1ZrdTAwU2FLRlBPUjlsMEtXU0lrRVVpQ0preWtBUVI2aGJv?=
 =?utf-8?B?dGhUVUFGYys4c2lwRzhKajF2SXNOWGxUSW1MTWVvM2dLRzNSeEczYXphV3Yy?=
 =?utf-8?B?QXl3OGIwYy9JRzQyVFhXRHpEOENEakUwbnJKK3RzNUlXN1FrZndJMG5DZmVB?=
 =?utf-8?B?eUs4UGprK1Z6cTNFUnA1TDhUQkZhblNxMUFubmk5TlFiV2pLYXBqc2NWMk94?=
 =?utf-8?B?eWZibGw2eVVNLzdpMjVNQmNNd1RyU3lhMll4NlNVVENCM1VxOTBSMHRzUndr?=
 =?utf-8?B?UTAzWTIyQ1JIWldNMEQyR3QyZlYzMXk0Y2g1TDZaZWUyNzNJbVVUYVNHTmUr?=
 =?utf-8?B?K21WNlk2OC9hV0MxbjFOaU9IZlR3Y2RibmF2TG53YThxcjh0YUR4R3Urb294?=
 =?utf-8?B?NjRrQjM2Wmp0M3dZR2JTMlVtaDc1Wi9ycmp6TmhYN2Rld3NKYTFzREVOR1FX?=
 =?utf-8?B?cktPbkl3Y1k5S3ZGSHpDQllkdnBidnpZQ0JqVlYvNnBaRTRzWEtMVEc1Sm81?=
 =?utf-8?B?NzlpTTZRRGNMN05ubUhlKzVuRnBHN1p6R1lObThYUDBreVIzelZIY2tibFJw?=
 =?utf-8?B?UXlPRVFtS1N0Sm5WUE4yWDZoUWUvTUNDUjF2WWh4cnpLRFJ4elo3THVBYTZW?=
 =?utf-8?B?dGdRbU5ER00vM1RUT2xWRGZ6dWIyc0sxZzF5UFYwQS8yTHJrK3krK3hBTDZX?=
 =?utf-8?B?U0FiQ1hhYmUzSW5pUWxzUFBXSXlFeHZ3WEFTNEVuKzVTNE9paFpHNlpDUEYv?=
 =?utf-8?B?d3p1SGgzMlFNUEVpUzJTM2E4b3FCMzFUdVZBVWFjVE1JWldtc3hGZEVFNDlM?=
 =?utf-8?B?TmZZNnlFeXFUSDJqYmwvVTV0RHJla2FuM1B1Zzd2MmR1VlcxQld2UGd6QzVE?=
 =?utf-8?B?dS81UWxlZVRQUndBNkg4Wm9zcCtVS2Z1RjZtZTBoZzlyRFR5RGxHM1dPTXB6?=
 =?utf-8?B?ZkV0VlRXeEoyS0ZtMVVsRFg3YndKS09QOGx0YWJLTTd2Q2hSNkJiajZzVkZo?=
 =?utf-8?B?T1Y0WHFiYkFuejNqYjZVZEJWYVpycHc1c2lQd2taRW9pYnhIQjVJMUxKUCtP?=
 =?utf-8?B?YjlCbmZxeDR4dWo0WVFabmk2amxQQlZkckxRRXN2S2NnY1dGS2xFOG0yWU5u?=
 =?utf-8?B?aEtSVjZqaUIyUkhtQjhxUkdHclFKMzNNV3BwSGV4R3lTajhpS3ZqU1lEZlhr?=
 =?utf-8?B?Z1RhVWZwTGRrdWpGdThNOTNjWnUzQnVML3VCaWF2YnA1L3gyTXBnSXUwMzd2?=
 =?utf-8?B?WEcwMnlHWk1pSFRSNVJmUytndExGanFFV1B4allRQ1R5ajEvcENjemNYQUNH?=
 =?utf-8?B?R2FSaXVjM3U5TGxwa2FrckEzY1M3YitJcnkvWU1qZzJqNis3eHdSano1NXRy?=
 =?utf-8?B?d2pUVUxNVXVtcWhpdEwrM2I3dGVCUG5rQ2xKNytNYmt5S3F6VWpHL1hZLzda?=
 =?utf-8?B?SzlXKzl3NW5saHlxZjN4cUtNV2w5ckd2dXJheDBRUzl2bGd1R1ZZaWhQWVo1?=
 =?utf-8?B?MTdYL1Q1MlY2RlE3aGgrZU54c3ZuVEt4RnlMTjRIVm1DMnl2NEgrUExQWXdI?=
 =?utf-8?B?ZFV1RllKUW5od0FZS0g3QVowcXI1YW5VZXp1YU85QVlPTENidC8wSWJuZHIy?=
 =?utf-8?B?TWFrU2RJeWl1OC93UEtNV2ZHd1pkTkJoZ0JUdThLaEoxZzlpNjBPNzlHcUNJ?=
 =?utf-8?B?by9TeHZwcCtVWlNXQzBEaVc3b0ZNL2lxVE9tNGlYUEx0cklrZVpvdzdGYk1h?=
 =?utf-8?B?TzdTSzM3ajlBVFkxRTZkaTMxYUxQK2tPRDZ0a2gvZk82bnV6Sk5EQjAzRGJo?=
 =?utf-8?B?bjJLUjdQSXBRdmJ2UzNldkVZaTV5c1hqUFQrcmIyb0F6WFlZYi9mcElRaG5r?=
 =?utf-8?B?WVVadWVjTTlDQ3RwWGwxNzBITFhBRGZkV290L2szdk51VkVkTUVJSHJOM3Fj?=
 =?utf-8?B?NVFDSzBBSkpLUFRZWVU2UDdPWXlnMXF1ZHBjL0ptNTJEWEdHU21kU1dKeEhs?=
 =?utf-8?B?Y3ZOVXkxSEJ5T1BQVklBVlB0SmZ0Mk0rU2c1NHhFcTFRREtnWE5JWGJDOFcr?=
 =?utf-8?B?bS93K1poRHpZMG1Qb0g2cXc5dnkrb3ZFQlRYN3IvVG8zZWx0ZHR1bUQyK3dS?=
 =?utf-8?B?RVdqSzJkYldyNEpNSjMvQW03N3lsZXZ2ZjNCOVcvbXVkbzh2akFGUVN6TkE3?=
 =?utf-8?B?ZVAxNi81M0RSMHRHVmpicmIwTE9YMStlV3g2eW1ESytra2s2ZmxGTDkxRHpM?=
 =?utf-8?B?L1VYY2w3VENEeUthQW03bElpRE1iSE5zTUQ3RFBibzNSbTlHbGE1M3IzaHB3?=
 =?utf-8?Q?hz5CwqY4XKyS9cGPZYIImibI+a2oYVcaKDJxsY2A35rlf?=
x-ms-exchange-antispam-messagedata-1: YzvNwe3digp0Hg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZiBylGFgNwXSIZrDf7KRpjPLwmuSDKyFfDsdh/iSeRWMefF8/J+WyX74SQG3qoZiHQmONppbeNm9LyFYEGHxSUbBM18qFK49+pdeL0vPdwui5C8fgP85fbkV1KhZbSxT6gd/MHPaLMENyaTdI01IDqFR/e902moROWe31N0MNaC12pB3ywFWstI38HHaH41cPe0QwJfb3f1ASN1b8xJudNIrxNVzKTQ6+3Gts0x53h6UoneQKLPTHSVdneQlbr+28dZ7Nl0emA3NfUYNEye1+eOLLsb5g/r6XkMoZqGWMv1zae/MBmFaFRqkZcnz7tV/qwZDV8NN53FpYpI6GcGViQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20012a9c-24f0-47ac-77c3-08df189861ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:58:06.3050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjbQmZBNuHtASCtiFbS+tZTfXoR/yz67pyHmShRVlnMq+dkirvlzNBgMk0vJhMiLKp5Tt3cX5FG2U/L3jdwjihmWPl+5Gm/8nmOFPOk/6uM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5769
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

SGksDQoNCiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3MzcyMy8N
Cmk5MTUuQ0kuQkFUIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5rcywNClJhdmFsaS4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2ktaW5mcmEgPGk5MTUtY2ktaW5mcmEt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLYW1pbCBLb25pZWN6
bnkNClNlbnQ6IDIyIFNlcHRlbWJlciAyMDI2IDE1OjIzDQpUbzogaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCkNjOiBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lndF9jb3JlOiBNYWtl
IGJ1aWxkIHJlcHJvZHVjaWJsZSAocmV2NSkNCg0KSGkgaWd0LWRldiwNCk9uIDIwMjYtMDktMjEg
YXQgMjA6MzU6MjIgLTAwMDAsIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMg
PT0NCj4gDQo+IFNlcmllczogbGliL2lndF9jb3JlOiBNYWtlIGJ1aWxkIHJlcHJvZHVjaWJsZSAo
cmV2NSkNCj4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzE3MzcyMy8NCj4gU3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBD
SSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF85MTA0IC0+IElHVFBXXzE1ODc0IA0KPiA9PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBT
dW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1
bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTU4NzQgYWJzb2x1dGVseSBuZWVkIHRv
IGJlDQo+ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSBy
ZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAg
aW50cm9kdWNlZCBpbiBJR1RQV18xNTg3NCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJ
OTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRv
IGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2Ug
cG9zaXRpdmVzIGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1ODc0L2luZGV4Lmh0bWwNCj4gDQo+
IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDM5IC0+IDM4KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IGJhdC1kZzItMTMgDQo+IA0KPiBQb3Nz
aWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUg
dGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQ
V18xNTg3NDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUg
cmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAcmVzZXQ6
DQo+ICAgICAtIGJhdC10d2wtMjogICAgICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1bMl0gKzEg
b3RoZXIgdGVzdCBhYm9ydA0KPiAgICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS10aXAvSUdUXzkxMDQvYmF0LXR3bC0yL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAcmVz
ZXQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzE1ODc0L2JhdC10d2wtMi9pZ3RAaTkxDQo+IDVfc2VsZnRlc3RAbGl2ZUBy
ZXNldC5odG1sDQo+IA0KDQpUaGlzIGlzIHVucmVsYXRlZCwgcGxlYXNlIGZpbGUgYSBidWcgYW5k
IHJ1biBhIEZ1bGwgaTkxNSBydW4uDQoNCg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBL
bm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2Vz
IGZvdW5kIGluIElHVFBXXzE1ODc0IHRoYXQgY29tZSBmcm9tIGtub3duIGlzc3VlczoNCj4gDQo+
ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgSXNzdWVzIGhpdCAjIyMjDQo+IA0KPiAg
ICogaWd0QGttc19hZGRmYl9iYXNpY0B0b28taGlnaDoNCj4gICAgIC0gYmF0LWFwbC0xOiAgICAg
ICAgICBbUEFTU11bM10gLT4gW0RNRVNHLVdBUk5dWzRdIChbaTkxNSMxMzczNV0pICszNyBvdGhl
ciB0ZXN0cyBkbWVzZy13YXJuDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RfOTEwNC9iYXQtYXBsLTEvaWd0QGttc19hZGRmYl9iYXNpY0B0b28t
aGlnaC5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTU4NzQvYmF0LWFwbC0xL2lndEBrbXMNCj4gX2FkZGZiX2Jhc2ljQHRv
by1oaWdoLmh0bWwNCj4gDQo+ICAgKiBpZ3RAa21zX2ZsaXBAYmFzaWMtZmxpcC12cy1tb2Rlc2V0
QGMtZHAxOg0KPiAgICAgLSBiYXQtYXBsLTE6ICAgICAgICAgIFtQQVNTXVs1XSAtPiBbRE1FU0ct
V0FSTl1bNl0gKFtpOTE1IzEzNzM1XSAvIFtpOTE1IzE4MF0pICsyMSBvdGhlciB0ZXN0cyBkbWVz
Zy13YXJuDQo+ICAgIFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RfOTEwNC9iYXQtYXBsLTEvaWd0QGttc19mbGlwQGJhc2ljLWZsaXAtdnMtbW9kZXNldEBj
LWRwMS5odG1sDQo+ICAgIFs2XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTU4NzQvYmF0LWFwbC0xL2lndEBrbXMNCj4gX2ZsaXBAYmFzaWMtZmxp
cC12cy1tb2Rlc2V0QGMtZHAxLmh0bWwNCj4gDQo+ICAgDQo+ICAgW2k5MTUjMTM3MzVdOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEzNzM1
DQo+ICAgW2k5MTUjMTgwXTogDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
aTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTgwDQo+IA0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiAtLS0t
LS0tLS0tLS0tDQo+IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDog
SUdUXzkxMDQgLT4gSUdUUFdfMTU4NzQNCj4gICAqIExpbnV4OiBDSV9EUk1fMTkxOTMgLT4gQ0lf
RFJNXzE5MTk1DQo+IA0KPiAgIENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xOTE5
MzogYWI4MjQ3MWRkZmYwOTQ5MzlkOTk4MWUwNjQ3MzMyNTYyYzdlMWM5YiBAIGdpdDovL2Fub25n
aXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiAgIENJX0RSTV8xOTE5NTogNDI3MzVi
NjkzN2Q2MDk2M2RkMzAyMTI4MjMxZmI3NGExODE2NGE2MCBAIGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiAgIElHVFBXXzE1ODc0OiA2NjUyMjI4ZTYxMTJlZmY3
Y2NiYjE4ZjU5ODViOWExNDEzZGQyOWUzIEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiAgIElHVF85MTA0OiBhODlkNThkYWQwZGQ2MjIyODI2
OWE2MDQ5YjM5ZmMzOWFlNmNmNjk4IEAgDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3Jl
IGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRp
cC9JR1RQV18xNTg3NC9pbmRleC5odG1sDQo=
