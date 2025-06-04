Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98FCC5B549
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 17:09:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9698710E146;
	Wed,  4 Jun 2025 17:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grow83wZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034310E146
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749056992; x=1780592992;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JTwN5P6NzDuHuxpbi+qS4fgcrK47cg+1E7wr1je+jtw=;
 b=grow83wZT4Bq/BXPSeNFaGpX+NU4gv8aRZnzfUD9DBnqaEvTl72Vqa82
 dm9sCndRR02hAQ4lNGCRN0YsdP0F1QVq73K2u0HL1Un5Ia/XIvesCFwrY
 OWZ4Yu0rsAzYwb8HpbHXJ/sXQ5+dTBIVWNxYxeRjn0SDwCLIxDJcG/5qk
 nRsyEpBuHbvfTOYlBzRNLJQnXbVvW0FtGI+zPzzCgWHTRAFpAFRBecYtL
 +V4P8dGRq422odR3DuAcWHXwWBThxit4/8suL9+zHKItmN6FqTLObJdAJ
 MGIKdkhOIeQkzRJk8N36yO/Afllg340Lseq8xMs38uQ2+xo8dDPPwetIp A==;
X-CSE-ConnectionGUID: n3+CZ3W5TseiRXcADM022A==
X-CSE-MsgGUID: Zser2pOyR3upMfzE35zOJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73687280"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73687280"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:09:51 -0700
X-CSE-ConnectionGUID: SDKeRe1TTcqJdj/A/pyL0w==
X-CSE-MsgGUID: TXJp0mlqQyyq39ATtZ2M9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176133962"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 10:09:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 10:09:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 10:09:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 10:09:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CZuF+bpX3v8j8Au/eb6ty0lDJeFOqdYucF6kd1gqvhOq2RFwxtI4b8Gyl3ccVrS88vEQSA1dD+k9L6TjqhvG6wqpId2gykqJCqwKbs5/gEYx/6Z+/tL20JalFgOP3FtuNRMR4h/lJyE/Mx24bqU/BSBBJNbCiFdkTiFgYCMB0GezrAXIHft8OKw4EYkf4sXIXycVW12jmVGFUHhU1u2PJKzIHvjtQVD7ByLxdB55HkntTp4Rc2OlvcSZRfkBvOHLacwaBuLqg0pg0gWkVj+ZznN1JOnXUSnBtSkrZFLlaAgDDRenrw/NxIb4/MMDbzXlgHd6ydgVzBtnFQq4hDoGhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTwN5P6NzDuHuxpbi+qS4fgcrK47cg+1E7wr1je+jtw=;
 b=EbIkbb3zLinga8lSVfCyPOTjubrm8nLVD/2dDsVwMlF6rH//qDsROsTraq5oDiiXRR/rRaOgAjOedIPNMKx5hC/A8vzEXH8okK79AjqDPU5yzwW8HEmz/+H3s0ET1tK3Onqf4CWkvXK7G9GXpk/JSa7TkQ74Y5aSTp9u6BcGAmnF8MVrFlCum961SWMvQnpBaTMTDI1R8nXh0hbpgRTe+TicEXvz9caEthKUzV/LlSuYZV3rGp+qxh+h2V5g4/pf4dqW1a+3Uk5MU40eDBbtcTJ599rlBufhgCWkSUOjBWsehqt1A+5qanM87K/cMyRDE3iZeSK6Os2WQ9JaLVXbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 4 Jun
 2025 17:09:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 17:09:47 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>, "K V
 P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb1Wx3w/z6J8DnlUGW3OopXlBu5bPzOnsAgAAAsSA=
