Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB64D78336
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 16:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A3F10E7BE;
	Mon,  2 Dec 2024 16:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mn4mBnT2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBF010E7BE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733157136; x=1764693136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BCvK8zM9YQQlNiTuVqrLmT5APvNgyXQuSmCwe6Mb+po=;
 b=mn4mBnT2QGRuwsY/YC2oc4XlA8kD5RU39TA4N5eOyu4kfoJC5pfsFIo8
 flhsCcDNtzgn4G2WqWe5QRVAvGurKJP903iJLAIH7E3K5YHFv7tnF1Ht3
 XY5qqdBEW8gN3aUUAwr8j2ANHuABg9+ssRZvHJiy9wzB1qHpXeyiQ1CGB
 5k2sdMUJenq+PTjktNgAkVRAwy7EY6AO3S/8HbBsANmjXI5DyOGQJkhlD
 mvYoj8FcXG6X25TEGj8+ZjbXDaO+irQC7YNLgOXex/8sGIRLYBxMkN8Fx
 OMOVmdacJ5K5s+QCm7f1o1rZq+NYyY8z2Rq260eL/isgt51TSknJIW91/ Q==;
X-CSE-ConnectionGUID: YP86t71cQVKcicIzFYOrSg==
X-CSE-MsgGUID: FRudJoFDTvyPgsmUwiAdEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33261497"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="33261497"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 08:32:15 -0800
X-CSE-ConnectionGUID: iUy5DeYSR6yi+kJDWPET1w==
X-CSE-MsgGUID: dohbieWESEWAgHEgUAaEdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="97226091"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 08:32:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 08:32:04 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 08:32:04 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 08:32:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1VKr75UVr9O27/52Rghs5DcH8ETMAHJLwckLthOiJ7bnLYeeTbsyTPNjtgXcJqxmJHQ5G2BL/Ehih8M8itWULpc1VvUeE3so88BA5y2nsNr+4xFqeT/pVPDbUi7ZCCf+akn1pCfsyLVYM8J/tvNMwdfuss7H+vohZHthkrjFzwynTNkjmpgwsvD9Phcsg89eA3W5dX+0CB15wU+f/lSq8UXte3rj0FneOO/7FEtyZ1jNVontPsw3BBtEFyIjavZyFDW5pqb5ihYAECn37FrfxzxZG2kzHdK8MlvE8PzrS2LKahpVMjvYRg0J52xt/g4iTDN3PHmu1yM17qKIRMoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCvK8zM9YQQlNiTuVqrLmT5APvNgyXQuSmCwe6Mb+po=;
 b=FWBzGB6yVDjpnImEYpW/tjFRzZCmnwzssiadjv6UvNA901uWimxFyZmZUsvn6pxLc1a5PR/UrHKSGfRCNZREQlN/7zre7bdUMiclrF6tXRU0es02NSfl4vQI/a2W6DwBSYPBYnI+Uc4bW8oOADO2unl0cmZ2lcEdW4a6/bEilT1BmfasEnSerdzuL0zwp9JjN56c7EaaTJibh9yJFvQs+fucWDQnJe4LCdZ+idGCFYW9Bx00lQWyuN1jkJDQ0vYByKxaGkwc2hWNcHshqm+jKD+ax4p+MT5cq3lBa5eKG5sUwNL+Q1wVcF2hq4MIsgiPrEAoKU4UXx+4bSOHTRnoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 16:32:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 16:32:00 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v7 1/4] lib/igt_sysfs: Add engine list helpers
Thread-Topic: [PATCH v7 1/4] lib/igt_sysfs: Add engine list helpers
Thread-Index: AQHbOeR77De1atKMrEWrACOBApUncrLJ11wAgAlbqvA=
Date: Mon, 2 Dec 2024 16:32:00 +0000
Message-ID: <CH0PR11MB5444F4EF2441625835AC38B9E5352@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241118180511.64212-1-jonathan.cavitt@intel.com>
 <20241118180511.64212-2-jonathan.cavitt@intel.com>
 <20241126170646.4qp4vw637k5f7vqu@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241126170646.4qp4vw637k5f7vqu@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5117:EE_
