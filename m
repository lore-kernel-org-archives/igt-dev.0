Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C325606B2CA
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 14:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmLh9oTm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=COPrsN8L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B583210E6C6;
	Thu, 12 Nov 2026 14:26:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDE210E196
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794493514; x=1826029514;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4M3XJHW2irACI/l7x9pDNEGDfOi5+APPJqrtoV7G/6M=;
 b=cmLh9oTmvQ0zOtHADJU8gbuMnbSruWv7Hcdrwzchm20ot8IJDrT4a8d0
 VUxZG0CUYDuFkHflh+WM9o2DRq8SeTZ1Gi2+X+mW9DknQlT8x0g+fG53y
 TGqh+uKtu2Wa3bmVe5CJzLah/CyiBJsCeoTH0Zm5hoPZAlsZNJr5OsKfW
 DGkEgQkg0Q52JfHRMqTmAn9XZVX+hzRYVtEx94pEkKXeX1saUClNns/MA
 ugOUV3BqCM4mIZQ0+QGa+5LQ2OFLfWy7XWy+Z8zaWYXmW1bpEoPIGoASS
 JR74zGFGa8XYPwmzVTINC8aHKW+XuUZMb9/Lk9OrH4csBoRLitKwRw/t8 Q==;
X-CSE-ConnectionGUID: 0Nvqcd7ZS9CvgMfUgLdCeQ==
X-CSE-MsgGUID: pxfKqy22T0GUWgI2IQYr4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3378439"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3378439"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:25:14 -0800
X-CSE-ConnectionGUID: zcYYx5W2QXaoJMKg0zGSrg==
X-CSE-MsgGUID: 9HgXa84dSD6YJ2hBlfZbew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8670768"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 06:25:14 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:25:13 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 06:25:13 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 06:25:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXCX5/WulQjRf4fSJzM7u+UKd14IWf6d2HDrumEiLde5vHmaMm0pAqOXHCOYFeG8v4VNi80NbvSo5kvcvnEHTzLRbliKiJIjqJUzzCWHzaOD9fFxjsElEpSvnFjKn9b1ajDyk8ojrgGZno9GH2T1CVHDVbaAvYjHVtw0bYvOKlqHyb8l+O3NFKYbeacteOwVmm9z+AGOAJGC6L2oPALMSU7uer2Zpam8C/muFVi0NTS8orC42tPC5EajY06FB9QgBhNCFCRGg9EEwBSH91731vzFm3wbnJbboaRPZkFTixKKhzT89EydxVp1SabmZGJL7fOvzxor1xVVv/Gp7ZGtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHjVxodWChhVWLOm6WzqLXKHLZBtwAa4RtfjQmacf30=;
 b=onJESsD6YSIyaGFCv66Y3ze6L5eAUySlOkc6lhxbKgZSRXyTuy1LxFqypn/1p5inoJehRMxMF/SQJoUrXFsUF+hdvZFOS3f57cuLUuU7+BPbv+ercwHfZVyRPNrqwG+zTT7XlGQ7wkjYYCcLNueGeEl5fAKiq/UFmJ0RVKqd6AmP0mdoMegZDXh4Et6J6Dr+UNTAY+5vbzz4ffGzOs9gBkZKoPNOMTRZ9U/yi1De8kz9D0vfQT3yX3+Nr7KePHhUxa4D3NLeOBsw1TABQGGb89uE6zmKTAr2ATGZmrkVcJDoMAPPF9n1xXuzcUSQrj8DLNIu2Qof8FjHtuPBaijpaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHjVxodWChhVWLOm6WzqLXKHLZBtwAa4RtfjQmacf30=;
 b=COPrsN8LH9j7y7UyfL2rxJv7FTi+YeSuii4QzXN005/djFVD+frS4u6P+T3c3JN8Yt+ax4IFiKOIlAVNauZALy5eRjsr4PpWUfYZrzjt+tjvcj1yG0Ij2U4k8OEDYr4bCyw+EjQ/sDwohF7QCc8vgESDgsjNPCxR50h6uybYvy0=
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SA0PR11MB4528.namprd11.prod.outlook.com
 (2603:10b6:806:99::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:25:05 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 14:25:05 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] test/intel/xe_pmt: Support CRI PMT
