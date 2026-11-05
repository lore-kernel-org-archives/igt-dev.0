Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC19606A329
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 12:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H+fIQPS9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8383610E035;
	Thu,  5 Nov 2026 12:37:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BADF1123C5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793882184; x=1825418184;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FVQcfbGRPWuhMOWqMaPrIdtODC0Ao7+ga7AWO2HyazU=;
 b=H+fIQPS9ut+pACrrUwiC9xjqFW0lxbqJUII8qEC+wnRQM5syHl0HFaQH
 xb0hdX/jzwT27h1OWPpeN2QS+coPqv1ujGiGnZRM1xdj5EdSfbyRfRBsG
 Ru367xJpRyK1s/g0Wlxho9p8qKgF9s2DRCZQdLwHHi9MSy1j540SAdSYn
 WEWuVEW9m4+d5tUJTuqUT/8U31YsGw/lG52T5lTyMRhfUfmePUabjhiPe
 wdSlMqh1wmCFMIZLdISh7i+W5KG2QVMslCeH6x9wR9JjdQB61yAyFf6II
 qXp/a3skM4oTo5y2a0oer97GoXLcH90zXXo1FCd5+Mlv75QrMDwV6PpOx w==;
X-CSE-ConnectionGUID: Qr+FN2jtRFWRL3Me14ERhg==
X-CSE-MsgGUID: /PLL2CIiSfqXDiBcfVHPHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2552526"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2552526"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:36:24 -0800
X-CSE-ConnectionGUID: lIJPnW35Qv+GurXynOC6Pw==
X-CSE-MsgGUID: Phc0RdmoTP6Uujc4DOx30A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7342001"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:36:24 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 04:36:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 04:36:23 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 04:36:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ok9f5ptzaf949ER8ISAFFfxN0XuDuC8g8Ulz+EIboXE29NL3QR7Gm6aLEXHlNomxXHlPBli36lCI0P05XhDkFIKWWJKWrvB5eQTkMaNByX89gFnN4InlbuAQbpf0JZ6KWE1xNBP2jn2uMA7XMrUltzNG8SGQf+MQYkooV50UrolaGOIX6yl+B+wn571dPgeTDMVXYLmF6fVQek92DEJwGiD0tJEOtLZlWgAZojMCbXqz8wRTB+0BLpQmB9TbRUW7VkuUO4mqrcdAbkS4yIcyv7MWsEf3BPMr/NgmcwWGCLlrd4Q1gY5WJZq1D8tBLk7Uhq6SZtnhr5CdmxlFr99XjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhWaYYjiP/B8+O3yVo9g+NjPHhLcw7DB4IXIx316bIM=;
 b=g2AayQQEsgVxQo4fGJPE0+lxiZ7qOAvy4OYgh0p59OHcJai3xEM95HTi74YOhNO9jfBevfjTPGVlwraNqzZ9jXqu3ppRqUYaFjrJ5TOUDdFeDt3r+TbqWM24m+PGhAbsIqWIbw7/rdRxR0PhY45mOmQdidsvsCWEJxMf4VUnPaIivs7qxyL+SkDpdSCdZ0IfcVks3lAwEYZ8eaUbge/+Vt7DL9ZrmZtTkdRqrKzNbCgkpVrUfztm27T83v+ACWJvDLhbruNA6g/wlQJ6vY+Rzif7fhpk6NsKuLsdGGp7WHDCUlTTIocfBmAC70hmiWb/Ai7vcHW9G5dcJ4qsze+lwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by IA1PR11MB6420.namprd11.prod.outlook.com
 (2603:10b6:208:3a8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 5 Nov
 2026 12:36:16 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:36:16 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t] test/intel-ci: Add xe.multigpu.blocklist to
 config.json
Thread-Topic: [PATCH i-g-t] test/intel-ci: Add xe.multigpu.blocklist to
 config.json
