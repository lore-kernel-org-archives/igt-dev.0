Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B8AE9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 04:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E4010E676;
	Thu, 19 Feb 2026 04:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RC9rW0B8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1D810E676;
 Thu, 19 Feb 2026 04:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771475381; x=1803011381;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=tuy0yiYoVRNwgo2tVv7WknD/pjfQ6SoL/tagiZQHECM=;
 b=RC9rW0B8SzkcR3CD5Pa9IvANRO/bh0+esjwoFm4zC6BKcOw9RvnFD/NT
 PbGs7hsjYzDX1/VHJRDvGQeUSBLxZROvJMEAcb0btlCKlnQgYsKxe+E3Q
 Q+gPosoDQAaK4H2dybJIePoHDWPRTYWMhVfUhQHeoJC5fWvlKQHQUvDr0
 B4XSGY9LmKhKiNdaXCGXHNrQYR3WMrxp/p3uQkg+s6xnKfhb68THyJcYH
 AS14V9WzIrdT3898p2wJASUxRD0dkWJU82UPIOd4CktmK3bnCdjplsER3
 DecywmJIUnjGwRah7YhJBqPWM/l8JNFnvSG6QBQq6C0UUYpSsLPlpV72G g==;
X-CSE-ConnectionGUID: E27Znbi1Q12USKNma9/j8w==
X-CSE-MsgGUID: hIRXSr/+QEuEFlZ/cUEcew==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72470543"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208,217";a="72470543"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:29:41 -0800
X-CSE-ConnectionGUID: 4l9xD8EdRUOw9s7bPceN5A==
X-CSE-MsgGUID: USdKgPprSSyyumeX7NerDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
 d="scan'208,217";a="214259879"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 20:29:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:29:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 20:29:40 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 20:29:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3c8Ycfv1vup7mNclxC260RD6rj7ZlXRd4Sviv8sFMOQtgF+6g4aGNU62nBiRdI1zPe7Gqg0gKiZ1i/pYXdOKaj39iBolULxfP33WgdLbxzd63nM9QJIlvoc1SC1jA1xSPiBh7GyHM6JsXRCMQYIOqL296i3HDTUm8sNBHu142H+AFQcBS91NQalEgMShvfo4iODi4MUiPI2kvCPwd3VtRsl9qgA3Z2uYsXYIgKvoEJP5J0qvt2UNzGOlQtCo28NNqw0ZrYnTGMwBmcQvwNDasXFkkgKL4vexwHhBvtS+cPW1xxV89inEyubS//A53plPXpuZRCDF1LXh8SymGaUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuy0yiYoVRNwgo2tVv7WknD/pjfQ6SoL/tagiZQHECM=;
 b=ZrW52UaaJxTW7zc3Bl8g/9nUZoyBbWdueSLfcL84T5EtPXbVMtfcJBgwAUMchDCU8q8UVc4gGYeDtLnDT5QbfMsp1W4/nmKKVX+ZK3JoAFkTDczVBX0N/4fxjyM/rN4biX6l6N/tt6Z1lVJlAtZdNe2BcOE2vs4nuCjh6yrCoRNqwXwcU0a8lLqo8ooUEBJQoq2iwLJLCn8iZS/pbM1AZfuShXJAY6F5Oe8tJnijLZoThgl8h056Fz7b46NCJ97P0lr/kFh4pb0Sxr8x7AdbkqlEm9p++APyFlrWJxUpKMuqLJkaAdb9dxGPokztQ4/G1zgetcxEs2dA36nqRSiKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 04:29:38 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 04:29:38 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfZXhw?=
 =?utf-8?B?bGljdF9mZW5jZTogQWRkIFRlc3QgZm9yIEV4cGxpY2l0IEZlbmNpbmcgKHJl?=
 =?utf-8?Q?v4)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIHRlc3RzL2ttc19leHBsaWN0?=
 =?utf-8?Q?=5Ffence:_Add_Test_for_Explicit_Fencing_(rev4)?=
Thread-Index: AQHcoGIHL8mDxhh7ik61F0sAl0Br9bWJb1hD
Date: Thu, 19 Feb 2026 04:29:38 +0000
Message-ID: <CH0PR11MB542761610303761F99A93DCF986BA@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
 <177136953905.260823.5634925041711164870@a3b018990fe9>