Thread-Topic: [PATCH i-g-t v2 2/2] test/intel/xe_pmt: Support CRI PMT
Thread-Index: AQHdZxgqfpKF0/WlH0KMpUtrJi2TQbcpVicAgAE+pvA=
Date: Thu, 12 Nov 2026 14:25:05 +0000
Message-ID: <CH3PR11MB0461490BA83711395873CC2181C1702@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
 <20261028200500.4005780-6-michael.j.ruhl@intel.com>
 <avTAwlIEjX8DgDDS@intel.com>
In-Reply-To: <avTAwlIEjX8DgDDS@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SA0PR11MB4528:EE_
x-ms-office365-filtering-correlation-id: b5647230-68c4-4628-5abc-08df40c8bf22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|10067099003|4143699003|11063799006|56012099006|261022115727099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: IbUKTRAWMS940awL8DIhps6QxUckaOpjKKM6HiJndcCh/olC/75zD+2R6YEk4GkzZSV8V+WNNWH5aHA5Zomylnzqoj4vBGPrx0T3DgkW27kOWHFUU67i3IQAD/pvy1kyTaKlKXHuR2fRBM7KBPCpFuqP7RSDOeiXE4nEoSva9XDhlE1DsqsOLJlk4SnyWuCb/kSBeh+aMkaioy6Gh5ny6kRptFTkGMX+URbByJuqmPLjXmHRfWWj83MUBc/9gXE6pdEJHSQ/p9WnpSfsu4iulvv2EbyfBo5p4HCPXgOH+wJZ2ejWD+0WYH0gWxO9D3wR2l57bjPER/FA09q2dZAU9Qt/1KbgMhsFTLj0tULpo95PhncWgA/UWxhOMiZPp/g+/+KoVEe3oaO2FzaZeCkmrV0OQkUgdcjiV+/SL5W7UlFd4sl9TVWqIlITUOs0C8GCAZxoEBwACOzaECgZo+WrwihfGKdVBXJSU8DoWSRoqT61/OZhsEPSJhTAuS6p+w1pfCiJ8YmRP5nrxsv1XEC/tyWCe/KSv5qNk1ClYhBcI/0/2LEaxm+1FDkYmqC/8PHTgHYNpN7+vLIbMVWIJmbhGwCm/DgPHttR8TVU+dQ3jmovDIUtAHl1hJw0CjNxhkklKfDf1A60wYVCg+aG87NER+qoVMNn/yfiKJDpGB4xlPwzCOHUL0l77rqfG+qzivuf63CXTpgnr+DNBGZq2WqGMcEgDrpQIqSXKjFWf2kUGgs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261022115727099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w/4lO6uOKeORqM1opUvCTtnpgkbybJgaodK5wAkVYw+xFftL7Ga8ZrEwJe6y?=
 =?us-ascii?Q?5A6fQLSKsET7PVjjyH3xNlzQrikCigOklFwoAQg3wkeWMfN2U8SXt7NwaFWl?=
 =?us-ascii?Q?6CFLgUDRdAmNsnMBH/QZcF840pjVyWz3WDqg+IjwTRsbq2rB6sMhWHbxA3sF?=
 =?us-ascii?Q?VXLDRB/BBXUN0o3Pz/1+6p6mA9jUy1PxLWfJteorWI45+UN/MVgUHdGwqVaN?=
 =?us-ascii?Q?lSpUIdpHwG0Icxw/S2/qOU46zj+lQdOLXUUVtbpwnUsi5LnpySCrQn8Lzllq?=
 =?us-ascii?Q?AvYLXL9AZskA5b7tHsLDuN7SxiZrPRXbmnA6wBXYqrneduqYriMgkTgpUukr?=
 =?us-ascii?Q?h8N+UgnxhjXyKZpbA22DoXQusDYCk+0SHq/EnpKdpZTGk7qmDNPozYb16JuX?=
 =?us-ascii?Q?efOEDWaHG0DhPl8k65iQhnRGf4CBG+UnHcWC2qxu/H34HXgCa1ywe8+q2M/W?=
 =?us-ascii?Q?Tp5uj0cw+Cw/pYZmPmoc5Pj+2TV+VvyqiAdM5mdMHuu3OydEmkl5GEq7ef9v?=
 =?us-ascii?Q?YKhQdt/KzsKjtnRf/6woOzhUe2BjUkqNhHT07p4TF01Me/hO8vS/YWpxH1Bu?=
 =?us-ascii?Q?WczA5f49WsYYvEQR0pqNOaANKSYjeJImQY6rG3FQKhBCuK4vChpqLZlmz9Rg?=
 =?us-ascii?Q?XGfE6F2CnmncRA2vwkW5p7Nocdag8+8ePUKhWsfBCQdb79FbaOkG9JNTHK30?=
 =?us-ascii?Q?AEtuDWKD588eii1n+fzCh6VkLeW5hFRg1HdfwKSnmtoMv/QeFsbcPbgstD6C?=
 =?us-ascii?Q?d4iI6e7F/jYtubj4x11Kx3ZWwXvJyvYQRmiAjDVRkXUSSSHWXPqYovlLnZn2?=
 =?us-ascii?Q?xJ2FrBvYhNfmK++K5qxd5P8eh3FDHiF3oRDxAN4JbFUdI4qoo9/yeNXQFAMn?=
 =?us-ascii?Q?xjJ2mg1abo2v6VQ/s2CDR4lHj97276pEEWBivHJXFiKaTrbt3X/9vdo/ed2l?=
 =?us-ascii?Q?UXf9o9CuMPHm4RXjubwvk+w7ckPZeN10Jnotaz/whYuGJ0tHngtaTyVhnfgS?=
 =?us-ascii?Q?bC91Wf/fTvltMJ+cHKlgInnCrjhp3dbuZvUWsG+9EUBqsIFfLM6Qq+/y45A2?=
 =?us-ascii?Q?95Y+UTLZyqheApn7442VanCloz3q8jfg1cKMvuyXRnWyJSYA1/BUFvqQjfE1?=
 =?us-ascii?Q?tmI7IMECxzXtiKvD5gZoGx9NP3NGFgqa80pAT+jkeQ5FSpH3i9WFAMO70mdA?=
 =?us-ascii?Q?nE3D+OiAJAaQ/q30CqYkS1lvozyzVly4VdEu2jyJZ5u3L3YerfdAt6eaodEt?=
 =?us-ascii?Q?feImcdfzWYtwz+BsiAGWnWJwX0Q0+Ds6A+KZrRWxiacUO9FY1JRawclB6BKg?=
 =?us-ascii?Q?82yVvzOyoNa3/+myka1YpNcrYqd3HkeL+0oxoo/jGxCXte+HZJlT24dkgiJx?=
 =?us-ascii?Q?1Q9hmFJAw2kObga3Stfom1w/RZZCKqztCCRRcD94kC2FMC4B7aVxRb85Oh7F?=
 =?us-ascii?Q?eZIwCcP/tF8QZW5EVtTzENARedTwlPi4zAHTi5asmPHDZhEBFAAOPxrfoMpO?=
 =?us-ascii?Q?Vn4JNqf9rogwd2nMCSLQIagg4d/gCG9STyhG2pDkrBmPL/EIwjdBQOa1g0sZ?=
 =?us-ascii?Q?QrxVRWCnKp8NCCdwMNNTvXbvH1GL9jom5aZerzRFk3nlI5lqMokEgFxyzfZW?=
 =?us-ascii?Q?/cR6P6V770tjdlSI2W78PiWwKVLxOhfmGnfy7p8AyW/WTVSHEdQ/uMnn0O9k?=
 =?us-ascii?Q?up4an1AvY8vkQDbM/U/YXGfaSJWU7jw5up0FROxRU2B0qtd6SUxPOBxCorXn?=
 =?us-ascii?Q?0oCIWFMx+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: smFGYCQd/ifN0uQqAGzzBFsTZDgb0YZL/qyGDc6N+iKzWso8uTH7ypymoaE1Myj7BHC9x3MtMnZ6fX43XoCjffv0CZrPf009VS7UP8tGNB9+HT9tiARqj5O2kpSfndOeP8pMGysOsoWMn4zpqJOvf8fb6Nn2eAXTCmuiJ2fXeJWRqJ3omHjkmt5zVCaEDA4Ni+W3BuBdNEFjwfE2XQPYKK44Pgg0eukBuuyKu/gQkq6cCZrFLIyOk0eSBLdh51FdB+wiiPWGPkyRt6aJzj3Cna8c0NcBZjeetNcXVBgN3t8ABwNHm69P2abqoGZg9lDDgC6tFTxWHgYCvYXkQcEeYA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5647230-68c4-4628-5abc-08df40c8bf22
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 14:25:05.4154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YfUDSX+kH7FvOgl7j5D7oJcDEIM2NUIFncR+YsxNl7vkcuKSWZsz7TWwCXl5fsND8xvDGsN4JkvCUl422PZ3mVuxYZm4ib5w9QxRiaMrvls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Wednesday, November 11, 2026 2:24 PM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Scarbrough, Frank
><frank.scarbrough@intel.com>; david.e.box@linux.intel.com
>Subject: Re: [PATCH i-g-t v2 2/2] test/intel/xe_pmt: Support CRI PMT
>
>On Wed, Oct 28, 2026 at 01:05:02PM -0700, Michael J. Ruhl wrote:
>> Crescent Island (CRI) devices have the Platform Monitoring
>> Technology (PMT) support for the telemetry and crashlog
>> (type 1/version2) functions.
>>
>> Add test support for the device.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  tests/intel/xe_pmt.c | 259 ++++++++++++++++++++++++++++---------------
>>  1 file changed, 171 insertions(+), 88 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> index af5d470b5..ebd3fe3f6 100644
>> --- a/tests/intel/xe_pmt.c
>> +++ b/tests/intel/xe_pmt.c
>> @@ -8,6 +8,7 @@
>>  #include <fcntl.h>
>>  #include <limits.h>
>>  #include <string.h>
>> +#include <linux/limits.h>
>>
>>  #include "igt.h"
>>  #include "igt_sysfs.h"
>> @@ -25,9 +26,9 @@
>>   * Description: Verify that the available PMT files (crashlog and telem=
etry)
>>   *   are created, are accessable, and respond as per design.
>>   *
>> - * SUBTEST: pmt-bmg-all
>> + * SUBTEST: pmt-api
>>   * Description:
>> - *   Exercise the BMG PMT feature
>> + *   Verify that the correct PMT sysfs file exist and verify access
>>   *
>>   */
>>
>> @@ -40,16 +41,34 @@ IGT_TEST_DESCRIPTION("Verify Platform Monitoring
>Technology (PMT) files operatio
>>  #define TELEMETRY_DIR "telem"
>>
>>  /* itemize the available instances for the specific device */
>> -enum bmg_crashlog_instances {
>> -	bmg_crashlog_punit =3D 0,
>> -	bmg_crashlog_oobmsm,
>> -	bmg_crashlog_max
>> +enum pmt_device {
>> +	PMT_DEVICE_BMG,
>> +	PMT_DEVICE_CRI,
>>  };
>>
>> -enum bmg_telemety_instances {
>> -	bmg_telemetry_punit =3D 0,
>> -	bmg_telemetry_oobmsm,
>> -	bmg_telemetry_max
>> +struct pmt_device_info {
>> +	uint32_t max_crashlog;
>> +	uint32_t max_telem;
>> +};
>> +
>> +#define BMG_CRASHLOG_MAX	(2)
>> +#define BMG_TELEM_MAX		(2)
>> +
>> +#define CRI_CRASHLOG_MAX	(2)
>> +#define CRI_TELEM_MAX		(3)
>> +
>> +#define CRASHLOG_MAX		CRI_CRASHLOG_MAX
>> +#define TELEM_MAX		CRI_TELEM_MAX
>> +
>> +struct pmt_device_info device_info[] =3D {
>> +	[PMT_DEVICE_BMG] =3D {
>> +		.max_crashlog =3D BMG_CRASHLOG_MAX,
>> +		.max_telem =3D BMG_TELEM_MAX,
>> +	},
>> +	[PMT_DEVICE_CRI] =3D {
>> +		.max_crashlog =3D CRI_CRASHLOG_MAX,
>> +		.max_telem =3D CRI_TELEM_MAX,
>> +	},
>>  };
>>
>>  static char dev_path[PATH_MAX];
>> @@ -59,13 +78,18 @@ static char work_path[PATH_MAX * 2];
>>   * In most case there should be a single instance of the crashlog and
>telemetry
>>   * directories. If DVSEC entries are not contiguous the structure will =
be
>different,
>>   * and the code will need to reflect the structure.
>> + * vsec directory string size is sizeof(xxx_DIR) + idx.  For instance:
>> + *    intel_vsec.crashlog.3
>> + *    intel_vsec.telemetry.23
>>   */
>> -static char crashlog_vsec_dir[32];
>> -static char telemetry_vsec_dir[32];
>> +#define MAX_VSEC_DIR (32)
>> +
>> +static char crashlog_vsec_dir[MAX_VSEC_DIR];
>> +static char telemetry_vsec_dir[MAX_VSEC_DIR];
>>
>>  /* This needs to be specific for each supported device */
>> -static char crashlog_dir[bmg_crashlog_max][32];
>> -static char telemetry_dir[bmg_telemetry_max][32];
>> +static char crashlog_dir[CRASHLOG_MAX][MAX_VSEC_DIR];
>> +static char telemetry_dir[TELEM_MAX][MAX_VSEC_DIR];
>>
>>  /* telemetry file names */
>>  static const char *telem =3D "telem";
>> @@ -90,7 +114,7 @@ struct crashlog_v2_info {
>>  	int rearm_fd;
>>  	int trigger_fd;
>>  	u_int32_t guid;
>> -} bmg_info[bmg_crashlog_max];
>> +} crashlog_info[CRASHLOG_MAX];
>>
>>  #define DEV_PATH_LEN 80
>>
>> @@ -121,17 +145,22 @@ static char *device_sysfs_path(int fd, char *path)
>>  /*
>>   * Verify the PMT directory structure
>>   *
>> - * BMG PMT directory structure:
>> + * BMG/CRI PMT directory structure:
>>   *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>>   *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>>   *
>>   * Note: different platforms could have a different pattern
>>   */
>> -static void test_pmt_directories(int dev_fd)
>> +static void test_pmt_directories(int dev_fd, enum pmt_device pmt_dev)
>>  {
>>  	struct dirent *ent;
>> -	int index;
>> +	uint32_t index;
>>  	DIR *dir;
>> +	uint32_t max_crashlog;
>> +	uint32_t max_telem;
>> +
>> +	max_crashlog =3D device_info[pmt_dev].max_crashlog;
>> +	max_telem =3D device_info[pmt_dev].max_telem;
>>
>>  	igt_assert(device_sysfs_path(dev_fd, dev_path));
>>
>> @@ -161,7 +190,7 @@ static void test_pmt_directories(int dev_fd)
>>  	/* find the crashlog<x> directory instances */
>>  	while ((ent =3D readdir(dir)) !=3D NULL) {
>>  		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> -			if (index < bmg_crashlog_max)
>> +			if (index < max_crashlog)
>>  				strcpy(crashlog_dir[index], ent->d_name);
>>  			index++;
>>  		}
>> @@ -169,8 +198,9 @@ static void test_pmt_directories(int dev_fd)
>>
>>  	closedir(dir);
>>
>> -	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> -	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +	igt_assert_f(index =3D=3D max_crashlog, "unexpected crashlog entries: =
%d
>vs expected: %d\n",
>> +		     index, max_crashlog);
>> +	for (int i =3D 0; i < max_crashlog && i < ARRAY_SIZE(crashlog_dir); i+=
+)
>>  		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>>
>>  	/* verify telemetry directory structure */
>> @@ -182,7 +212,7 @@ static void test_pmt_directories(int dev_fd)
>>  	index =3D 0;
>>  	while ((ent =3D readdir(dir)) !=3D NULL) {
>>  		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> -			if (index < bmg_telemetry_max)
>> +			if (index < max_telem)
>>  				strcpy(telemetry_dir[index], ent->d_name);
>>  			index++;
>>  		}
>> @@ -190,8 +220,9 @@ static void test_pmt_directories(int dev_fd)
>>
>>  	closedir(dir);
>>
>> -	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> -	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +	igt_assert_f(index =3D=3D max_telem, "unexpected telemetry entries: %d=
  vs
>expected: %d\n",
>> +		     index, max_telem);
>> +	for (int i =3D 0; i < max_telem && i < ARRAY_SIZE(telemetry_dir); i++)
>>  		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>>
>>  }
>> @@ -227,11 +258,11 @@ static void open_pmt_file(const char *path, const
>char *file, int *fd, int flags
>>  /*
>>   * verify that the expected telemetry file(s) are in place
>>   */
>> -static void test_pmt_telemetry_files(int dev_fd)
>> +static void test_pmt_telemetry_files(int dev_fd, enum pmt_device pmt_de=
v)
>>  {
>>  	int i;
>>
>> -	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +	for (i =3D 0; i < device_info[pmt_dev].max_telem; i++) {
>>  		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>>  			"intel_pmt", telemetry_dir[i]);
>>  		find_pmt_file(work_path, telem);
>> @@ -241,7 +272,7 @@ static void test_pmt_telemetry_files(int dev_fd)
>>  /*
>>   * verify that a read will be successful
>>   */
>> -static void test_pmt_telemetry_read_data(int dev_fd)
>> +static void test_pmt_telemetry_read_data(int dev_fd, enum pmt_device
>pmt_dev)
>>  {
>>  	char buf[64] =3D {};
>>  	u_int32_t *val;
>> @@ -252,7 +283,7 @@ static void test_pmt_telemetry_read_data(int
>dev_fd)
>>  	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +	for (i =3D 0; i < device_info[pmt_dev].max_telem; i++) {
>>  		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>>  			"intel_pmt", telemetry_dir[i]);
>>  		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
>> @@ -278,29 +309,29 @@ static void test_pmt_telemetry_read_data(int
>dev_fd)
>>  /*
>>   * verify that the expected crashlog files are in place
>>   */
>> -static void test_pmt_crashlog_files(int dev_fd)
>> +static void test_pmt_crashlog_files(int dev_fd, enum pmt_device pmt_dev=
)
>>  {
>>  	char buf[64] =3D {};
>>  	int ret;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>>  		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>>  			crashlog_dir[i]);
>>
>> -		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> -		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> -		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> -		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, clear, &crashlog_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&crashlog_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog,
>&crashlog_info[i].crashlog_fd, O_RDONLY);
>> +		open_pmt_file(work_path, enable,
>&crashlog_info[i].enable_fd, O_RDWR);
>> +		open_pmt_file(work_path, error, &crashlog_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid,
>&crashlog_info[i].guid_fd, O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &crashlog_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &crashlog_info[i].trigger_fd,
>O_RDWR);
>>
>> -		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		ret =3D pread(crashlog_info[i].guid_fd, buf, sizeof(buf), 0);
>>  		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> -		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> -		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +		crashlog_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(crashlog_info[i].guid > 0, "failed to set guid for
>device %d\n", i);
>>  	}
>>  }
>>
>> @@ -336,15 +367,15 @@ static bool verify_msg(int fd, const char *msg,
>const char *file) {
>>  /*
>>   * Set enable enable/disable bit and verify usage
>>   */
>> -static void test_pmt_crashlog_enable(int dev_fd)
>> +static void test_pmt_crashlog_enable(int dev_fd, enum pmt_device
>pmt_dev)
>>  {
>>  	u_int32_t guid;
>>  	int fd;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		fd =3D bmg_info[i].enable_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		fd =3D crashlog_info[i].enable_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* force enable so we are in a known state */
>>  		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> @@ -365,14 +396,14 @@ static void test_pmt_crashlog_enable(int dev_fd)
>>   * The error bit is set when a crashlog fails in HW.  It is read only s=
o only
>>   * need to verify that it is "0".
>>   */
>> -static void test_pmt_crashlog_error(int dev_fd)
>> +static void test_pmt_crashlog_error(int dev_fd, enum pmt_device pmt_dev=
)
>>  {
>>  	uint32_t guid;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		guid =3D bmg_info[i].guid;
>> -		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error),
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		guid =3D crashlog_info[i].guid;
>> +		igt_assert_f(verify_msg(crashlog_info[i].error_fd,
>DISABLE_MSG, error),
>>  			     "0x%x: error clear\n", guid);
>>  	}
>>  }
>> @@ -381,24 +412,65 @@ static void test_pmt_crashlog_error(int dev_fd)
>>   * The rearm bit is set at cold boot.  It cannot be reset unless are re=
al crashlog
>>   * occurs (i.e. setting trigger will not change its value).  Verify tha=
t it is "1".
>>   */
>> -static void test_pmt_crashlog_rearm(int dev_fd)
>> +static void test_pmt_crashlog_rearm(int dev_fd, size_t pmt_dev)
>>  {
>>  	uint32_t guid;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		guid =3D bmg_info[i].guid;
>> -		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm),
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		guid =3D crashlog_info[i].guid;
>> +		igt_assert_f(verify_msg(crashlog_info[i].rearm_fd,
>ENABLE_MSG, rearm),
>>  			     "0x%x: rearm set\n", guid);
>>  	}
>>  }
>>
>> +/*
>> + * Verify the crashlog data is in the initialized state
>> + * 0xdeadbeef BMG PUINT/OOBMSM default, CRI PUNIT default
>> + * 0xba0b6afe CRI OOBMSM default
>> + */
>> +static void test_pmt_crashlog_inited(int dev_fd, enum pmt_device pmt_de=
v)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t guid;
>> +	int crashlog_fd;
>> +	int clear_fd;
>> +	int *val;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		clear_fd =3D crashlog_info[i].clear_fd;
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		guid =3D crashlog_info[i].guid;
>> +
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>> +
>> +		val =3D (int *)buf;
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef || *val =3D=3D 0xba0b6afe,
>> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>
>perhaps here it should be a igt_skip instead?

If the data is not one of these values, the test should fail... why would w=
e skip it?

Thanks,

M


>> +	}
>> +}
>> +
>>  //#define PMT_CRASHLOG_TRIGGER_ENABLE 1
>>  #if PMT_CRASHLOG_TRIGGER_ENABLE
>> +/*
>> + * Triggering a Crashlog requires a power cycle to return the device to=
 a
>usable
>> + * state.
>> + * This is very disruptive and doesn't necessarily verify much more tha=
n the
>> + * current set of tests.
>> + * Commentting out the trigger, consumed, clear path for "normal" testi=
ng.
>> + * Compile flag so these tests can be done expclity.
>> + */
>> +
>>  /*
>>   * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>>   */
>> -static void test_pmt_crashlog_trigger(int dev_fd)
>> +static void test_pmt_crashlog_trigger(int dev_fd, size_t pmt_dev)
>>  {
>>  	char buf[64] =3D {};
>>  	u_int32_t *val;
>> @@ -408,10 +480,10 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>>  	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> -		trigger_fd =3D bmg_info[i].trigger_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		trigger_fd =3D crashlog_info[i].trigger_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* make sure the bit is clear */
>>  		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> @@ -431,7 +503,8 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>>
>>  		val =3D (u_int32_t *)buf;
>>
>> -		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +		igt_assert_f(*val !=3D 0xdeadbeef && *val !=3D 0xba0b6afe,
>> +			     "0x%x: invalid trigger value: : 0x%x\n", guid, *val);
>>  	}
>>  }
>>
>> @@ -439,15 +512,15 @@ static void test_pmt_crashlog_trigger(int dev_fd)
>>   * After a crashlog has been "consumed" (read), setting this bit can be=
 done.