Thread-Index: AQHdbOAkZRN1QU1pukSw7rCKEQVISLcfahZA
Date: Thu, 5 Nov 2026 12:36:16 +0000
Message-ID: <AT6PR11MB0728443630FA5DC2562952B84698772@AT6PR11MB072844.namprd11.prod.outlook.com>
References: <20261105044609.365584-1-venkateswara.rao.muppidi@intel.com>
In-Reply-To: <20261105044609.365584-1-venkateswara.rao.muppidi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|IA1PR11MB6420:EE_
x-ms-office365-filtering-correlation-id: 6d57b412-2669-4997-e026-08df3b3962aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|10070799003|366016|38070700021|11063799006|261009223027099003|56012099006|261021121427099003|261022075727099003|10067099003|261102123227099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: hdfzQ29GAgTBm4di+s8dHVTKzG6RHxqu0Fm6tTpZFleQtCkPtIhPq8nIlTMv3jTu9nkOIEdX2TU2SUaDYfpGjLVgfYw0BUVsqOLTI+JMXuqRLUP4VMyaP1Cj+8UlDs6kQnJXKJsf5KnlXA/CSOYqD/oXVPgyBNAcPXZgmKQjsJk0KAVQUHtgBB7ooAHOVCwC74bwvxV5iklAcM56dP6BSGJxQioj9Zo8IDDXTAYuJJYp97lcvgJxM5AGvYreVMmiHDLDteQblVqJFXehvpEDb2HXN66f1Os2JdM1kNWbok6ZIaT2tpo8Ws85uJGiK9p0k87JznHi6bSwuApvwE/mPfonQwwfW8VanRY8gvFlio9T2vv6OLeQ8kRBwXgRgZ1irlSxYgfv9a25IXleoToVqu9T7nafUBihEJ+NntVF6PkZNXGrgmrdspZgA1sKk1xj9NMAgjPj2736RI1vWxnFLKWA3THaOMfVJplowQ74uU0kCzJiIDvD5ZTfkapoA0hhvKpZwCwWo26PHhqImZVN7mfh3ASPr1Acit8aVGzwLXYvq0vf1Qq28JH2iYvop57E7hlbA7G6pbcWnlv25Zqvgl+wmpoC8Ln0E5CQyNIWayWhrLhhJMUNVvylqZvmdfOO2/ioLNE8LhbQt/QT8n3NR87x4YiNNYFw3QSJgHN5V4hp1qYmawAwTMKFkG4LKwPYd8Z9artVKixaiTw1NN0sN4CINcdmPpdqQdMA6J5StW4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(38070700021)(11063799006)(261009223027099003)(56012099006)(261021121427099003)(261022075727099003)(10067099003)(261102123227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Uneu+gBP0tC6wEcDxtbHz61QXzEMjFdpVSEXxR8dromlweTUQzCNb/eIpB6z?=
 =?us-ascii?Q?JX5Fc17DtcqnXYI0e1h+yj+Ab2B88erEHM1+AWydnaXsLLed29NaXt350wk8?=
 =?us-ascii?Q?aBqhlIcnGX4VoTC0LHDucwdLTZSlf9g9hAx0Dbs05Kf6eeexlLjVXFjzHhjj?=
 =?us-ascii?Q?EwVMC7kHd+7/1DvDIsIlLrS1B67U2z/QdY40QJL7prYpOYJSQzIHbwBqZ78I?=
 =?us-ascii?Q?fkiU4ryK48FyM9wDHDXl2mSfj87GaaDRmsSIALTTaZm3RSA4Xfmae5mW+1aW?=
 =?us-ascii?Q?RLcYFMWaG8+/6ym8fX7CIeCJFmGbHMb5OnzHw/kFumEgayB64Wg8FiCCFC3m?=
 =?us-ascii?Q?vPvUqn0q57ZV3QwEz5ERCOUbmlhpBkA16Y5lLiL+tjzhglvInFGWd6rs8EIC?=
 =?us-ascii?Q?1jzbrJ/wtFRePpZ8e0M+NnVpSDFJxu4EXZeEEk/AgqpEpVHgLa8T/GP/Bp8k?=
 =?us-ascii?Q?73paBAZ36Mf2wDhwAJdO5FOKUq8CSavOoj7DHfXUO4L6/bz7KEO7lyyH/vTh?=
 =?us-ascii?Q?I0iN8iTXRrJ9YQkm9J3lULj1pAkVVx16NrilEt0RScfhP26XLVdrjJ0GSJ2d?=
 =?us-ascii?Q?1WASouDL/Fl2Vk6cpuRSfWH0YGmPE1D6byVpJ++4S/mYbDUhn+oqe1pEjGHV?=
 =?us-ascii?Q?Egr0Ey4JSJC9ZXI9KjcSMLTlII4LH6Lp1jqFkqkNm3gzLH4Hk4uSTyhqnHbq?=
 =?us-ascii?Q?cV+3N5ldJec0qc1RafLf1JWGF/wYCvO5bWHfvJmPqxQ5U6dQOEkBXK2e0CNK?=
 =?us-ascii?Q?QZCnauwfh6cQV+iSUJs3TtdLMELvhSSr9qFZcXEJP4IBIG3PLMZ8jkCfGRtf?=
 =?us-ascii?Q?deEmtuFak4NSycdnxslofBLy9c1ZYKCpUi5iFlA8rIswyLmQMfUEpEzildax?=
 =?us-ascii?Q?goVAmgJlMnBWhup1p9oQ8dySWheon2Y9QlqKcD8M5UB83rA/zPzSvEb0u4F8?=
 =?us-ascii?Q?zxyVP4HnTsK6LdJ//itIX+FFzGbq/RlKC0xSAcK6CnsaEYRbDJt+fT99a2g2?=
 =?us-ascii?Q?VDoIO42ZLaYAEnCLs20aWFtQ+FCpIQk+C480VfebuG521FqWo0y53NL327rs?=
 =?us-ascii?Q?OOLGh/Se66VRWJ3/iHIa0aWm146cbKxG/RV4nigy3ICr8eujPJDIyi56oD4a?=
 =?us-ascii?Q?fUE8UMB/1n3q5ZXFI/CnucNVXOp+9gDf01J4Gt2ppwmtrE3o414PIp4kVwHO?=
 =?us-ascii?Q?J1l6pBOUzUXa0KNNah/Jmv/KaXTl4Y8Tiw1zpWAMedGLh/pysaKt2RTIR5vb?=
 =?us-ascii?Q?HjEIyqjZxCuJn/n1AAMxbmnqCOQT10aAdIxM7UIlIA2wqbtNv8f+GOo1dZr9?=
 =?us-ascii?Q?KWTTCxdyvoY08rhVAc7A0IVMJHJEcfRwQea+HktutrZ1J5u53OohQA7cncJw?=
 =?us-ascii?Q?XN3XEIgismjvYE8MVosx3FpnYCUukVuPoihecvfqPeg//zT/BBRAB2kDyxnQ?=
 =?us-ascii?Q?YYnDau6PiDxIeGOIqAtPe3NB7TJKwcwbl8YbD8vgRNZFwhmg28LDOozPS+UZ?=
 =?us-ascii?Q?1WyEdB8L4UL3gtF0HA32sin1q3mpKe0Tprx/uatDDkBRVfAmtQcSxCk5ee6e?=
 =?us-ascii?Q?Ma5VhkknUddVKlg/WlO/WnoM6Ilf13TVSXR3jUQhiXDtA2RBpA0QV4+pSs2p?=
 =?us-ascii?Q?w3qmhcS8no+gI+tWLZ83D8SaE/mrPNZdQXRQKAQX1Rg4grFX6u/PNRdHYY1z?=
 =?us-ascii?Q?BkDsoyOCnughJvl2NcxNUjTJ7tSNPb6HYjo2z285e716ZmHIp6+t4Gg5bd/I?=
 =?us-ascii?Q?B6C3U0dJaBUTsNCGGS5+ThZzZExzfpoT5c03PjTbwCiGPys/SS25tkhb24uA?=
x-ms-exchange-antispam-messagedata-1: zjJOAVUDmtwJNg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vM1f2REQ2HF17JjBo6FERx+8CVsexBQeIBzKOxgqTzEtAVOwG4Q54ggZ7r9mCHQeTZoSj/f79VQz8U6GzyanTLlkC7ZnyMkrfVXM/ByuPBBGgqHL1nU4GBBNYevFEGZVPkKgf2JRICTbnbPT0r3LiMa0KvT/aAUO/ikfrM6VDeuu1uLvjDhe6crcv+RhZmCGE2RRuVEYfpIlSJ7Ji6OMjFQS+MHFZbv/IaN/1xlDDt6gPUIZzCvStpIt6CkG885YcbjCLyH7wF8OEVCv02DQOLbulp/hFPqXMUIfuJA4jKuIZ1vhPmSV5gZmOSqlwHtz8fisCVmB++wpitYglRgwwA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d57b412-2669-4997-e026-08df3b3962aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 12:36:16.4127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zTzSu3OwXXxSUzy9Dbdqy6UjLhJjrROOJL3EXBOnqEghy26sRoX0mSiWdpMhA95dBL3DCcpsHgorDo6pt3b8ryb+kjTwMCK13lzBGlGHi2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
> Sent: 05 November 2026 10:16
> To: igt-dev@lists.freedesktop.org
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Girotra, Himanshu
> <himanshu.girotra@intel.com>; Muppidi, Venkateswara Rao
> <venkateswara.rao.muppidi@intel.com>
> Subject: [PATCH i-g-t] test/intel-ci: Add xe.multigpu.blocklist to config=
.json
>=20
> Add xe.multigpu.blocklist.txt to the "GPU excluded platform" section of
> xe_test_config.json as MULTIGPU-CRI, so that testlists can be generated f=
or
> the multi-GPU CRI configuration for CI execution.
>=20
> Signed-off-by: Venkateswara Rao Muppidi
> <venkateswara.rao.muppidi@intel.com>
> ---
>  tests/intel/xe_test_config.json | 1 +
>  1 file changed, 1 insertion(+)
>=20
Reviewed-by: Himanshu Girotra <himanshu.girotra@intel.com>

> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config=
.json
> index 43c758f5c..f6524166e 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -82,6 +82,7 @@
>  			{ "CRI": "../intel-ci/xe.cri.core.blocklist.txt" },
>  			{ "NVL": "../intel-ci/xe.nvl.core.blocklist.txt" },
>  			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
> +			{ "MULTIGPU-CRI": "../intel-
> ci/xe.multigpu.blocklist.txt" },
>  			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
>  			{ "all": "../intel-ci/xe.blocklist.txt" }
>  		    ]
> --
> 2.43.0

