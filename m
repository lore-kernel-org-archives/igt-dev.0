Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E186C88E7C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 12:52:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E106510E21E;
	Mon, 26 Jan 2026 12:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEbji9o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419310E21E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769431929; x=1800967929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzh6KpL8WGAInarsEDTpNaIstpeRr9ZHzriHGeoz4KQ=;
 b=hEbji9o/7bXli/BTqL3R48OqRYmJGd10ImiMDTzpxhzw7fVVY9kB6X14
 MKmRKmDlIPpdg1szCqI5JknOVebdI/3Q9xqgkVJv0KeHOTx7a97VB/RZl
 eW8Jt9NFXe75/J5xJCddqv4QviRDAJ+61lSMOIz8dqV++OExHsoB22Eyg
 fi228yq/irMmFgeXyQF/IEkxw8NqVxtFCd4Kn6QO2FxxEAQPKKuFcgSbm
 JCDuoLSWiRVSO+bjHPB19T3qIxq4rpTGW1qzJDW90f2WMKCYZRRgxu5et
 jK3MAKo02SiECSnHnpM08uZBi8AwXlJV3hU0XotUURTQ687+i+ut5I3uM w==;
X-CSE-ConnectionGUID: LnA3wk8mRRGwL4yIcpkNNg==
X-CSE-MsgGUID: JZGWbVLMR36a70QVxssrOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70765203"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="70765203"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:52:09 -0800
X-CSE-ConnectionGUID: O498fb6+RiOpZb2v/6X/bQ==
X-CSE-MsgGUID: nydYFjfqS/uMsHiT1wCaEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="238352272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 04:52:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 04:52:08 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 04:52:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 04:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soNztoC3lXVB3dWFF5pz6fVOGDohizfZxMH0xQwjsGA2X34SqS0r8RrBtcWTx0LwZY5+5ZRabJc6rlcK1L8Jbz/911p/0piD97ZS8yTZTAScMIxJ3WwKxpTzm9JydH1NK0YY4qlCGz2CdXxAi6MY6L10iIPlUvUq+cey/VePRUIG5R+3KtYoXeHAGpOjz6SEYVAIOpagz1oS7is94lalBWsdGLM1WZp1iJkteqDNRh0zz4e3TT6xs4QkRXPLVsfQVktrK6nXrYA86KWD9iG16+x24NU+nuu7YZR20yiUGwfQet3MkxMK1LREuIn+yhX6unBDoz2qpnSoMNP92p3pEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6eDlNdP386dw87O+qxPL6y0f2JQ/KC2ZdRD6U00K+0=;
 b=wBgnPU2agdLzFelye0KKQvGiabNwwa2F3ugOxDz8oYlFjy2zccpvbISszDQt0Jsh7h0DBqJ8P/GcP+D1oJ859GcRn38Mnt+KjDmvs7zUNtdPsmfBKSOkqfDyuC2yYgjc4MC8yqFYQVMB6OG+HjOEK8U5IRLdQKfNzm1yXfnLbwwffMaw/n6XzuwfhASPfkygyOfqJE6vggWxAHLnxKIRqu6k+X2MPeS2b51awAit6iLWpi65TnFHQrmi6bp3Kyl7MfPpofVwN1Hj+qEg8H+m8xebO7JQBgzRhAlKYRNj86LGxa5xJl+/PJzIj/cJ+kJvd2wRrpe0jXeELL+atAUqTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9036.namprd11.prod.outlook.com (2603:10b6:208:565::13)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 12:52:06 +0000