x-ms-office365-filtering-correlation-id: fc1365cc-4123-4107-71b9-08dd12eed8fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S2dxbU1waVRoTXhYTWVObVFOeWJLUldjZEFyRzhqN1dQWnIvRkxZUVhKNDdp?=
 =?utf-8?B?SFZPK2c0WS9ydFUxZzJFNG1BREhzTko2Q1JuTVExRkRYSFRaNzdDSXdRd2pm?=
 =?utf-8?B?MXovR3NjRmlVdWRkYUJxWW16ZGVORGswSkVmVlJncDBtNlFSazlQby9lMTc4?=
 =?utf-8?B?SDFrbG90aXdCM0N6VFBVQzZ5RG0rVHU5WDQ1NUIyRlFGWE8rRXM0SWJMWjNy?=
 =?utf-8?B?a3RWYmFHRFNpdjR3ZENIYSt2SE1GMmhEb0VqZnp2MnpVdFR3czJLNkgzK3Q1?=
 =?utf-8?B?M3EwMmQxSjVydk81bEl0aDI5NjZtcmo1aGFpNnlwSDd0N2JkM0ZHWEVtSlVK?=
 =?utf-8?B?Q1l0YzBiNHQ0WHpoRnpEUnhSdEhzTE9nWDZDeFNubEtPQno1d3JwaVpHWlNs?=
 =?utf-8?B?TFpFb0FjcGpDL3pJWm8yZ0VaUVVzVW9RcUNodTFHQlBiVWFVdVljK3JEdTcx?=
 =?utf-8?B?THV0eGhGM0g3M25KVGNIQlNUZUJkSlUrVzErV0tsT0NIRXVaRDY2bDF0dVNS?=
 =?utf-8?B?STlkM3lleXZCdjVsK09NRVB6cE1zQitLWGJzVHhGM3RXcGhvQVZVSWxZYkVm?=
 =?utf-8?B?Z2k2SmRoeUQ3WU5IbGR4aTF5akNjRitGaDBpQ3liSDNPTStVYjdRR00xTm92?=
 =?utf-8?B?UGF4STF0RUdidzNjME5xSDA0TG5tSWkyajFaUDRmVUhQZzF2cWZBVHZpRDNs?=
 =?utf-8?B?SjVjMnVHTWFuSzJIaThUQ3d6SGdYbjZRU2gvVlRldHFmUHRZMlkzUFlZNnBi?=
 =?utf-8?B?ZE53clFvRUlGOHk1OFRRdGlCUG1kbG5HaElYY2Q2QTE1aGg4ZkMyNHVTeUdZ?=
 =?utf-8?B?SFpCS3FUbGEyREFxTmJlVzZGdFh1dTBabE9ELzh1ZjNNRUxnQy9XbFdicmV4?=
 =?utf-8?B?aWVKY0tscmh4QmlpSzVMemxKNjVqZ0FXQitmQTl5dFNmZUJldUNTN0pYMmRp?=
 =?utf-8?B?aEF0RkpneGI0WnNvaitKVndsekdIdDlVUUFUaVAxTEJtbWIxRjRoQWxyU0Jz?=
 =?utf-8?B?NkFEV1Vhd3hlOGt4QmFGNjBVSVIyZXMzR2xOMEtnS1dIL09RalRacjBwY04y?=
 =?utf-8?B?MVM4NGcveXh5dlZCZEdEWWRGbVl4UVZ3eDkwK0lBMmpGUFRaYVI3N0Q5N2Jj?=
 =?utf-8?B?eGd5cENaRWZjcVdMSTZBU3U4WUZzK0t0OFVCUm5IZ2NMeEpheHl0RVhpdHFU?=
 =?utf-8?B?RzZWOUl1dW9KaHNXNW1oQmNxOHgyQXVQVlZ5U0gvUXEwandRNCsrVmsrMm93?=
 =?utf-8?B?dDNPOEJzU254U1RiWUxrN3NsYmdFWXl2bUhDU2JYdUxvVjNGOTdsY2R3aFl3?=
 =?utf-8?B?QnhCYkxSUklhOHFYT25TUmZKYkhxM0ZTOFVCeFAwY2o3TktFM0JGNFYya3Ri?=
 =?utf-8?B?Sk0vZGxCUGVPKysrdTE1NFhDVm9ZSGk3c2lXSGU5OFFhajk3d1c0cUtoSkQx?=
 =?utf-8?B?TU42c3BnaWVpdnlhWmpYdEdnZEVJUkhZTEt3ajJzWGFWQUtqeUYwenJ5NDVn?=
 =?utf-8?B?YXFrVTRaM0ZHTW1NZW5zSVljTFYwdFFSVkZKT0FqN2xoTnRDYVcyRmQ5T3hI?=
 =?utf-8?B?Z0ZwaXhSaWZjd0psaExTdzVXdW44T0s4cEJ1N1hZbEFGbUhaa3o5M0IzUEJQ?=
 =?utf-8?B?SFhpYVlOcGNZUzF2alBMV0JEWll0SThjeEVyOG9NV2ZDN1VDWUlTeGI1aTBl?=
 =?utf-8?B?Q0dURWNMcWY3b3NkM0ZrOWNiL2RmV3kvK0UwUE9ma2xqS0Fvcy8vbDhWV2JU?=
 =?utf-8?B?SVk4N09aNnNXVnNkbFFndUtPMXlEN3o2MXVocXM0dXRibUY0Mk9nc0htbWhq?=
 =?utf-8?B?MVpTWTlkRGJ5R3pLQjI3bWt3czh3Slp3bk14M1lnVEV4Ny9mckw1WHlWSDZa?=
 =?utf-8?B?aHc2K2xxM0d0RVkzK2grQUNPNHZZdXBmSFlTWjFUVFY2WkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a0o4L3JhSTJOZEJYWEtQZTZtdi9CZllFMFVuTjk5cXd2alVUWTZ1K3FWL1pZ?=
 =?utf-8?B?L2JxSWlOdWE4dElKa1p3Ukp6bVQ0VmphN2U2YlpxNlhtZ0gyVDlQR2R5cEhP?=
 =?utf-8?B?bkVsbkxqVldOendKNWRUdDg2RnpLU0NaNWw0OGZ5M2tKK3NkY2xtNlNGWExw?=
 =?utf-8?B?eWlHb2c3UjMvenNpR0dSMW5WQ2NJU1hncVB3OUlDQ20vLzRqWGQydXNuZE9N?=
 =?utf-8?B?bHJPd3NoL1YxUXlCR3IyNjBldHpWSkJHU0hjQVZiN2NTbStYOUhJWkRHZWFj?=
 =?utf-8?B?T2ZOK056VmFFUWl0cTFKd2EzeWp3c09iWGVGTkhHN25IbThuaCtKcWp2N0N1?=
 =?utf-8?B?WVNhUWdxNjFWeW84NUZDbnBJd1c0ZXZ1c1RBd216azZXVy9UTjBrV3pYUnpX?=
 =?utf-8?B?QTE1c2gwMHc2K1ZycW1ObnVJd1pmUEdLcXIrOGxiYzM1ZFF1dXV0Rnp6OVQz?=
 =?utf-8?B?Z0U0Yko4RU9CbVlwZnhoU1cxNXZFT1Exd2F6YnFLRllhRUlWSUpzTzdiMVZk?=
 =?utf-8?B?MVdPZGprNEgzME1pRnJPL25hNXp6QkhsaDBwMmNUV1pGUDlqbTRzdnd0aFZI?=
 =?utf-8?B?SnpYMlZzUElLVG1pbU8zYVVVK2JXWWU0Zmp3eU9BTm51Zk9vTWxUV0ZsSmdU?=
 =?utf-8?B?UHhmS0lRYm9LeGZaL1dRSm43Zm1VRDc5ZC91T1pyMXFaN0hacnJmUVBiejJi?=
 =?utf-8?B?aDlsakIwMC84YXgwRENaRVRnNGwxOVVuUUlXZ2p1N0ViVEQ4RHJLaVNaMmV6?=
 =?utf-8?B?WHB3c2dNa1dkaTV0eFFON3IzUTU4T0QzR1U4NUpocitST3BQVENFWXhvRk1w?=
 =?utf-8?B?MG5maFQyMnU0YTFMT3JQQ205L2VaTEp4VkdBTDNON2FVQ0ZubFZKU1Fwa25m?=
 =?utf-8?B?QVpFSFA1cXU0K2p4R01YenlzNithUGlpdEplTmF4YWpOMGloWWVNZmhYRDcr?=
 =?utf-8?B?VjVzdUdJT1JSSVFGemhXeG9QRkxFODNxMWs3MC9jc3h2bDljUnBDL0c4S212?=
 =?utf-8?B?M0hTUkJCV1BpRFBUYkc3eXRvdFhhcGtsTHB1QnFXaWNMWXhWNDRvWnVqTFBs?=
 =?utf-8?B?ckZDV2V4YXJ1dUlhbXZEY05uQmt5YkNhaGdUVDBCUjR0dVZHYnloZFJoeUFt?=
 =?utf-8?B?MnNRb2szY2hDS0ZNK3NRSXFtZHhwNDUvcWpIYTB1aUxHWnZJb1NWcVVCdzVq?=
 =?utf-8?B?OThHZXZUY2NwMXlmcEl5Mm96RlVKcnkzdUhnalZ6d2NrTUlTZ1hGV050eHFL?=
 =?utf-8?B?N0hmb09WemNERFkxeDI0dkV0N29rcnAxR2o2b0FpZDBrUEY5WSt5MXRBNkUv?=
 =?utf-8?B?Wlg5cE91eU1XMmZ1elYyNHNSd2wza0wzYzFjV3UvYWxncUU1VWhvMWdobEdF?=
 =?utf-8?B?RXJKUFpqSUUwT0wzZVR0dmxUeGd1bDBrK0xVSHQwVkhsRDRKWCtFcXk4d2tT?=
 =?utf-8?B?ZmEyQVVHeGc2UlY1ZkpkRStWWUVTcWNZbzV1ejdxNjNSTlk3R1VyWU43Y0Va?=
 =?utf-8?B?bHZmWGlvWUttelhJd3B4K0l2ZXp4eXc3YkJSY0xPRHFsZTRNVW1MSEFBL2Rt?=
 =?utf-8?B?STB2cXZLSGtvUWFiZ1BUWDdRdDA2VExWTDlOSTN5NlFmZ0xDZXdSZ3BDWUlV?=
 =?utf-8?B?MlBpQkZSZjZzajBIbzdKOHU1REt4WGt5NVYxOU1qdXExRGsxN2lscEt5eFVW?=
 =?utf-8?B?VnNnMi9xdzhFbEtjK0NtSFNBR3FwazkzeXF2Tk9nYVN5YTZ1TnBVYjF3Nnln?=
 =?utf-8?B?Q016SGllWndiTEZvR1VybVJQVHZ6ZFFHbFR0ZWxIMHBFVmtxbkpBeFJFUTY5?=
 =?utf-8?B?Z0hhTWxjVDhCNjZFcGpXMjVqaVd6YUZqN1NWaGtmQ1RUcDVtcFFYaFJEOXR1?=
 =?utf-8?B?dUdwNjRXczRhSXEyVXBLYlZSM25BT1dmQ1NUL2prWGhRdHEzMkVkWEhPUzVw?=
 =?utf-8?B?L1o2VjgyOUo3S0hNZGJiNFZtSkxja0RSUlh2L1RRNmV2SDNGdTVGNk9XL0dG?=
 =?utf-8?B?U1o1c0Y0TG5HL1kwdE9idlFtTFJlRG9zalJaZ0NtRFF0eURvb1c0a21NeC84?=
 =?utf-8?B?THIrTnF6VXQzamFDOTNKbUJ4VDdSYjhCd1dhTEFWalhRdTlBa2plVGxadkJk?=
 =?utf-8?Q?qtv7YxtsEc/TCWTJ1JC/OkBRO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1365cc-4123-4107-71b9-08dd12eed8fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 16:32:00.8325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0fo/YlBZ4prMRlyMOxdGn1RXXbcSWQz27KV9lS3edoBM48b3QMcW4DpHM6H7MWiWXp/Z7A7x3lctH5nxplEijn+YE94SHavO2Q5tpV74t6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
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
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNiwg
MjAyNCA5OjA3IEFNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDYXZp
dHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPjsgR3VwdGEsIHNhdXJhYmhn
IDxzYXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNv
bT47IEJlbGdhdW1rYXIsIFZpbmF5IDx2aW5heS5iZWxnYXVta2FyQGludGVsLmNvbT4NClN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjcgMS80XSBsaWIvaWd0X3N5c2ZzOiBBZGQgZW5naW5lIGxpc3QgaGVs
cGVycw0KPiANCj4gSGkgSm9uYXRoYW4sDQo+IE9uIDIwMjQtMTEtMTggYXQgMTg6MDU6MDggKzAw
MDAsIEpvbmF0aGFuIENhdml0dCB3cm90ZToNCj4gPiBDcmVhdGUgdHdvIG5ldyBoZWxwZXIgZnVu
Y3Rpb25zLCBpZ3Rfc3lzZnNfZ2V0X2VuZ2luZV9saXN0IGFuZA0KPiA+IGlndF9zeXNmc19mcmVl
X2VuZ2luZV9saXN0LCB0aGF0IGNyZWF0ZSBhbmQgZGVzdHJveSBsaXN0cyBvZiBvcGVuDQo+ID4g
ZW5naW5lcywgcmVzcGVjdGl2ZWx5LiAgVGhlIGxpc3QgY3JlYXRlZCBieSBpZ3Rfc3lzZnNfZ2V0
X2VuZ2luZV9saXN0DQo+ID4gY2FuIGJlIHVzZWQgdG8gaXRlcmF0ZSBvdmVyIHRoZSBzZXQgb2Yg
ZW5naW5lcyBpbiBzeXNmcy9lbmdpbmVzIGFuZCBtdXN0DQo+ID4gYmUgZnJlZWQgYnkgaWd0X3N5
c2ZzX2ZyZWVfZW5naW5lX2xpc3QgYWZ0ZXIgdXNlLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvbmF0aGFuIENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gDQo+IFBsZWFz
ZSBjaGVjayBhbGwgcGF0Y2hlcyBpbiBzZXJpZXMgd2l0aCBjaGVja3BhdGNoLnBsIGFuZCBjb3Jy
ZWN0DQo+IGZpbmRpbmdzLg0KPiANCj4gPiAtLS0NCj4gPiAgbGliL2lndF9zeXNmcy5jIHwgNTQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBs
aWIvaWd0X3N5c2ZzLmggfCAgMyArKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRp
b25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lzZnMuYyBiL2xpYi9pZ3Rf
c3lzZnMuYw0KPiA+IGluZGV4IDAwZDU4MjJmZDMuLjNkMmRkMzY0Y2YgMTAwNjQ0DQo+ID4gLS0t
IGEvbGliL2lndF9zeXNmcy5jDQo+ID4gKysrIGIvbGliL2lndF9zeXNmcy5jDQo+ID4gQEAgLTEz
MDcsNiArMTMwNyw2MCBAQCBzdGF0aWMgdWludDE2X3QgeGVfZ2V0X2VuZ2luZV9jbGFzcyhjaGFy
ICpuYW1lKQ0KPiA+ICAJcmV0dXJuIGNsYXNzOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICsvKioNCj4g
PiArICogaWd0X3N5c2ZzX2dldF9lbmdpbmVfbGlzdDoNCj4gPiArICogQGVuZ2luZXM6IGZkIG9m
IHRoZSBkaXJlY3RvcnkgZW5naW5lDQo+ID4gKyAqIEBzaXplOiBwb2ludGVyIHRvIHN0b3JlIHRo
ZSBzaXplIG9mIHRoZSByZXR1cm5lZCBjaGFyIHBvaW50ZXINCj4gPiArICoNCj4gPiArICogSXRl
cmF0ZXMgb3ZlciBzeXNmcy9lbmdpbmVzIGFuZCByZXR1cm5zIGFuIGFycmF5IG9mDQo+ID4gKyAq
IG9wZW5lZCBlbmdpbmVzLiAgVGhlIHVzZXIgd2lsbCBiZSBpbiBjaGFyZ2Ugb2YgY2xvc2luZw0K
PiA+ICsgKiB0aGUgb3BlbmVkIGVuZ2luZXMuDQo+ID4gKyAqDQo+ID4gKyAqIFRoZSBudW1iZXIg
b2Ygb3BlbmVkIGVuZ2luZXMgd2lsbCBiZSBzYXZlZCB0byBzaXplLg0KPiA+ICsgKi8NCj4gPiAr
aW50ICppZ3Rfc3lzZnNfZ2V0X2VuZ2luZV9saXN0KGludCBlbmdpbmVzLCBpbnQgKnNpemUpDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBkaXJlbnQgKmRlOw0KPiA+ICsJRElSICpkaXI7DQo+ID4gKwlp
bnQqIHJldCA9IGNhbGxvYygxLCBzaXplb2YoaW50KSk7DQo+IA0KPiAJaW50ICpyZXQgPSAuLi4N
Cj4gDQo+IEFzc2VydCBmb3IgTlVMTCBoZXJlOiBpZ3RfYXNzZXJ0KHJldCkNCj4gDQo+IFdoeSBu
b3QgMTY/IFNvIHlvdSBzaG91bGQgYXZvaWQgcmVhbGxvYz8NCj4gVGhpcyB3b3VsZCByZXF1aXJl
IHRvIGtlZXAgaXRzIHNpemUgYnV0IGltaG8gd291bGQgYmUgYmV0dGVyLg0KPiBVcCB0byB5b3Uu
DQoNCldvdWxkbid0IHVzaW5nIDE2IGhlcmUgYmUgY29uc2lkZXJlZCBhICJtYWdpYyBudW1iZXIi
IGFuZCB0aHVzDQpuZWNlc3NpdGF0ZSBzb21lIGRlZmluZWQgbWFjcm8/ICBJIGd1ZXNzIEkgY291
bGQganVzdCBjYWxsIGl0IEFSUkFZX01BWA0KYW5kIHVuZGVmaW5lIGl0IGFmdGVyIHRoZSBmdW5j
dGlvbi4uLg0KDQo+IA0KPiA+ICsNCj4gPiArCWxzZWVrKGVuZ2luZXMsIDAsIFNFRUtfU0VUKTsN
Cj4gPiArDQo+ID4gKwlkaXIgPSBmZG9wZW5kaXIoZW5naW5lcyk7DQo+ID4gKwlpZiAoIWRpcikN
Cj4gPiArCQljbG9zZShlbmdpbmVzKTsNCj4gDQo+IFNob3VsZCBiZToNCj4gDQo+IAlpZiAoIWRp
cikNCj4gCQlyZXR1cm4gTlVMTDsNCj4gDQo+IEJ0dyB3aHkgZG8geW91IGNsb3NlIGVuZ2luZXMg
aGVyZT8NCg0KVGhpcyBtaXJyb3JzIGlndF9zeXNmc19lbmdpbmVzLiAgSWYgaXQncyB3cm9uZyBo
ZXJlLCB0aGVuIGl0J3MgcHJvYmFibHkgd3JvbmcgdGhlcmUgYXMgd2VsbC4NCg0KPiANCj4gPiAr
DQo+ID4gKwkqc2l6ZSA9IDA7DQo+IA0KPiBNb3ZlIHRoaXMgdG8gYmVnaW4gb2YgZnVuY3Rpb24u
IEJ0dyBkbyB3ZSBuZWVkIHNpemU/IFlvdSBjb3VsZCBhc3N1bWUNCj4gYSBndWFyZCBhdCBlbmQg
d2l0aCAtMSBzbyBvbmUgcGFyYW0gbGVzcy4NCg0KVGhhdCB3b3VsZCByZXF1aXJlIHNvbWUgcmV3
b3JrIG9uIGhvdyB3ZSBpdGVyYXRlIG92ZXIgdGhlIGxpc3RzIGluIHRoZQ0KdGVzdHMgdGhhdCB3
aWxsIHVzZSB0aGlzIGhlbHBlciBmdW5jdGlvbiwgYnV0IG90aGVyd2lzZSB0aGF0IHNob3VsZCBi
ZSBkb2FibGUuDQoNCj4gDQo+IA0KPiA+ICsJd2hpbGUgKChkZSA9IHJlYWRkaXIoZGlyKSkpIHsN
Cj4gPiArCQlpZiAoKmRlLT5kX25hbWUgPT0gJy4nKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiAr
CQlyZXRbKnNpemVdID0gb3BlbmF0KGVuZ2luZXMsIGRlLT5kX25hbWUsIE9fUkRPTkxZKTsNCj4g
PiArCQlpZiAocmV0WypzaXplXSA8IDApIHsNCj4gDQo+IFdoeSBpZ25vcmU/IGltaG8gdGhpcyBp
cyBzb21ldGhpbmcgdW5leHBlY3RlZD8NCg0KV2UgYWxzbyBpZ25vcmUgaW4gaWd0X3N5c2ZzX2Vu
Z2luZXMuDQoNCj4gDQo+IE92ZXJhbGwgbG9va3MgZ29vZCwgdGh4IGZvciBmaXhpbmcgdGhpcy4N
Cj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+ICsJCQlyZXRbKnNpemVdID0gMDsNCj4g
PiArCQkJY29udGludWU7DQo+ID4gKwkJfQ0KPiA+ICsJCSpzaXplICs9IDE7DQo+ID4gKwkJcmVh
bGxvY2FycmF5KHJldCwgKnNpemUgKyAxLCBzaXplb2YoaW50KSk7DQo+ID4gKwl9DQo+ID4gKwly
ZXR1cm4gcmV0Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogaWd0X3N5c2ZzX2Zy
ZWVfZW5naW5lX2xpc3Q6DQo+ID4gKyAqIEBsaXN0OiBsaXN0IG9mIG9wZW5lZCBlbmdpbmVzDQo+
ID4gKyAqIEBzaXplOiBudW1iZXIgb2YgZW5naW5lcyBpbiBsaXN0DQo+ID4gKyAqDQo+ID4gKyAq
IEhlbHBlciBmb3IgY2xlYW5pbmcgdXAgYWZ0ZXIgaWd0X3N5c2ZzX2dldF9lbmdpbmVfbGlzdC4N
Cj4gPiArICogQ2xvc2VzIGFsbCBlbmdpbmVzIGluIGxpc3QgYmVmb3JlIGZyZWVpbmcgdGhlIGxp
c3QuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIGlndF9zeXNmc19mcmVlX2VuZ2luZV9saXN0KGludCAq
bGlzdCwgaW50IHNpemUpDQo+ID4gK3sNCj4gPiArCWludCBpOw0KPiA+ICsJZm9yIChpID0gMDsg
aSA8IHNpemU7IGkrKykNCj4gPiArCQljbG9zZShsaXN0W2ldKTsNCj4gPiArCWZyZWUobGlzdCk7
DQo+ID4gK30NCj4gPiArDQo+ID4gIC8qKg0KPiA+ICAgKiBpZ3Rfc3lzZnNfZW5naW5lczoNCj4g
PiAgICogQHhlOiBmZCBvZiB0aGUgZGV2aWNlDQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lz
ZnMuaCBiL2xpYi9pZ3Rfc3lzZnMuaA0KPiA+IGluZGV4IDU0YTQwODc5MTguLmJhMGE3NDc1NWMg
MTAwNjQ0DQo+ID4gLS0tIGEvbGliL2lndF9zeXNmcy5oDQo+ID4gKysrIGIvbGliL2lndF9zeXNm
cy5oDQo+ID4gQEAgLTE2OCw2ICsxNjgsOSBAQCB0eXBlZGVmIHN0cnVjdCBpZ3Rfc3lzZnNfcndf
YXR0ciB7DQo+ID4gIA0KPiA+ICB2b2lkIGlndF9zeXNmc19yd19hdHRyX3ZlcmlmeShpZ3Rfc3lz
ZnNfcndfYXR0cl90ICpydyk7DQo+ID4gIA0KPiA+ICtpbnQgKmlndF9zeXNmc19nZXRfZW5naW5l
X2xpc3QoaW50IGVuZ2luZXMsIGludCAqc2l6ZSk7DQo+ID4gK3ZvaWQgaWd0X3N5c2ZzX2ZyZWVf
ZW5naW5lX2xpc3QoaW50ICpsaXN0LCBpbnQgc2l6ZSk7DQo+ID4gKw0KPiA+ICB2b2lkIGlndF9z
eXNmc19lbmdpbmVzKGludCB4ZSwgaW50IGVuZ2luZXMsIGludCBndCwgYm9vbCBhbGwsIGNvbnN0
IGNoYXIgKipwcm9wZXJ0eSwNCj4gPiAgCQkgICAgICAgdm9pZCAoKnRlc3QpKGludCwgaW50LCBj
b25zdCBjaGFyICoqLCB1aW50MTZfdCwgaW50KSk7DQo+ID4gIA0KPiA+IC0tIA0KPiA+IDIuNDMu
MA0KPiA+IA0KPiANCg==