>>   * Verify that it is set correctly.
>>   */
>> -static void test_pmt_crashlog_consumed(int dev_fd)
>> +static void test_pmt_crashlog_consumed(int dev_fd, enum pmt_device
>pmt_dev)
>>  {
>>  	uint32_t guid;
>>  	int fd;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		fd =3D bmg_info[i].consumed_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		fd =3D crashlog_info[i].consumed_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* check, set, verify */
>>  		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> @@ -460,12 +533,12 @@ static void test_pmt_crashlog_consumed(int
>dev_fd)
>>
>>  /*
>>   * Test the clear crashlog bit. After setting the crashlog data buffer =
should be
>> - * set to 0xdeadbeef.
>> + * set to 0xdeadbeef or 0xba0b6afe.
>>   * BMG supports writing "1" to the clear file, but writing "0" (DISABLE=
_MSG)
>to trigger
>>   * file is the "standard" usage, so test that usage.
>>   * This bit cannot be cleared by software (i.e. reboot required).
>>   */
>> -static void test_pmt_crashlog_clear(int dev_fd)
>> +static void test_pmt_crashlog_clear(int dev_fd, enum pmt_device pmt_dev=
)
>>  {
>>  	char buf[64] =3D {};
>>  	u_int32_t guid;
>> @@ -476,11 +549,11 @@ static void test_pmt_crashlog_clear(int dev_fd)
>>  	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		clear_fd =3D bmg_info[i].clear_fd;
>> -		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> -		trigger_fd =3D bmg_info[i].trigger_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		clear_fd =3D crashlog_info[i].clear_fd;
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		trigger_fd =3D crashlog_info[i].trigger_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* make sure the bit is clear */
>>  		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>> @@ -496,39 +569,45 @@ static void test_pmt_crashlog_clear(int dev_fd)
>>  		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>>
>>  		val =3D (int *)buf;
>> -		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef || *val =3D=3D 0xba0b6afe,
>> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>>  	}
>>  }
>>  #endif
>>
>>  /**
>> - * SUBTEST: pmt-bmg-all
>> + * SUBTEST: pmt-api
>>   * Description:
>>   *   Because of how the Crashlog Instances behave, these tests are orde=
red.
>Do not use them
>>   *   individually unless you understand the underlying HW behavior.  Be=
cause
>of this behavior,
>> - *   all of the test will be done in order in one step.
>> + *   all of the test will be done in order in one sub-test.
>> + *
>> + *   Crashlog will cause the GPU to be in an un-useful state.  Reseting=
 to
>recover
>> + *   is not yet fully defined.
>>   *   NOTE:
>> + *     o PMT file info is accumulated from successful tests and is used=
 in
>sequence
>>   *     o Testing MUST be done after a cold reset
>>   *     o Once crashlog is triggered the device behavior is undefined an=
d
>requires a cold reset
>>   *
>>   *  Test category: functionality test
>>   */
>> -static void test_pmt_bmg(int fd)
>> +static void test_pmt_api(int fd, enum pmt_device pmt_dev)
>>  {
>> -	test_pmt_directories(fd);
>> +	test_pmt_directories(fd, pmt_dev);
>>
>> -	test_pmt_telemetry_files(fd);
>> -	test_pmt_telemetry_read_data(fd);
>> +	test_pmt_telemetry_files(fd, pmt_dev);
>> +	test_pmt_telemetry_read_data(fd, pmt_dev);
>>
>> -	test_pmt_crashlog_files(fd);
>> -	test_pmt_crashlog_error(fd);
>> -	test_pmt_crashlog_enable(fd);
>> -	test_pmt_crashlog_rearm(fd);
>> +	test_pmt_crashlog_files(fd, pmt_dev);
>> +	test_pmt_crashlog_error(fd, pmt_dev);
>> +	test_pmt_crashlog_enable(fd, pmt_dev);
>> +	test_pmt_crashlog_rearm(fd, pmt_dev);
>> +	test_pmt_crashlog_inited(fd, pmt_dev);
>>
>>  #if PMT_CRASHLOG_TRIGGER_ENABLE
>> -	test_pmt_crashlog_trigger(fd);
>> -	test_pmt_crashlog_consumed(fd);
>> -	test_pmt_crashlog_clear(fd);
>> +	test_pmt_crashlog_trigger(fd, pmt_dev);
>> +	test_pmt_crashlog_consumed(fd, pmt_dev);
>> +	test_pmt_crashlog_clear(fd, pmt_dev);
>>  #endif
>>  }
>>
>> @@ -536,25 +615,29 @@ int igt_main()
>>  {
>>  	const struct {
>>  		const char *name;
>> -		void (*func)(int);
>> +		void (*func)(int, enum pmt_device);
>>  	} funcs[] =3D {
>> -		{ "pmt-bmg-all", test_pmt_bmg },
>> +		{ "pmt-api", test_pmt_api },
>>  		{ }
>>  	}, *f;
>>  	int dev_fd;
>> +	enum pmt_device pmt_dev;
>>
>>  	igt_fixture() {
>>  		uint16_t dev_id;
>>
>>  		dev_fd =3D drm_open_driver(DRIVER_XE);
>>  		dev_id =3D intel_get_drm_devid(dev_fd);
>> -		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on
>BMG GPU\n");
>> +		igt_require_f(IS_BATTLEMAGE(dev_id) ||
>IS_CRESCENTISLAND(dev_id),
>> +			      "PMT supported on BMG or CRI GPUs\n");
>> +
>> +		pmt_dev =3D IS_BATTLEMAGE(dev_id) ? PMT_DEVICE_BMG :
>PMT_DEVICE_CRI;
>>  	}
>>
>>  	igt_describe("PMT access and API testing");
>>  	for (f =3D funcs; f->name; f++) {
>>  		igt_subtest_f("%s", f->name)
>> -			f->func(dev_fd);
>> +			f->func(dev_fd, pmt_dev);
>>  	}
>>
>>  	igt_fixture()
>> --
>> 2.43.0
>>