In-Reply-To: <177136953905.260823.5634925041711164870@a3b018990fe9>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM4PR11MB8177:EE_
x-ms-office365-filtering-correlation-id: 219c4c70-401b-4826-eb79-08de6f6f7e63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?dE5QR25ydHlZN3hNUGpxeXdjUU56bzB2ZDV5Wlk1ekNUR09qRVluV2RrVHJQ?=
 =?utf-8?B?ZWNyUEJZZnlVdmJjcEZkOXZ1YXowelBVS3N5MEJQVWQxWGV4ZG5WL0tGcXdF?=
 =?utf-8?B?WWxJSHFlUG95MEdEV0hOWURjSlZ3ZGs2TERlOFRweEw3NXpvdWRyOFVTZ0Ur?=
 =?utf-8?B?WjMzRUNrYWRBb0NJMHl6RWltcHNzZVZFNHlycDVyN1lrNTRqNSt6M05tVU5W?=
 =?utf-8?B?VUpkcHowL2dRajNRUjc5Ty9XSEhOTzFsdkJqbWV1Z2JCdjg5RU95b1haM1N5?=
 =?utf-8?B?Z3ZQOGlIbEptcVhad0I0OFFLWmIzWWR3bDVRMkZWWjEzbTcyTHNuZld0eFJN?=
 =?utf-8?B?UmU0OEdUTTBSRG52VGlyenJaK3kwa3dhR244bHhIMG1JUWQ1K2RmQjZyanF6?=
 =?utf-8?B?dWFMY1BvL0dYQzFIMUF0R29GSUsxTGFDU3lJdElZd2pSblJqSmlwdmxuSzFa?=
 =?utf-8?B?QXhBenJqbTlubWJQTzBlclJMRkx5UDZYUzJnZVNQZlp5cEhjbFpIZlN1YVBX?=
 =?utf-8?B?RkdsVDZ1Mit6QzgybUZsVWoxcFc4UnVyeUVMZ3RvWm9Dc0VKUnpQVzNrbzVK?=
 =?utf-8?B?dHorSE4yMm5WeXhPNVVpNm5qZlY5Y0ZMNVJxMDdMQ2NHelBLelFQY1JuVEJn?=
 =?utf-8?B?RHBHWmplU1lMVmRjQ2g1TXpxRU9IaWxHYUJaWHF1SEpTN01WdGl4QXV1Tzds?=
 =?utf-8?B?Y2U0N1lWS3A4K3FVMHhrdElYRU0yeHdWZ1ZMT1V1UC8rNmtjbjJJaGFtWjhz?=
 =?utf-8?B?Z3BLTVFGU2dyV2RmQzA2aEFrVUgyV0pYenJacHhPOFVLR1hTVG1Ka015OTZG?=
 =?utf-8?B?OFZKWHhRTXB5dDN2ZzE0M2FEWllmS3RWVWtBVlEvUHZwdTdWQ2ErOUR2L21v?=
 =?utf-8?B?d0tzbUtsSEdub1pvOHBCenNIRU96RWVXSlR4a3VzWGRmem11N0owalB6YjBQ?=
 =?utf-8?B?bmhRZGN3Qkd4WjB5czdDWm5zQjQrMnZjSFNNT0J0eFRvOHUvQ0tiSkZCbzBo?=
 =?utf-8?B?Nk1JQVdrQVkwajlWWENYbFk0VWhuSmkvMHdlSFQyZmh3b0pPZmdZY0NlYzZ1?=
 =?utf-8?B?dnFLQTJxTFFWYzRkWG03TENXWTZPL2s4UVJBVzdJVDY3K1VEWTQ4S0ZVTm1M?=
 =?utf-8?B?N1pxV0M4TXRzeFk3bWZLN0NubWk3SHRBaGI2dEF4YTc5YTdSdWc5TmpnWWNh?=
 =?utf-8?B?MWUvdEdzV0FBd1VxSkJzUzB3RUNpOS9Ydmg2V0l3YjVTYXR1U1hGd0lZMTNV?=
 =?utf-8?B?V1hwZVAvQ04zYUJtalJwK1VxY054bGk3YVBLY3kxVjN6OC8vM1dIS3VOTmgr?=
 =?utf-8?B?eUNFdU1GWmRjdjRISXJOOEN2Ynp3MWhaNVh1RkVITFE1ZWluZ0ZjWUZadHJr?=
 =?utf-8?B?NnV6R2xzRzJtU0F3R2w0VHNxazV2Qkc0UGtFWkdGcnJmQnYweU9yQnQ0bkh0?=
 =?utf-8?B?WDlDaGJHNjY5cjl3aEZ1ZnBCUVNXZFBEUU9ia0pEOC9KWlVsM1hHUFhjUFBE?=
 =?utf-8?B?ZkErY2dlRkh5QmU0K0tsRzFuSlhXZFZyM1BmMWNEdmxJSHc5T1JUWG1yZFFi?=
 =?utf-8?B?a3RvYzNMN0pXRVg1Ums5ci92YUVzNHdwVWkxbjRBTUh0ZjF4eUlBaDFnY3Ns?=
 =?utf-8?B?U3ViRXA2Yzd6QTNFUzR3TWl4bzdocG1MN2s2QU5MQUx5SVFnNWZWRWErY3RM?=
 =?utf-8?B?dTM0Y014M0F1NUFEZkVXR3NqVS9Eck11bFFtZmp0QUJSSzd1ZUxIWTFuWWtC?=
 =?utf-8?B?WmlNS1FwNEpYUUJvdnNMZ3JCdlRCWHg5MzFFdEV4dE40V3NLRXBEZS9SZlRF?=
 =?utf-8?B?NGhQQ0UwdTBFbnVCYzJYMVBiMkpBS2htM3hZUktFYlBKeTVwVm9idmRXUk5X?=
 =?utf-8?B?STVJWGsrT3VSRFh5OUpQT0hJcnRzTDFHNzlWcHB1MTUrWW4rbnBUMTJYK1hB?=
 =?utf-8?B?QndPVGduYXNxeFRXQUV1QmFMTytZT2F2YzRNVEFnQmxtVVdRMW1mQStKZHVR?=
 =?utf-8?B?U01VbUNnRytORkFUaWt0WTA0TzRoZ1BMVDViMXF2MWtoSEFjd3ptZlFvU1Zn?=
 =?utf-8?B?YXowVE1TSi9LdURyNVBGeTZnSlpqV3ZES3l5QjdHd3NaWlNHZkx5VEQ2V3Bs?=
 =?utf-8?Q?QLGl2GshlgDDGDq9gy21Tr6/L?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(8096899003)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVp1SlNrT29FQmswY0dUUFJnd3hHcXAwZWtyS3FHR1FHNGdqQ3BSZ1ZmaDFv?=
 =?utf-8?B?VnRtWGc2Tm51VUFEUWRXU2k2b21GRm1EQ3lyTlB6ZWpqaDNKQWFTSFcvdmk3?=
 =?utf-8?B?YXdQY3QzNlYrT2Q4OVhkTFNrNThEaDF0K1JKVE5xeVlLOUR3VllzRW5pbHBw?=
 =?utf-8?B?cGFRQ0xtYXpZQkJEbCtzaXlHNWVkSWVvZFc2TUZpbjc0dW1hb0htSE9ERCtC?=
 =?utf-8?B?UVlVTkE4S1dIVkxPT2k2OENpK2c2dllSQ1NmL1FrRTJlTFM5SzNDdmJSNUcy?=
 =?utf-8?B?VTlHcnNxbSszdFBVaHBTOHhYZEVoc0VxRnorNk5sSHFXU1VmUXhKYllFcHo0?=
 =?utf-8?B?YXZYUks5bm9YUEFOSVVCeFRGd1NBWTJlZDVHcjJ1U1NDWSswSjdFY003TW1m?=
 =?utf-8?B?VytCRDFzVzRiQWhlaWtKeUZrZ0x2UVEzbFdsaFRkMldzV0x0dFdiSXdlbk1n?=
 =?utf-8?B?VThDblFPNEw0ZzJmU2Noem9yOVVNMW1vTFRYbFVnRXNYMlJ3QzRNQWtpb3RS?=
 =?utf-8?B?NW85bGwvTzlJQURlNmFMUC9YOEZKTThxcGhseTdsVGpqV0hDbjRWcVJsOTRC?=
 =?utf-8?B?aHdKbU5nbXpUamE3TlpWeXJTL1B4djlkb01peE5lWE53dDRuOEFjSTBXRkQ3?=
 =?utf-8?B?bDJjQnpQNHZqRUR4VlYzM1FCTU5YUU9lejhaUWtMYXRsNlJ6em8rR1E5clYz?=
 =?utf-8?B?YVhTbGo2YXFjNzF0NitCMWlzLzcxTXJDMkhXZkhEcUxWcmtRSXFCVm9pT1cx?=
 =?utf-8?B?K0lBcmwvMEV1d3R5aGdxTWozQ0hncXZOMEEvZmwxM3NMZG1iU0RJeU1WV1Ba?=
 =?utf-8?B?Ymt3eW5wT3BvN3Rrc0N0bElFUzgrR2lCMGpqeGFtVGc0T0hlSWtSMXpRWUJa?=
 =?utf-8?B?VTZseTQvdFdVbXNMN2R1MlF4NXR1dHlDdGsxeXlhU1dnYk9Uc3JCYURBa1Yz?=
 =?utf-8?B?YW1YRDI2eTJmS29EV0lCNmJ5SzJ0TEVGMkxPZXFzcTdtZlNjTkVQUEtzMnRT?=
 =?utf-8?B?b0JqWlV0cnI2Rm5SZ1JTM01WVlpZa2tETXhseGJLMW9mcnJuOWxaOFR1cU9s?=
 =?utf-8?B?S2FvZGh1M0Fhb2wyQmwremlTYW54bmNSNXFzbUJNV3crNkZPeENocHVGY1Ry?=
 =?utf-8?B?QnBiOGI2Z21meU42Y1JldXdxeVR3SGdCb1doQjhCbHRyQ1FFR0xrelN0anYz?=
 =?utf-8?B?ZkFURW1TcjdTcGxpb1ZmUVp6TE9LMHhXOGJRYTRpVWJsUXZBQTZtb25pOFQr?=
 =?utf-8?B?YWh3NTlTelZlVFd0VGJMTVZVYWhqY0NzZ3N0NE80SWhadWJBS0YvaFk5V25S?=
 =?utf-8?B?UFhxQmlJK0F0dXBnN0JIeXVwSGdrM0F0V01Gajd0UzFDczJBNS9odHpHakti?=
 =?utf-8?B?N2xjaktXQXNQUXlidWhGWFhHU1JtMytDUmtXdmtXSE4vRXZuQnhsYnFiSHpr?=
 =?utf-8?B?ZDNhdGdnN3ppN1RhcWp4YnI1N3RGc2FWMVIwTEt1eFdZaXhYN3VHZVk2aXY4?=
 =?utf-8?B?amg0YzAwdVdMVmVEcnZpNndqYUVaUWpZZ2UxOGdUbXhwbXE2TVhsM0JpZnRL?=
 =?utf-8?B?VGJLaUhSWFhuOTE4QzVHazd6cXc5dElDZEZrWmwyUWNuRGxsS2VtUExydGRa?=
 =?utf-8?B?OS9VbmpvSldUeElvRWdLS29EeEpsSFFtQ0lCWFNSM2syeW1tbzRnOWNad3lE?=
 =?utf-8?B?bG1sSldZT1hWK21JU29BWlpUYTN0MnVwVGtMQjlsMEFuQzRmbWROM1VOWDB3?=
 =?utf-8?B?RXNqelUxbXpLdXZFMlo2Vjg3ZHRtRnBWR2lRMWpIOWt6SXpUM25GL2lZaXM4?=
 =?utf-8?B?M3VPTmdCMWJRYVVjVlVRWVRGTEI2TG1CcTU2T0crNndmaEltSFZESlJuUFRU?=
 =?utf-8?B?Mm05S2Y2WFdCV3lkK3BMc3M1c1RhQjBNaDJFZDhuMk5nYTh4cGQzTmw5eXNs?=
 =?utf-8?B?d0ZkQU55bzI4MDlNdnFCWHRWbGtKdk5MOVgwa3RoNWlTVDd3cDBXNEtETmlC?=
 =?utf-8?B?MlR4TFRHOHlnYU5sR3Q5WnRCMGJXVGE1emExQUFhei9IVzdIdHRtaFZCbkJr?=
 =?utf-8?B?MHhJejdUNkRBb3g1VzFiclBvTzZpUm10V2tpb1k3VGR5ZytuM09oUzQ4Y2lv?=
 =?utf-8?B?YjB0VmUzZEswUzFMUFJSZHpSQ1E5WWl0akZRZXF1cTZvVngwNFlWTHJCUHVR?=
 =?utf-8?B?N1BUbURtd2I3bmk5MUlFUFNJQ2ZUQU94blp2N1lSQXRCNjlHdWVLYjRCYlRH?=
 =?utf-8?B?UFVlRlFSQ1ZLVnZuTldRTzQySm1BamJnOXVBTTZZZktDUUhRTW41UzNoTi9X?=
 =?utf-8?Q?1nl7Jyvw1gKRlGfr5B?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB542761610303761F99A93DCF986BACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219c4c70-401b-4826-eb79-08de6f6f7e63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 04:29:38.5318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJkNrJ1uFzvOXpgUQS4MsgCcJKMrcfoWQnrXIgDGvcQ4Gr5Z819VtHEeCifzilxpRuZlkqvYyGRqqYQF4t9FKg==
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