Date: Wed, 4 Jun 2025 17:09:47 +0000
Message-ID: <CH0PR11MB54440CF370C82F8ADD5AE215E56CA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250604161923.38226-1-jonathan.cavitt@intel.com>
 <20250604170400.mte7k3mun3ucwmtr@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250604170400.mte7k3mun3ucwmtr@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: 6226924e-b665-4d88-bdde-08dda38a9c03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?anBHeWVBK1I5QXE4NEF0OWF4NHhUangzOG95OTZFM3N4dzFvaUtJbGxhLzV0?=
 =?utf-8?B?S1dzSG02MUxOOENybVNxUnVyNkpvYTBna05nT28zTHVaNzMwUEdGWHJubG1W?=
 =?utf-8?B?ZkVxUERvdmU0RWxvVjJZTnZuNVNKQldzNWl0NE8wQmw2N3ZmTU1GemJHbXl4?=
 =?utf-8?B?dEIvaitrZm9LNW5xMXgyU09GbTRGQ2tYcjZydkNzM0FkYkZnVnRwd050cVVr?=
 =?utf-8?B?eWdUN1BYc2kzNUExZ1ZsOUlGbllnVHl1Z2swWHBRdDNBd3dpSkNIMHZKTDA1?=
 =?utf-8?B?Q09HUWthdHhDQmhzMjhjSG12SkZrYjhJdXAvRmVaWjVDQU9OcExxdUNZY0pI?=
 =?utf-8?B?UUJ5WWIvQTh2R0syOForYWwrbExEajJkOHVpRHdxcGFPNkhBS3JaYUV2Ukxq?=
 =?utf-8?B?R2dDWWdZc28wYnhHeDRMNVlaZVV2ZmxBQ1NvempTd2p0cnNaaW0waFNUeTc1?=
 =?utf-8?B?djdRb1JQcHNhNXN5Tkc0VG1oVXk5NTRvSGthbGtvR0g0dkJzNmpuUG96Nlpz?=
 =?utf-8?B?VFp6d2xUL0NDa2tWL1ZxRHk0ZmwySksya1JncjBqT2dyekluK3lXQk43NzJx?=
 =?utf-8?B?aXZYUlpKclJRamI4TjBjQXhNRndTN0k4YzhOSHRSOTJEeUZuTzU0Ym45cmNh?=
 =?utf-8?B?cExOTWhVeHVsQ0dSTTh1aGl6WGExbVJjaXJPbDNEdlZIbm9PeVBmUmhEMVFU?=
 =?utf-8?B?aHh6TjZjZk5kMC9iaVZxd3cxVkJOenM3OWh5QTVES3kxcEIvak1VMDhMVDBK?=
 =?utf-8?B?bFBFeXlqYzdiWEljakhjekNIMDZOTDU2aTg4NHE1R2twQ3EyUmozMGhXL1JB?=
 =?utf-8?B?Y3ZUMEdiQ1dqZHNhRHRrSEpOOVZXV2dhZzUvTkZrNHpWaHJDNVFlblBFZmU0?=
 =?utf-8?B?ZUVuY0ZlK3Y2NE4vUHNNd29EOC9BOHlmTlRBMmRGUEo2dW5RQXJjV3Vxa21k?=
 =?utf-8?B?c1V6bjFrdU85cXk4WjFmVGkveHBXblNHZEhlNHRMay94OEYyelJFd2lDZXlj?=
 =?utf-8?B?UU1rdU9YMVV0d1FrQzBhUnl5QStvWDlXY0NhREhxNWZXMFhvbzJYblcyVURI?=
 =?utf-8?B?N2pCQlhpdzN2bzFhdlhXcG5mbWcvbG4reGZzWm1QK0dZVUJZdVA0QVBBNGIv?=
 =?utf-8?B?K3phWnB3TmFZWDVHTXd3MHR3eVFBZGp0UGIySkhVeFdGUUpxUWhEUGx1UmJv?=
 =?utf-8?B?dDc4NjR6T1BDQ1o0aml5dUJJU0hPWnI0RUU5YUJtcU02ZVhxajhiYnJ1bnNm?=
 =?utf-8?B?SGxKWnZ2SFpUY3dVTGRHVGNJeUdycnlvRUM3cm9RWUFJMkRuc2xMdFRIc2I1?=
 =?utf-8?B?dmx1aU16Mnl5Ui9qQ0NvbmN1T08yR0tyUTd1ck1HTzNubW5kNFU4ODEvTlBH?=
 =?utf-8?B?YjRrVk03NmFCeWJ6ZVo1M2RxRkhWRFNkekZXajNOSUdTSGErT1dMUlVaV2tZ?=
 =?utf-8?B?WXhXM0JOaDMrcGFJRlBFdjdQbU1zcVNTY2lPUm00UGhZWDMxNjR4UitscU9w?=
 =?utf-8?B?MVVGZUQ4Uk5idDBDblNnRWZJUGh2TUFlNFNvT3UrQ2p6ODlBMm1zcXI0cW1k?=
 =?utf-8?B?d1hHTFJzeWU0TTUvcVQ4TUhFVDd1UHYvd2llVmJXT0ttZExzWEZwanVyZk9F?=
 =?utf-8?B?SVRVUDJBY3Q4TmxDZjZVQ0tjRUxTdFVBclRtQkFiK2VMYncyRFB5Y2hoajlE?=
 =?utf-8?B?K2VtR0ZZeks3YUJJTXUxUzVNR0NXWHJ1OFJ1N0UvT0hIdnppdWdUZVowaVRU?=
 =?utf-8?B?ekE1UUhkU2ZvU1h0MWhOL2J5SVRPdXJQU1BxSGp4RkxObHBXVjUvWkR3Zy9M?=
 =?utf-8?B?R2pYVG55SGZScTVFd090MG14TGhjcTY5NFFSMUFJVEhCV0RsaW1oVkkzTTZ6?=
 =?utf-8?B?RkVOajJyVjJBVGw1ckpOUjQ2Wk0wVWtiNU0xZmFUL01CS1FZSmVGLzN5Y01y?=
 =?utf-8?B?SURsd05EZDhVaGJpQittOFhvMGxhYm8vVXNmbkVvK3N2V25PT2pPY3VXV01E?=
 =?utf-8?Q?Az+2P43v8Add4J+CCGydxHNugTGvts=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OVoxam9ERlkzcnA0aEFabWtRUDJsa0NyL2JHU05vRjVVYlAzc1p4TDBsMnpT?=
 =?utf-8?B?a0plTnV6MTQwSFh4NmFqZUpSNmViakdkc2daajdxZWFHbFlYeHA0ZzhpbU9J?=
 =?utf-8?B?cDMreWxjUVV5NklHYWJHTDhHVDdZMGoyUEJKMXo1aHkyZzdEWDB3VVR5b1dv?=
 =?utf-8?B?QnZ6Vml6SkVBM2xha0NKbnhZbW16QnRkQmZ3bVVmNVBDbEJ2bVAzTUZnQjlR?=
 =?utf-8?B?aWpvVHNvUXU0UnViNGtqaXZ6bm1jSGNVT2IzV3JGU0FSWWduT21ndUdTZDUv?=
 =?utf-8?B?a3lESUVxWkVtNTJVU29ZOHBIY1JyNTkwSUcwaFlQK2FzUnNjMGwrVFlFZmlK?=
 =?utf-8?B?ZjNlVTFiSmsyenhiK0h6cVk3Q3U3L3J4MnhyZUQycnVrTC9mSWxlWXNiK0Nh?=
 =?utf-8?B?OGM2K2RFUnR4Uk9kV092M3pNRDR3UERkbUdyMVIweVBCa2RjTmpJR0ZPSjZy?=
 =?utf-8?B?bFVQbDZHbkdjV0hMT2dMenRCTU1HRmRWa1FLZjZ4SDlzWGlIamljc1VPcGJN?=
 =?utf-8?B?WEo1VFNhdUNrOUVtOTN0K3U3alNrdHFXQVRzL1VMa2pHajllb09XVitRRWNG?=
 =?utf-8?B?VDFDMDA5U1g2dTJYdGJ1R1NzdkJ3MHJiQmxOcVJzWXR2Zk11WG4wWjVnK3Uy?=
 =?utf-8?B?OWZQbkxmNG1mSi9IU1dSNUhPaUU5WDdNc3ZlelltK1JOR1FnNVZEZmZuUnQx?=
 =?utf-8?B?Sk9GaTJseWoyM0hxd2lweEgrVVVWQStid2p1Tk5XYnNmRG1ETTFjZGp0anNN?=
 =?utf-8?B?bmpvQzBjMkp1K2lUS0p4aU81b3QraEdBYmo0L3liajdFRXpOc3BuRFpnWmNo?=
 =?utf-8?B?UTg5ekwwRXYvYlVuZWdiY0s4azFDYzNwcHY4OU8xalpDRHEzaWVCNndvakZ5?=
 =?utf-8?B?UUVPY1Q2ZUxYelJ6aHhKOGtxbVNNYzBOZzRMSXI2SGUxU1lDWnRic3VUUExY?=
 =?utf-8?B?NFppVGVzME9OOG9sOUtGWE9abTZYcURtUnBiSTBaZkwrK2dlNTRQd2RRZ3Az?=
 =?utf-8?B?bWJ2REtURDJ1blFMQ0NXaW45ZlFqandvVWZzYlFMYVQ1cDluTVZaQWFLK2lY?=
 =?utf-8?B?RlFkMVU1V0hHWUNaWTl6ZXh2U0dad1JCNjhPNTFpYzA4VGEyMTVGUzNJMEVR?=
 =?utf-8?B?MHROZlcrUjNiLy90YlpFbVE2VFZ1N1B3emhWajY0czA3dmdRemNOblQ1OElU?=
 =?utf-8?B?M0NoSUtnTzYvbmk3b3NsbCtiZytRTEUxQzhIa2dNUm41RGx0SWJ6M1I2TkVx?=
 =?utf-8?B?V2RZS3kyRlpiQ3FoalV4RVViaHNsNXRheGJnempMUk1uZmxUZUFYK05sSWcz?=
 =?utf-8?B?d1NLV1FSQ3pjWXJpRDZxaE1IakVUampZc1pEVVdQOVk5SmxMamlwUVBWQzYy?=
 =?utf-8?B?a2kzYjgwajh5V3NLWGRPR1NGUjdEcFJwaWI3R3psNlNTL1Q3Y3hGYlVhVGZp?=
 =?utf-8?B?d2crTHdzM0dqaUtTcU5pNXlvV3dlNXFJT0JQOFY5NjhuaUZKL0M2Tld6Ynly?=
 =?utf-8?B?ckF1M1BhVWpIQTVOVGxYSFZPQzVPZEVDOFZHcjdMNVNkTXE1MlV6RnUxcWdV?=
 =?utf-8?B?cS9teWU1MWRoUnhTTWZHNjhrVlh6cjRFVWtyNEdnNWpTQUZIbGNuVTlBMitn?=
 =?utf-8?B?bjZ5L3JMK0toM2xLS3JrZXQzVCtGY0JaY2hUdm0yZkVmTU1UdTVxL1MvU3B4?=
 =?utf-8?B?dmZxcDZmWWJxUGJ1Qi9GZzQvd3ZmN2lYY2NRb2lJalY5dit5SjVTTStNK1Vn?=
 =?utf-8?B?OXJ3cm9tR1JIMmNRQlFrUjQrV3p5QzJLZHEzZzdGZ0VDeEhxNDFVbERtVUQz?=
 =?utf-8?B?VDlSZzBQeGJ0c1puajNJeUdydkJaWTkvcjkzQUxaNk9VYXlOMmNncGR5SmpW?=
 =?utf-8?B?c2U1QUFTWW1Gc083N1ZUdXNyTnJMQzFsL0owbG04UnM2YVRhR3VrUUw1Wnkv?=
 =?utf-8?B?N1B6RzNDYnFIREx4QlN3TU5vc3FjVHdFTGxzbWttbitxazdTY1EyRjZ6a05q?=
 =?utf-8?B?UUh3YlFJZitMZzVaUmVNSU94ZjJOdmRsOEZ0T1JsNC9jVmxmbW9wb2hMNzQ2?=
 =?utf-8?B?Q1Bzb3o0SmxlMlV5bmhuSlM0ZU9YdEhMZWpiZzBibngzTkhwKzhNVU5rM2Rp?=
 =?utf-8?Q?bQyCTLKA/cj9WtjvgD7K3imRi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6226924e-b665-4d88-bdde-08dda38a9c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 17:09:47.4645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmMjuswOqgzdV17Cl/+H4ZsBsgm85RVa9hD8CAuRnGg0SL7QAexOW5KOrwN9sCCdnL8kQ1QIFQhHlD10fvlmAVvBxHT1dFn3KBAq4zQaycQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bmUgNCwgMjAy
NSAxMDowNCBBTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEd1cHRhLCBzYXVyYWJoZyA8
c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5jb20+
OyBLIFYgUCwgU2F0eWFuYXJheWFuYSA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5jb20+OyBX
YWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5jb20+OyBDZXJhb2xvIFNw
dXJpbywgRGFuaWVsZSA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT47IERlIE1hcmNo
aSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IER1Z2FzdCwgRnJhbmNvaXMgPGZy
YW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvIDxyb2RyaWdvLnZpdmlAaW50
ZWwuY29tPjsgSGFycmlzb24sIEpvaG4gQyA8am9obi5jLmhhcnJpc29uQGludGVsLmNvbT4NClN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjogSWdu
b3JlIGFsbCBlcnJvcnMgd2hpbGUgaW5qZWN0aW5nIGZhdWx0DQo+IA0KPiBIaSBKb25hdGhhbiwN
Cj4gT24gMjAyNS0wNi0wNCBhdCAxNjoxOToyMyArMDAwMCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3Rl
Og0KPiA+IEZyb206IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50
ZWwuY29tPg0KPiA+IA0KPiA+IEN1cnJlbnRseSwgbnVtZXJvdXMgZmF1bHQgbWVzc2FnZXMgaGF2
ZSBiZWVuIGluY2x1ZGVkIGluIHRoZSBkbWVzZw0KPiA+IGlnbm9yZSBsaXN0LCBhbmQgdGhpcyBs
aXN0IGNvbnRpbnVlcyB0byBleHBhbmQuICBFYWNoIHRpbWUgYSBuZXcgZmF1bHQNCj4gPiBpbmpl
Y3Rpb24gcG9pbnQgaXMgaW50cm9kdWNlZCBvciBhIG5ldyBmZWF0dXJlIGlzIGFjdGl2YXRlZCwg
YWRkaXRpb25hbA0KPiA+IGZhdWx0IG1lc3NhZ2VzIGFwcGVhciwgbWFraW5nIGl0IGN1bWJlcnNv
bWUgdG8gbWFuYWdlIHRoZSBkbWVzZyBpZ25vcmUNCj4gPiBsaXN0Lg0KPiA+IA0KPiA+IEhvd2V2
ZXIsIHdlIGNhbiBzYWZlbHkgYXNzZXJ0IHRoYXQgYWxsIGRtZXNnIHJlcG9ydHMgdGhhdCBjb250
YWluDQo+ID4gKkVSUk9SKiBpbiB0aGVpciBtZXNzYWdlIGNhbiBiZSBpZ25vcmVkLCBzbyBhZGQg
dGhlbSB0byB0aGUgZG1lc2cgaWdub3JlDQo+ID4gbGlzdC4gIFRoaXMgdW5mb3J0dW5hdGVseSBk
b2VzIG5vdCBpbmNsdWRlIHRoZSBkZXZpY2UgcHJvYmUgZXJyb3INCj4gPiBpdHNlbGYsIHNvIHRo
YXQgbXVzdCBiZSBhZGRlZCBzZXBhcmF0ZWx5Lg0KPiA+IA0KPiA+IFdoaWxlIHdlJ3JlIGhlcmUs
IHdlIHNob3VsZCBhbHNvIGFzc2VydCB0aGF0IGFueSBlcnJvcnMgd2Ugc2VlIGFyZSBvbmx5DQo+
ID4gY29taW5nIGZyb20gdGhlIHRhcmdldCBQQ0kgZGV2aWNlLg0KPiA+IA0KPiA+IHYyOg0KPiA+
IC0gT25seSBpZ25vcmUgZXJyb3ItbGV2ZWwgZG1lc2cgcmVwb3J0cyAob3IsIGF0IGxlYXN0LCBy
ZXBvcnRzIHdpdGgNCj4gPiAgICpFUlJPUiogaW4gdGhlbSksIGFuZCBkZXZpY2UgcHJvYmUgZmFp
bHVlcw0KPiA+IC0gQWRkIFBDSSBkYXRhIHRvIHJlZ2V4IChNaWNoYWwpDQo+ID4gDQo+ID4gdjM6
IChNaWNoYWwpDQo+ID4gLSBSZXZlcnQgbmFtZSBjaGFuZ2UNCj4gPiAtIEFkZCBjaGFuZ2UgbG9n
DQo+ID4gLSBSZW1vdmUgZml4ZXMgdGFnIGZyb20gY29tbWl0DQo+ID4gLSBSZW5hbWUgaWdub3Jl
X2ZhdWx0c19pbl9kbWVzZyB0byBpZ3RfaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dCwgYW5k
DQo+ID4gICBtb3ZlIHRvIGxpYi9pZ3RfY29yZS5jDQo+ID4gLSBNaW5vciBjb2RlIGZpeGVzDQo+
ID4gDQo+ID4gdjQ6DQo+ID4gLSBSZXR1cm4gaWdub3JlX2ZhdWx0c19pbl9kbWVzZyB0byB0ZXN0
cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYywgYnV0DQo+ID4gICBrZWVwIGl0IHJlbmFtZWQg
dG8gaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dCAoS2FtaWwpDQo+ID4gDQo+ID4gU2lnbmVk
LW9mZi1ieTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFuYS5rLnYucEBpbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRA
aW50ZWwuY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndh
amRlY3prb0BpbnRlbC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1
cmlvIDxkYW5pZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gQ2M6IEZyYW5j
b2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gPiBDYzogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IENjOiBKb2huIEhhcnJpc29uIDxqb2hu
LmMuaGFycmlzb25AaW50ZWwuY29tPg0KPiA+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtv
bmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi9pZ3RfY29yZS5jICAg
ICAgICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rp
b24uYyB8IDM5ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2lndF9jb3JlLmMNCj4gPiBpbmRleCBiMDZj
ZGZkODk0Li5hZDcwNzE4YjRhIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi9pZ3RfY29yZS5jDQo+ID4g
KysrIGIvbGliL2lndF9jb3JlLmMNCj4gPiBAQCAtNzYsNiArNzYsNyBAQA0KPiA+ICAjaW5jbHVk
ZSAiaWd0X3JjLmgiDQo+ID4gICNpbmNsdWRlICJpZ3RfbGlzdC5oIg0KPiA+ICAjaW5jbHVkZSAi
aWd0X21hcC5oIg0KPiA+ICsjaW5jbHVkZSAiaWd0X2RldmljZS5oIg0KPiANCj4gUGxlYXNlIGRy
b3AgdGhpcyBjaGFuZ2UuDQoNClRoaXMgd2FzIGxlZnQgaW4gb24gYWNjaWRlbnQuICBJdCdzIGJl
ZW4gcmVtb3ZlZCBub3cuDQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEth
bWlsDQo+IA0KPiA+ICAjaW5jbHVkZSAiaWd0X2RldmljZV9zY2FuLmgiDQo+ID4gICNpbmNsdWRl
ICJpZ3RfdGhyZWFkLmgiDQo+ID4gICNpbmNsdWRlICJpZ3RfdmVjLmgiDQo+ID4gZGlmZiAtLWdp
dCBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIGIvdGVzdHMvaW50ZWwveGVfZmF1
bHRfaW5qZWN0aW9uLmMNCj4gPiBpbmRleCA5ZmU2YmZlMzUxLi4xNGFhZWViZjVlIDEwMDY0NA0K
PiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gKysrIGIvdGVz
dHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiBAQCAtNjQsMjggKzY0LDE5IEBAIHN0
YXRpYyBpbnQgZmFpbF9mdW5jdGlvbl9vcGVuKHZvaWQpDQo+ID4gIAlyZXR1cm4gZGVidWdmc19m
YWlsX2Z1bmN0aW9uX2Rpcl9mZDsNCj4gPiAgfQ0KPiA+ICANCj4gPiAtc3RhdGljIGJvb2wgZnVu
Y3Rpb25faXNfcGFydF9vZl9ndWMoY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gK3N0
YXRpYyB2b2lkIGlnbm9yZV9kbWVzZ19lcnJvcnNfZnJvbV9kdXQoaW50IGZkKQ0KPiA+ICB7DQo+
ID4gLQlyZXR1cm4gc3Ryc3RyKGZ1bmN0aW9uX25hbWUsICJfZ3VjXyIpICE9IE5VTEwgfHwNCj4g
PiAtCSAgICAgICBzdHJzdHIoZnVuY3Rpb25fbmFtZSwgIl91Y18iKSAhPSBOVUxMIHx8DQo+ID4g
LQkgICAgICAgc3Ryc3RyKGZ1bmN0aW9uX25hbWUsICJfd29wY21fIikgIT0gTlVMTDsNCj4gPiAt
fQ0KPiA+IC0NCj4gPiAtc3RhdGljIHZvaWQgaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhjb25zdCBj
aGFyIGZ1bmN0aW9uX25hbWVbXSkNCj4gPiAtew0KPiA+IC0JLyogRHJpdmVyIHByb2JlIGlzIGV4
cGVjdGVkIHRvIGZhaWwgaW4gYWxsIGNhc2VzLCBzbyBpZ25vcmUgaW4gaWd0X3J1bm5lciAqLw0K
PiA+IC0JY2hhciByZWdleFsxMDI0XSA9ICJwcm9iZSB3aXRoIGRyaXZlciB4ZSBmYWlsZWQgd2l0
aCBlcnJvciAtMTIiOw0KPiA+IC0NCj4gPiAgCS8qDQo+ID4gLQkgKiBJZiBHdUMgbW9kdWxlIGZh
dWx0IGlzIGluamVjdGVkLCBHdUMgaXMgZXhwZWN0ZWQgdG8gZmFpbCwNCj4gPiAtCSAqIHNvIGFs
c28gaWdub3JlIEd1QyBpbml0IGZhaWx1cmVzIGluIGlndF9ydW5uZXIuDQo+ID4gKwkgKiBEcml2
ZXIgcHJvYmUgaXMgZXhwZWN0ZWQgdG8gZmFpbCBpbiBhbGwgY2FzZXMsIHNvIGlnbm9yZSBpbiBp
Z3RfcnVubmVyLg0KPiA+ICsJICogQWRkaXRpb25hbGx5LCBhbGwgZXJyb3ItbGV2ZWwgcmVwb3J0
cyBhcmUgZXhwZWN0ZWQsIHNvIGlnbm9yZSB0aG9zZSBhcyB3ZWxsLg0KPiA+ICAJICovDQo+ID4g
LQlpZiAoZnVuY3Rpb25faXNfcGFydF9vZl9ndWMoZnVuY3Rpb25fbmFtZSkpIHsNCj4gPiAtCQlz
dHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEd1QyBpbml0IGZhaWxlZCB3aXRoIC1FTk9N
RU0iKTsNCj4gPiAtCQlzdHJjYXQocmVnZXgsICJ8R1RbMC05YS1mQS1GXSo6IEZhaWxlZCB0byBp
bml0aWFsaXplIHVDIC4tRU5PTUVNIik7DQo+ID4gLQkJc3RyY2F0KHJlZ2V4LCAifEdUWzAtOWEt
ZkEtRl0qOiBGYWlsZWQgdG8gZW5hYmxlIEd1QyBDVCAuLUVOT01FTSIpOw0KPiA+IC0JCXN0cmNh
dChyZWdleCwgInxHVFswLTlhLWZBLUZdKjogR3VDIFBDIHF1ZXJ5IHRhc2sgc3RhdGUgZmFpbGVk
OiAtRU5PTUVNIik7DQo+ID4gLQl9DQo+ID4gKwlzdGF0aWMgY29uc3QgY2hhciAqc3RvcmUgPSAi
cHJvYmUgd2l0aCBkcml2ZXIgeGUgZmFpbGVkIHdpdGggZXJyb3J8XFwqRVJST1JcXCoiOw0KPiA+
ICsJY2hhciBwY2lfc2xvdFtOQU1FX01BWF07DQo+ID4gKwljaGFyIHJlZ2V4WzEwMjRdOw0KPiA+
ICsNCj4gPiArCS8qIE9ubHkgYmxvY2sgZG1lc2cgcmVwb3J0cyB0aGF0IHRhcmdldCB0aGUgcGNp
IHNsb3Qgb2YgdGhlIGdpdmVuIGZkICovDQo+ID4gKwlpZ3RfZGV2aWNlX2dldF9wY2lfc2xvdF9u
YW1lKGZkLCBwY2lfc2xvdCk7DQo+ID4gKwlzbnByaW50ZihyZWdleCwgc2l6ZW9mKHJlZ2V4KSwg
IiVzOi4qKCVzKSIsIHBjaV9zbG90LCBzdG9yZSk7DQo+ID4gIA0KPiA+ICAJaWd0X2VtaXRfaWdu
b3JlX2RtZXNnX3JlZ2V4KHJlZ2V4KTsNCj4gPiAgfQ0KPiA+IEBAIC0yMzQsNyArMjI1LDcgQEAg
aW5qZWN0X2ZhdWx0X3Byb2JlKGludCBmZCwgY2hhciBwY2lfc2xvdFtdLCBjb25zdCBjaGFyIGZ1
bmN0aW9uX25hbWVbXSkNCj4gPiAgCWlndF9pbmZvKCJJbmplY3RpbmcgZXJyb3IgXCIlc1wiICgl
ZCkgaW4gZnVuY3Rpb24gXCIlc1wiXG4iLA0KPiA+ICAJCSBzdHJlcnJvcigtSU5KRUNUX0VSUk5P
KSwgSU5KRUNUX0VSUk5PLCBmdW5jdGlvbl9uYW1lKTsNCj4gPiAgDQo+ID4gLQlpZ25vcmVfZmF1
bHRzX2luX2RtZXNnKGZ1bmN0aW9uX25hbWUpOw0KPiA+ICsJaWdub3JlX2RtZXNnX2Vycm9yc19m
cm9tX2R1dChmZCk7DQo+ID4gIAlpbmplY3Rpb25fbGlzdF9hZGQoZnVuY3Rpb25fbmFtZSk7DQo+
ID4gIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gIA0KPiA+
IEBAIC0yOTksNyArMjkwLDcgQEAgZXhlY19xdWV1ZV9jcmVhdGVfZmFpbChpbnQgZmQsIHN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICppbnN0YW5jZSwNCj4gPiAgCWlndF9hc3Nl
cnRfZXEoX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEsIDEsIGluc3RhbmNlLCAwLCAm
ZXhlY19xdWV1ZV9pZCksIDApOw0KPiA+ICAJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVj
X3F1ZXVlX2lkKTsNCj4gPiAgDQo+ID4gLQlpZ25vcmVfZmF1bHRzX2luX2RtZXNnKGZ1bmN0aW9u
X25hbWUpOw0KPiA+ICsJaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dChmZCk7DQo+ID4gIAlp
bmplY3Rpb25fbGlzdF9hZGQoZnVuY3Rpb25fbmFtZSk7DQo+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0
aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gIAlpZ3RfYXNzZXJ0KF9feGVfZXhlY19xdWV1
ZV9jcmVhdGUoZmQsIHZtLCAxLCAxLCBpbnN0YW5jZSwgMCwgJmV4ZWNfcXVldWVfaWQpICE9IDAp
Ow0KPiA+IEBAIC0zMzQsNyArMzI1LDcgQEAgdm1fY3JlYXRlX2ZhaWwoaW50IGZkLCBjb25zdCBj
aGFyIGZ1bmN0aW9uX25hbWVbXSwgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiA+ICB7DQo+ID4gIAlp
Z3RfYXNzZXJ0X2VxKHNpbXBsZV92bV9jcmVhdGUoZmQsIGZsYWdzKSwgMCk7DQo+ID4gIA0KPiA+
IC0JaWdub3JlX2ZhdWx0c19pbl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiArCWlnbm9yZV9k
bWVzZ19lcnJvcnNfZnJvbV9kdXQoZmQpOw0KPiA+ICAJaW5qZWN0aW9uX2xpc3RfYWRkKGZ1bmN0
aW9uX25hbWUpOw0KPiA+ICAJc2V0X3JldHZhbChmdW5jdGlvbl9uYW1lLCBJTkpFQ1RfRVJSTk8p
Ow0KPiA+ICAJaWd0X2Fzc2VydChzaW1wbGVfdm1fY3JlYXRlKGZkLCBmbGFncykgIT0gMCk7DQo+
ID4gQEAgLTM5Nyw3ICszODgsNyBAQCB2bV9iaW5kX2ZhaWwoaW50IGZkLCBjb25zdCBjaGFyIGZ1
bmN0aW9uX25hbWVbXSkNCj4gPiAgDQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKHNpbXBsZV92bV9iaW5k
KGZkLCB2bSksIDApOw0KPiA+ICANCj4gPiAtCWlnbm9yZV9mYXVsdHNfaW5fZG1lc2coZnVuY3Rp
b25fbmFtZSk7DQo+ID4gKwlpZ25vcmVfZG1lc2dfZXJyb3JzX2Zyb21fZHV0KGZkKTsNCj4gPiAg
CWluamVjdGlvbl9saXN0X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiAgCXNldF9yZXR2YWwoZnVu
Y3Rpb25fbmFtZSwgSU5KRUNUX0VSUk5PKTsNCj4gPiAgCWlndF9hc3NlcnQoc2ltcGxlX3ZtX2Jp
bmQoZmQsIHZtKSAhPSAwKTsNCj4gPiBAQCAtNDQ1LDcgKzQzNiw3IEBAIG9hX2FkZF9jb25maWdf
ZmFpbChpbnQgZmQsIGludCBzeXNmcywgaW50IGRldmlkLCBjb25zdCBjaGFyIGZ1bmN0aW9uX25h
bWVbXSkNCj4gPiAgCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3NjYW5mKHN5c2ZzLCBwYXRoLCAiJSIg
UFJJdTY0LCAmY29uZmlnX2lkKSA9PSAxKTsNCj4gPiAgCWlndF9hc3NlcnRfZXEoaW50ZWxfeGVf
cGVyZl9pb2N0bChmZCwgRFJNX1hFX09CU0VSVkFUSU9OX09QX1JFTU9WRV9DT05GSUcsICZjb25m
aWdfaWQpLCAwKTsNCj4gPiAgDQo+ID4gLQlpZ25vcmVfZmF1bHRzX2luX2RtZXNnKGZ1bmN0aW9u
X25hbWUpOw0KPiA+ICsJaWdub3JlX2RtZXNnX2Vycm9yc19mcm9tX2R1dChmZCk7DQo+ID4gIAlp
bmplY3Rpb25fbGlzdF9hZGQoZnVuY3Rpb25fbmFtZSk7DQo+ID4gIAlzZXRfcmV0dmFsKGZ1bmN0
aW9uX25hbWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gIAlpZ3RfYXNzZXJ0X2x0KGludGVsX3hlX3Bl
cmZfaW9jdGwoZmQsIERSTV9YRV9PQlNFUlZBVElPTl9PUF9BRERfQ09ORklHLCAmY29uZmlnKSwg
MCk7DQo+ID4gLS0gDQo+ID4gMi40My4wDQo+ID4gDQo+IA0K