Received: from IA4PR11MB9036.namprd11.prod.outlook.com
 ([fe80::1f06:168a:b2f6:dac0]) by IA4PR11MB9036.namprd11.prod.outlook.com
 ([fe80::1f06:168a:b2f6:dac0%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 12:52:05 +0000
From: "Thomas, Sobin" <sobin.thomas@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t 0/1] RFC tests/intel/xe_exec_reset: Filter expected
 timeout dmesg during reset tests
Thread-Topic: [PATCH i-g-t 0/1] RFC tests/intel/xe_exec_reset: Filter expected
 timeout dmesg during reset tests
Thread-Index: AQHcjDUQbpQuEZCFJkqHxErKKX69XrVkIVMAgABK2KA=
Date: Mon, 26 Jan 2026 12:52:05 +0000
Message-ID: <IA4PR11MB9036CD6BB7F98D5F62557BEC9493A@IA4PR11MB9036.namprd11.prod.outlook.com>
References: <20260123065238.48129-1-sobin.thomas@intel.com>
 <yygmzo4qw2r6doq57emgz6ezid5brojuhwyi5oo23koiff6c2e@gm6x3442pozp>
In-Reply-To: <yygmzo4qw2r6doq57emgz6ezid5brojuhwyi5oo23koiff6c2e@gm6x3442pozp>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9036:EE_|SA2PR11MB4988:EE_
x-ms-office365-filtering-correlation-id: 1882e43d-75fc-4c13-cdbe-08de5cd9b5a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?f5wQ0MB1jx4gCpnRM6iSD8HZmGA31TRDmVEghGQD4DdBnbnj3Fx6ORufOrT+?=
 =?us-ascii?Q?JBEycdlJBxk/kJNFvu/9iaZ8zNZAkcAA6nwoPdJQR+g55wJb+UGEfZzRyDUe?=
 =?us-ascii?Q?tAD5l0tn+nwQFcTyebshXWlwLAj2st97NfhoN5lMIgkPTvl1du7zZbXY0bAz?=
 =?us-ascii?Q?icpdIa2fFCJR4ds/txsmnlYlHo4LvEBwwmY6uqB4reLVPcMgSkC+yzsUHhbi?=
 =?us-ascii?Q?uxBDBOicm+t9X6zPLo8DFIbBABHu8sPgwMgi42bOBjWIeN1DBFtszX5gI5o0?=
 =?us-ascii?Q?+ncwxsvdC9ArvblT7Lxj/iTwatSXp6pmGQkWrUn/+vEjB5+17pRt2lIKbFkw?=
 =?us-ascii?Q?xKbrmizoeP3wACn8aw1GYtyDPPYKnH85AvT/amhLPjtdp10Ib1tB3xPfNPkz?=
 =?us-ascii?Q?Gl4QE2tXWEFgvrwctCK5uiaiC2nZdNrqDNLtRDuXqLk6hNbPhj3+p+xA19rt?=
 =?us-ascii?Q?eLxzashqKiEieMr2xGrap+xXNnT7OnTpL+dn39ZWz6V2UXNYSOvZZYKC5SAW?=
 =?us-ascii?Q?UHDw3cz6gbQGJ9nU8oXsE4uUN7ofWRM9QR9Sg5MWyXH240F8mryL94jalNrW?=
 =?us-ascii?Q?13R3/CneV0j+OPypCswJOM6Y9U/ox3DwHxWwgj5FYUcvHyIBNDfIKu30DlfF?=
 =?us-ascii?Q?wCTkloB4TdIrLv9mUJW5PVBPM3HQ/cNx94eN4zFn6pl6mJ2bV9IgNh18Rs/I?=
 =?us-ascii?Q?rvhy5l1jJvy1TPqOEqtk5ko/TKD/8WgSRQxIqHvbx6asidBrNBNWHorZYop7?=
 =?us-ascii?Q?fKMjo2SeyiYYO5Ij+OJi4EtFL91SD5FW/U8ymy70bbymCJ5RdF/zfoNOOqHR?=
 =?us-ascii?Q?r2xKo7TDGlhpu2lfLDuWoXqTwS2TlvtAJaK1CtSnjscweK0Pm7Ffg/k4s87n?=
 =?us-ascii?Q?Bfbljd9e/mIQjco1JyDiovIQW2ipD1mnzNzJXz7KV1OjIYDmLc4kJPFiix12?=
 =?us-ascii?Q?K9E4MGutQguEMF74SoyI0Y0DxtGVrVww0kHIdZuCam6+7+2k2dE8MUpbHBdo?=
 =?us-ascii?Q?Dfg314yIwUCAYn94VZgt7Fgx56IDX+yhG7+9cFhebT1mFX/3bZkfFonCP2s/?=
 =?us-ascii?Q?owlclMK1M8KmseiwFlTqCPpqZkO2v3hzPva5gi9m/2SXQTmWM6XvrnjTX96H?=
 =?us-ascii?Q?t8qCyYv9dZ1VcPPbw8omqPSwCSFJd1TuhE6TAyX0j800Og5SGnj9tYvOTKqB?=
 =?us-ascii?Q?Ec1iqO4izSfFTlM47JRia+Ca3AsuoYEljtI/Jhn4mS79l8haXMnEpV3Xf4S1?=
 =?us-ascii?Q?dgxe9EdKNfS8BBA9oVKVDhuiraM8KYnl91au9QU+j+M087Q4KekHP3qfZuX9?=
 =?us-ascii?Q?vE23upgOFvNvzl3OJqie/UMaof849R2OcsReoTEKW27kSQbMt/nxC+EsvYgL?=
 =?us-ascii?Q?FhpxJYJ/zlDi723FJl1IcksvAuV1ZVmvjtKsiCxOJD9se33pAdW6Sl8jj+iG?=
 =?us-ascii?Q?ijeuZfbj3eaAfM2MpZXLSwCCGIZHyVXj5oN2/YFJ83ZiGCTEOYQwuEtRYB5M?=
 =?us-ascii?Q?jRpeFusfCbNYsq1u6HLcVNzU+yMIhvVivSkNrHEq/WnYFcWz7rE0B/ltGeTN?=
 =?us-ascii?Q?BwngVrQlt/Py24KUakkhaIaKkLW7zRevqmL5dWPbaBMxb75hwwrDTKnNmNvu?=
 =?us-ascii?Q?/7MKa+IPgmvBx2UNdL5yTzfmE9lmVB7IZTYWCzIp2k60?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9036.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?koSVMWs15u/euZF0OFUpo3w0BeXXHQcuC5vj3HdLd2Te7vSmdhxn9HiqJmA1?=
 =?us-ascii?Q?c18r5S8jXmWbd+dm3TLnx6CVVGDZ+wpnbWPaEOh29jBxu3x/zAgIhsTHAmH0?=
 =?us-ascii?Q?UAdpaEjFEPX7o6sa8Z1P+HQZOCn9M44ed2q1UKXa6FUQ5MEokbgB+LiqausT?=
 =?us-ascii?Q?ENTU7ZISBO0TVhaBbwXdEX9t2XpjuUBQ6gZ26GNgOqnYIFyR+bVdFE9WVz/u?=
 =?us-ascii?Q?krWYgLOKw41LC9S/yeZjr8vmXzAiGV/I9yjQF4ef01ykWj+8RCNSSqqUwE0z?=
 =?us-ascii?Q?ArGkZe4toXRcrJOL2xVIjfrL1gHFGx4BhQWHWWq6mpap+mg0nX/HxCnCQyOf?=
 =?us-ascii?Q?lz9mHcJIb91oz7a8W/y2NtswCCQABkguQXjbZBLxb+VcVxl0/9Uunzm6q4OJ?=
 =?us-ascii?Q?51jH0ViQWNfitfjFnB9OjiPNrPSi3w3CYaZg6ar0CD41aYPostbfCw8le08Q?=
 =?us-ascii?Q?w7FuJxuv40AOoB3erpL2lathxmvv7NNyZo5GyeqXBp9GKTMA3GVCS8Laxif+?=
 =?us-ascii?Q?PYjpmHo8pYSzk291ulk+VywftXWJuXw3+306Yc7aeCffkzd1RQ19UmGBer+M?=
 =?us-ascii?Q?Ud5gVrpUMdNp4EBufesqANo7aEE1lxqoLlE/XTTQCz8LlO4TuRX4XSG28ECQ?=
 =?us-ascii?Q?kAbb2Y2dm0XO0e4pY3GRbK5cyYSWH2m/t0Ao6t2F/qAQK0zHmfefE9fN0cM8?=
 =?us-ascii?Q?XCvJqhBZ0ynQelFwzqj8djdhjXNrId1+4ArywrZvodEIq1cTy2bQCDs3hcaW?=
 =?us-ascii?Q?oyy56WIegq+aI1eKglTzodWnr6PYZayjYC5IX7W7pes80VTZTM5C+RYU0jkW?=
 =?us-ascii?Q?KoZS8jua7lDdCq5q0+5Lyv49BP7+OVEfy3omB9tF+LdFW9BBlp4wQFQ+BEKS?=
 =?us-ascii?Q?wPsl2BAL6qFeEhnUJ7YDgARO1CD9qE41ky3Nva6Y77iS/+HuzNXd6jp/NoTq?=
 =?us-ascii?Q?sPchjeLX5MEadqHMD1GFauHRHYtIadvrOYRNBdL1EvPqc18S8SDn2nLkC9Y9?=
 =?us-ascii?Q?XX7o9sHXOXL/PZsCp54KxzDGpq/g5NAd5JLW1i24H+ZjYyoCB/kyXyeGH4QZ?=
 =?us-ascii?Q?XQWhkJsqOcwPA20xPpwc9dG2QhhWrl5wcETg3Gpqq82m8rlohPON0gUsYyZT?=
 =?us-ascii?Q?cxP47UWiNpmnue8bVqYr5isb5G3QjuS5+Ck3C4O+H8DUzloKKGVqWe8gkOJN?=
 =?us-ascii?Q?h+JEHtKRvrXzl53tQdFVq0Usqrp8hSmsBzTDUXgFHl9aUc2PSZMFUbn5VsJm?=
 =?us-ascii?Q?cV5vt+cqkeXFI4Gdi1ORK8Ok7zglyqzyQgxIfRe/6Q3sA1BjH0Uc/nejZQM8?=
 =?us-ascii?Q?QhGyeh/VmZD26PPvH8uj6jgF/k/8UwdD59bgd1JO47solLcw4Vjwqm+Hhwd/?=
 =?us-ascii?Q?0fY+JBHRZdwJy/fyFd6JmEKcz/nNCTkwPHbNyyM/Q6sb7nQIUgoqKBa2Swe6?=
 =?us-ascii?Q?6ONNt3bIH42GMO1qWOLJ4NYBX/IZwFxWBWSRIAJ9TuCAHGA6GBlaUpFG09ID?=
 =?us-ascii?Q?EaPmxTg2RNU48iW1ItlA2cT33rgFY9v7VRNCWpvPClSPJOCtbKt/nmQzmdhI?=
 =?us-ascii?Q?g2fdked+1Thm0P3qIMBnDl5WHtEb8QcDlVxXzNY2XuheDoUG6CVaxC8h+9xM?=
 =?us-ascii?Q?5Q0tIjS0k/5SgGV0/hSbqN/lymux/mgPlDyQ9hdriDjuwMAMjXLnZ6pN6ii0?=
 =?us-ascii?Q?UydOdb3cgB4skCtBASiT7iaXUpTXtzd41/51JSqnfOtsJCQohGsBsGSd3RhN?=
 =?us-ascii?Q?kMLSyo1o0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9036.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1882e43d-75fc-4c13-cdbe-08de5cd9b5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 12:52:05.7686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IgemUoIuySmd/CPlLF/4WE4EryqQRhrJnTivQF6zlU6u5Fd48IxFpWToXMIazohIMxSOGHbzuxcOOOSFjhhr7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
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

Hi Zbigniew,

This is the job link=20
https://gfx-ci-internal.igk.intel.com/tree/xe-on-upstream/xe-upstream-4447-=
6d7af7c5b6b121d5595b64be7dfcbf33be53287b/hwre-BMG_G21_B35_VM_X2-391/igt@xe_=
exec_reset@long-spin-comp-reuse-many-preempt-threads.html

=09
<6> [2165.241389] [IGT] xe_exec_reset: executing
<6> [2165.317176] [IGT] xe_exec_reset: starting subtest long-spin-comp-reus=
e-many-preempt-threads
<7> [2170.492070] xe 0000:00:03.0: [drm:guc_exec_queue_timedout_job [xe]] T=
ile0: GT1: Check job timeout: seqno=3D4294967169, lrc_seqno=3D4294967169, g=
uc_id=3D7, running_time_ms=3D2693, timeout_ms=3D5000, diff=3D0x02ef90ee
<7> [2170.501081] xe 0000:00:03.0: [drm:guc_exec_queue_timedout_job [xe]] T=
ile0: GT0: Check job timeout: seqno=3D4294967169, lrc_seqno=3D4294967169, g=
uc_id=3D12, running_time_ms=3D2704, timeout_ms=3D5000, diff=3D0x02f2d92d
<7> [2170.506269] xe 0000:00:03.0: [drm:guc_exec_queue_timedout_job [xe]] T=
ile0: GT0: Check job timeout: seqno=3D4294967169, lrc_seqno=3D4294967169, g=
uc_id=3D10, running_time_ms=3D2707, timeout_ms=3D5000, diff=3D0x02f3a078
<4> [2170.509068] xe 0000:00:03.0: [drm] Tile0: GT0: Check job timeout: seq=
no=3D4294967169, lrc_seqno=3D4294967169, guc_id=3D13, not started
<4> [2170.511316] xe 0000:00:03.0: [drm] Tile0: GT0: Check job timeout: seq=
no=3D4294967169, lrc_seqno=3D4294967169, guc_id=3D9, not started

Sobin Thomas

-----Original Message-----
From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>=20
Sent: Monday, January 26, 2026 1:52 PM
To: Thomas, Sobin <sobin.thomas@intel.com>
Cc: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>
Subject: Re: [PATCH i-g-t 0/1] RFC tests/intel/xe_exec_reset: Filter expect=
ed timeout dmesg during reset tests

On Fri, Jan 23, 2026 at 06:52:37AM +0000, Sobin Thomas wrote:
> During reset testing there are timedout messages with lrc seq no and=20
> seqno coming in CI Dmesg. These logs are causing CI warnings.
>=20
> Since we are intentionally causing the GPU reset, so timeout messages=20
> are expected behavior rather than actual test failures. These messages=20
> filtered by CI and incorrectly flagged as errors.
>=20
> This change adds ignore_timeout_dmesg() function that registers a=20
> regex pattern to filter out expected timeout-related dmesg messages:
> - "Timedout"
> - "timeout"

May you point out CI warnings you're mentioning? I've checked:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-4441-4a255b429d80f8b0800bdef43=
ba3175b771e77ff/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-=
gt0-threads.html

and xe_exec_reset tests and I don't see warnings related to timeouts:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14404/shards-all.html?testf=
ilter=3Dxe_exec_reset

--
Zbigniew

>=20
> The function is strategically called before operations that trigger=20
> resets to proactively filter expected messages:
> - GT reset operations (xe_force_gt_reset_async/sync)
> - Legacy test modes involving resets
> - Compute mode tests with GT reset flags
> - Thread-based reset testing scenarios
>=20
> This ensures cleaner test output by suppressing expected noise while=20
> preserving genuine error reporting for actual test failures.
>=20
> Sobin Thomas (1):
>   RFC tests/intel/xe_exec_reset: Filter expected timeout dmesg during
>     reset tests
>=20
>  tests/intel/xe_exec_reset.c | 49=20
> +++++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>=20
> --
> 2.51.0
>=20