--_000_CH0PR11MB542761610303761F99A93DCF986BACH0PR11MB5427namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IFBhdGNod29yayA8
cGF0Y2h3b3JrQGVtZXJpbC5mcmVlZGVza3RvcC5vcmc+DQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1
YXJ5IDE4LCAyMDI2IDQ6MzUgQU0NClRvOiBTZWJpbnJhaiwgUyA8cy5zZWJpbnJhakBpbnRlbC5j
b20+DQpDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGlndC1kZXZAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPg0KU3ViamVjdDog4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIHRlc3Rz
L2ttc19leHBsaWN0X2ZlbmNlOiBBZGQgVGVzdCBmb3IgRXhwbGljaXQgRmVuY2luZyAocmV2NCkN
Cg0KUGF0Y2ggRGV0YWlscw0KU2VyaWVzOg0KdGVzdHMva21zX2V4cGxpY3RfZmVuY2U6IEFkZCBU
ZXN0IGZvciBFeHBsaWNpdCBGZW5jaW5nIChyZXY0KQ0KVVJMOg0KaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNjAwNzgvDQpTdGF0ZToNCmZhaWx1cmUNCkRldGFpbHM6
DQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xNDU2My9p
bmRleC5odG1sDQpDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIFhFSUdUXzg3NTdfRlVMTCAtPiBY
RUlHVFBXXzE0NTYzX0ZVTEwNClN1bW1hcnkNCg0KRkFJTFVSRQ0KDQpTZXJpb3VzIHVua25vd24g
Y2hhbmdlcyBjb21pbmcgd2l0aCBYRUlHVFBXXzE0NTYzX0ZVTEwgYWJzb2x1dGVseSBuZWVkIHRv
IGJlDQp2ZXJpZmllZCBtYW51YWxseS4NCg0KSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFu
Z2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQppbnRyb2R1Y2VkIGluIFhF
SUdUUFdfMTQ1NjNfRlVMTCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KdG8gZG9jdW1lbnQgdGhp
cyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4g
Q0kuDQoNClBhcnRpY2lwYXRpbmcgaG9zdHMgKDIgLT4gMikNCg0KTm8gY2hhbmdlcyBpbiBwYXJ0
aWNpcGF0aW5nIGhvc3RzDQoNClBvc3NpYmxlIG5ldyBpc3N1ZXMNCg0KSGVyZSBhcmUgdGhlIHVu
a25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBYRUlHVFBXXzE0
NTYzX0ZVTEw6DQoNCklHVCBjaGFuZ2VzDQpQb3NzaWJsZSByZWdyZXNzaW9ucw0KDQogICogICBp
Z3RAa21zX2F0b21pY190cmFuc2l0aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRyYW5zaXRpb24tZmVu
Y2luZzoNCiAgICAgKg0Kc2hhcmQtYm1nOiBQQVNTPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2ludGVsLXhlL0lHVF84NzU3L3NoYXJkLWJtZy0xMC9pZ3RAa21zX2F0b21pY190cmFu
c2l0aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRyYW5zaXRpb24tZmVuY2luZy5odG1sPiAtPiBETUVT
Ry1XQVJOPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzE0
NTYzL3NoYXJkLWJtZy0yL2lndEBrbXNfYXRvbWljX3RyYW5zaXRpb25AcGxhbmUtYWxsLW1vZGVz
ZXQtdHJhbnNpdGlvbi1mZW5jaW5nLmh0bWw+ICsxIG90aGVyIHRlc3QgZG1lc2ctd2Fybg0KDQo+
ICBJIGJlbGlldmUgdGhpcyB3YXJuaW5nIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlIG5ldyB0
ZXN0IHRoYXQgaXMgYWRkZWQsIGFuZCBpcyBhIGZhbHNlIHBvc2l0aXZlLg0KTmV3IHRlc3RzDQoN
Ck5ldyB0ZXN0cyBoYXZlIGJlZW4gaW50cm9kdWNlZCBiZXR3ZWVuIFhFSUdUXzg3NTdfRlVMTCBh
bmQgWEVJR1RQV18xNDU2M19GVUxMOg0KDQpOZXcgSUdUIHRlc3RzICgxKQ0KDQogICogICBpZ3RA
a21zX2V4cGxpY2l0X2ZlbmNlQG11bHRpcGxhbmUtYXRvbWljLWZlbmNlLXdhaXQ6DQogICAgICog
ICBTdGF0dXNlcyA6DQogICAgICogICBFeGVjIHRpbWU6IFtOb25lXSBzDQoNCkJ1aWxkIGNoYW5n
ZXMNCg0KICAqICAgSUdUOiBJR1RfODc1NyAtPiBJR1RQV18xNDU2Mw0KDQpJR1RQV18xNDU2Mzog
Mjg2YjRkNjk3ODk1MDMyMGJhOTg0MjAzMmJlNWJiODEzMzkxMTA2NCBAIGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCklHVF84NzU3OiA4NzU3DQp4
ZS00NTY5LWU2NmM2NGU0ZjEyZTU1Y2FkMzVjNjgwZjFlMzI4YTdjN2VlOTJjYWI6IGU2NmM2NGU0
ZjEyZTU1Y2FkMzVjNjgwZjFlMzI4YTdjN2VlOTJjYWINCg==

--_000_CH0PR11MB542761610303761F99A93DCF986BACH0PR11MB5427namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBB
cHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJpLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAw
KTsiIGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+DQo8YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9k
aXY+DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwg
c2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+
DQo8L2Rpdj4NCjxociBzdHlsZT0iZGlzcGxheTogaW5saW5lLWJsb2NrOyB3aWR0aDogOTglOyI+
DQo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fu
cy1zZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8Yj5Gcm9t
OjwvYj4mbmJzcDtQYXRjaHdvcmsgJmx0O3BhdGNod29ya0BlbWVyaWwuZnJlZWRlc2t0b3Aub3Jn
Jmd0Ozxicj4NCjxiPlNlbnQ6PC9iPiZuYnNwO1dlZG5lc2RheSwgRmVicnVhcnkgMTgsIDIwMjYg
NDozNSBBTTxicj4NCjxiPlRvOjwvYj4mbmJzcDtTZWJpbnJhaiwgUyAmbHQ7cy5zZWJpbnJhakBp
bnRlbC5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiZuYnNwO2lndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnICZsdDtpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs8YnI+DQo8Yj5TdWJq
ZWN0OjwvYj4mbmJzcDvinJcgWGUuQ0kuRlVMTDogZmFpbHVyZSBmb3IgdGVzdHMva21zX2V4cGxp
Y3RfZmVuY2U6IEFkZCBUZXN0IGZvciBFeHBsaWNpdCBGZW5jaW5nIChyZXY0KQ0KPC9kaXY+DQo8
ZGl2IHN0eWxlPSJmb250LWZhbWlseTogQ2FsaWJyaSwgQXJpYWwsIEhlbHZldGljYSwgc2Fucy1z
ZXJpZjsgZm9udC1zaXplOiAxMnB0OyBjb2xvcjogcmdiKDAsIDAsIDApOyI+DQo8YnI+DQo8L2Rp
dj4NCjxkaXY+PGI+UGF0Y2ggRGV0YWlsczwvYj48L2Rpdj4NCjx0YWJsZT4NCjx0Ym9keT4NCjx0
cj4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxiPlNlcmllczo8L2I+PC9kaXY+
DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+dGVzdHMva21zX2V4cGxp
Y3RfZmVuY2U6IEFkZCBUZXN0IGZvciBFeHBsaWNpdCBGZW5jaW5nIChyZXY0KTwvZGl2Pg0KPC90
ZD4NCjwvdHI+DQo8dHI+DQo8dGQgc3R5bGU9InBhZGRpbmc6IDJwdDsiPg0KPGRpdj48Yj5VUkw6
PC9iPjwvZGl2Pg0KPC90ZD4NCjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PjxhIGRh
dGEtYXV0aD0iTm90QXBwbGljYWJsZSIgY2xhc3M9Ik9XQUF1dG9MaW5rIiBpZD0iT1dBYTcwMjEx
ZWUtNjIwYi0xZjI5LWMxNzMtMDMyODRkNTUxZWUxIiBocmVmPSJodHRwczovL3BhdGNod29yay5m
cmVlZGVza3RvcC5vcmcvc2VyaWVzLzE2MDA3OC8iPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9zZXJpZXMvMTYwMDc4LzwvYT48L2Rpdj4NCjwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRk
IHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+U3RhdGU6PC9iPjwvZGl2Pg0KPC90ZD4N
Cjx0ZCBzdHlsZT0icGFkZGluZzogMnB0OyI+DQo8ZGl2PmZhaWx1cmU8L2Rpdj4NCjwvdGQ+DQo8
L3RyPg0KPHRyPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGI+RGV0YWlsczo8
L2I+PC9kaXY+DQo8L3RkPg0KPHRkIHN0eWxlPSJwYWRkaW5nOiAycHQ7Ij4NCjxkaXY+PGEgZGF0
YS1hdXRoPSJOb3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGlkPSJPV0FmMzJhZDlj
Ny0xZjhmLWM2NDAtMTRlNS0xOWViOTdjYTY0ZTEiIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzE0NTYzL2luZGV4Lmh0bWwiPmh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVFBXXzE0NTYzL2luZGV4Lmh0bWw8L2E+
PC9kaXY+DQo8L3RkPg0KPC90cj4NCjwvdGJvZHk+DQo8L3RhYmxlPg0KPGgxPkNJIEJ1ZyBMb2cg
LSBjaGFuZ2VzIGZyb20gWEVJR1RfODc1N19GVUxMIC0mZ3Q7IFhFSUdUUFdfMTQ1NjNfRlVMTDwv
aDE+DQo8aDI+U3VtbWFyeTwvaDI+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4t
Ym90dG9tOiAxZW07Ij48Yj5GQUlMVVJFPC9iPjwvcD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAx
ZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPlNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3
aXRoIFhFSUdUUFdfMTQ1NjNfRlVMTCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmU8YnI+DQp2ZXJpZmll
ZCBtYW51YWxseS48L3A+DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9t
OiAxZW07Ij5JZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRv
IGRvIHdpdGggdGhlIGNoYW5nZXM8YnI+DQppbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTQ1NjNfRlVM
TCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbTxicj4NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1
cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLjwvcD4NCjxo
Mj5QYXJ0aWNpcGF0aW5nIGhvc3RzICgyIC0mZ3Q7IDIpPC9oMj4NCjxwIHN0eWxlPSJtYXJnaW4t
dG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPk5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGlu
ZyBob3N0czwvcD4NCjxoMj5Qb3NzaWJsZSBuZXcgaXNzdWVzPC9oMj4NCjxwIHN0eWxlPSJtYXJn
aW4tdG9wOiAxZW07IG1hcmdpbi1ib3R0b206IDFlbTsiPkhlcmUgYXJlIHRoZSB1bmtub3duIGNo
YW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gWEVJR1RQV18xNDU2M19GVUxM
OjwvcD4NCjxoMz5JR1QgY2hhbmdlczwvaDM+DQo8aDQ+UG9zc2libGUgcmVncmVzc2lvbnM8L2g0
Pg0KPHVsPg0KPGxpPmlndEBrbXNfYXRvbWljX3RyYW5zaXRpb25AcGxhbmUtYWxsLW1vZGVzZXQt
dHJhbnNpdGlvbi1mZW5jaW5nOjwvbGk+PHVsPg0KPGxpPg0KPGRpdiByb2xlPSJwcmVzZW50YXRp
b24iPnNoYXJkLWJtZzogPGEgZGF0YS1hdXRoPSJOb3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0
b0xpbmsiIGlkPSJPV0E1ZTA3MTY5Yi03ZTQyLTQxZjAtMWYyNy1hYTFlYzE5ZTg3YWYiIGhyZWY9
Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL0lHVF84NzU3L3NoYXJk
LWJtZy0xMC9pZ3RAa21zX2F0b21pY190cmFuc2l0aW9uQHBsYW5lLWFsbC1tb2Rlc2V0LXRyYW5z
aXRpb24tZmVuY2luZy5odG1sIj4NClBBU1M8L2E+Jm5ic3A7LSZndDsgPGEgZGF0YS1hdXRoPSJO
b3RBcHBsaWNhYmxlIiBjbGFzcz0iT1dBQXV0b0xpbmsiIGlkPSJPV0E1YzE2NDYzYS1jYTUwLTc4
OTktNjNmYi05MzFmM2RkYjRiYmUiIGhyZWY9Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2ludGVsLXhlL0lHVFBXXzE0NTYzL3NoYXJkLWJtZy0yL2lndEBrbXNfYXRvbWljX3RyYW5z
aXRpb25AcGxhbmUtYWxsLW1vZGVzZXQtdHJhbnNpdGlvbi1mZW5jaW5nLmh0bWwiPg0KRE1FU0ct
V0FSTjwvYT4mbmJzcDsrMSBvdGhlciB0ZXN0IGRtZXNnLXdhcm48L2Rpdj4NCjwvbGk+PC91bD4N
CjwvdWw+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+Jmd0OyZuYnNwOyBJIGJlbGlldmUg
dGhpcyB3YXJuaW5nIGhhcyBub3RoaW5nIHRvIGRvIHdpdGggdGhlIG5ldyB0ZXN0IHRoYXQgaXMg
YWRkZWQsIGFuZCBpcyBhIGZhbHNlIHBvc2l0aXZlLjwvZGl2Pg0KPGgyPk5ldyB0ZXN0czwvaDI+
DQo8cCBzdHlsZT0ibWFyZ2luLXRvcDogMWVtOyBtYXJnaW4tYm90dG9tOiAxZW07Ij5OZXcgdGVz
dHMgaGF2ZSBiZWVuIGludHJvZHVjZWQgYmV0d2VlbiBYRUlHVF84NzU3X0ZVTEwgYW5kIFhFSUdU
UFdfMTQ1NjNfRlVMTDo8L3A+DQo8aDM+TmV3IElHVCB0ZXN0cyAoMSk8L2gzPg0KPHVsPg0KPGxp
PmlndEBrbXNfZXhwbGljaXRfZmVuY2VAbXVsdGlwbGFuZS1hdG9taWMtZmVuY2Utd2FpdDo8L2xp
Pjx1bD4NCjxsaT5TdGF0dXNlcyA6PC9saT48bGk+RXhlYyB0aW1lOiBbTm9uZV0gczwvbGk+PC91
bD4NCjwvdWw+DQo8aDI+QnVpbGQgY2hhbmdlczwvaDI+DQo8dWw+DQo8bGk+SUdUOiBJR1RfODc1
NyAtJmd0OyBJR1RQV18xNDU2MzwvbGk+PC91bD4NCjxwIHN0eWxlPSJtYXJnaW4tdG9wOiAxZW07
IG1hcmdpbi1ib3R0b206IDFlbTsiPklHVFBXXzE0NTYzOiAyODZiNGQ2OTc4OTUwMzIwYmE5ODQy
MDMyYmU1YmI4MTMzOTExMDY0IEAgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9p
Z3QtZ3B1LXRvb2xzLmdpdDxicj4NCklHVF84NzU3OiA4NzU3PGJyPg0KeGUtNDU2OS1lNjZjNjRl
NGYxMmU1NWNhZDM1YzY4MGYxZTMyOGE3YzdlZTkyY2FiOiBlNjZjNjRlNGYxMmU1NWNhZDM1YzY4
MGYxZTMyOGE3YzdlZTkyY2FiPC9wPg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_CH0PR11MB542761610303761F99A93DCF986BACH0PR11MB5427namp_--
