Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC73CA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 19:43:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C5B10E211;
	Thu, 14 Aug 2025 19:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fY5cQDHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAFA10E211
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755200585; x=1786736585;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CMAx+HfezX08wV3ahqqrZ85bl+PkAb05tBa0+MUG1iA=;
 b=fY5cQDHmbBg+bPHB28fapzXbdSb4bTLUALEiwGi5/F1Ov7vEqDeGNGTr
 UWnSKwPOPECCju+PpF8pGmCEmQOrjexKftyEgiNrwzhShMCmg1sr/YDXQ
 wp/GW1ATMSVgwTooMMs7i8PkFGftYefMqmc2pMTcmlhVM1pWX4AMKJGn9
 HmFPE1wzGQHKoAs6Ab9IERo+ugDDuqFOmHfVHQKqzkz4ENGUONjfa5d8x
 amvHgba9YjJvTxEI0QOmPtNtWsfmyUHZXTuMKB9REip08kad2sY78C+I3
 UbheCBXUY3v/h3nU9mIMSALm7paUKXO3EUtJRJtlmOutVW5mk1OZBM3Tl Q==;
X-CSE-ConnectionGUID: VUkghOCxQam3JglHft9GSw==
X-CSE-MsgGUID: JvfYhTGWSj6qEMrYUnAY8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57600410"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57600410"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:43:05 -0700
X-CSE-ConnectionGUID: Myax6JeSROKRDWjhgqy3nw==
X-CSE-MsgGUID: vdbt7KU9QYq3RDeltuH8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="197832118"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 12:43:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:43:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 12:43:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.72) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 12:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REV8wWrs1t8/pQf7AiAvPEb/oriM4i6v1S7IEmnZvUNeO5Imnz9wsR6YrMTVyH0NbA7mBMfJ8fmHErroqu2et3lS+zNXZYue5ocODoQJ+ZPC0sGIRQCWFeuE57oCUlt0K4JKn2Qg49rYNH1hMp0Qi3njxjtZEmZjKRjSutcOp4LzxTYyD0cW0d2vg9LqIaeasPgSdlrECXX1NS+eQ7Dv+d03NeGRdr1t9cW3oYX6rXiKMAh60Dsa26tyhJTDZDSkdHIKOb2c9gxmWEvWuJUofnYsU2rZiLkEeDmUzbAX0t6+AX9SpT3f36pofilfYX0NKpWItjdGyoZl5oEHXJz0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMAx+HfezX08wV3ahqqrZ85bl+PkAb05tBa0+MUG1iA=;
 b=yrY+mvuKqALWIwCrza0uCHK6usyocNn8mU4YOY+RtFVeYRzV9NNApreq/XaY2G9x12sER3dPrpe0WycjTVhVjLfZHXsxJ5sn5H74dnVtR86yW72n6MvlS+qKa+0qWYZwYhwaQDQa+KqmrNPwsCrq4GNlTRYyrCqEpYgQ3W23uiwKEu7XABWOgbCxaQ52m/jDMB02McdvOzF8IZDRqzzAbJdwDkAyifKZqpWMk6Zce5ROP9XI3kVm/NJsj4BQkeIZc04xORdB/Ij8n3OyN+R/cskUDqYePcnksq6T6SLvXG4O24m/G2IRssEpJBRmB6SdEnJw9BXe8NDQgUkZqXwAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH7PR11MB6402.namprd11.prod.outlook.com (2603:10b6:510:1fa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 19:43:01 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 19:43:01 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Topic: [PATCH] lib/xe/xe_spin: Add additional MI_ARB_CHECK to
 preemptable spin init
Thread-Index: AQHcDUxS8k/xk7we/E2ZAKCRd3s/BLRigh0AgAAA5sCAAARqgIAAAvRQ
Date: Thu, 14 Aug 2025 19:43:01 +0000
Message-ID: <CH0PR11MB54440D656813901A670CCE7CE535A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250814185009.52614-2-jonathan.cavitt@intel.com>
 <aJ4zZki709mmqtbV@lstrano-desk.jf.intel.com>
 <CH0PR11MB544476B570A9C0B2BB2CECA4E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ432wBs0B9fhINb@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH7PR11MB6402:EE_
x-ms-office365-filtering-correlation-id: 77460b1a-6724-4774-7536-08dddb6ac731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bDVJR050cEpwZnRpdWRraG9kYjdiRWI5K0JxbGRaUG11c3FvdGNFdTBEVll5?=
 =?utf-8?B?RkhYcThXUllZNForL2ZCNE5hdElnaStTVCt1eW9lZ2JsYityOUF3SWZSSWNT?=
 =?utf-8?B?VU80a0JzcVNPWWp0MGR6cEJ0SG5xdFl2TjZyMVdWZ0VQL1dDR25xdEE0UjVx?=
 =?utf-8?B?Rm9hVkVhTElYVjBSTWg2eENKV2RYZXBNRktFVUhHZ1A2bHpBbmlKR2ZBZVhz?=
 =?utf-8?B?cjFsaWd2U3B0dkNHNXh4UFpqOGxJTTkwU2JaS3pXcEtmdFhoTktSOGxWSE1R?=
 =?utf-8?B?ZjdTemMzT2tSR1VFZW5kTXN5UkJ6Z3V1NTR0VnNuWXFkSk50RVpDdlIyRTBh?=
 =?utf-8?B?RlZZWUJKL0JCaXVIQTRjMXkyVXpVUzdmUTJ0YmhwcmdVU0xNWDM5UHJMUDg2?=
 =?utf-8?B?WlZ2MFRTZWd6a1ViT00xYzNXMUdCWHVtS2JjZmtXekJRUldrWWlkaEtScFE5?=
 =?utf-8?B?YURTMGlwVmtxbS9qTjhCKzV2Rnh5QTVQQ1gxL3BrWG41R3d5STV6ZnVVNFhv?=
 =?utf-8?B?QmJQWTN1dVdpcURvSktyZjloUGMvNHBiRXNVVHlCeVlRK1cvMW02K1BjYUxn?=
 =?utf-8?B?Wkk4QWF0bUM5VERhVjlQRHZQLzVSN0dXSEJJM0dnQ0d6TGlnRHpYRVA1Nm8x?=
 =?utf-8?B?a2EvTmxyMTFiSDZpajVHc3B1ck0xb1B0SitGbi9zRS81UjFRa01NSmZHdTY4?=
 =?utf-8?B?dldhWlhteHNhRUNvUHQveTRQdkxOSU9NQlhFLzZqaHZ1WnU0Y0JNa1REUm5L?=
 =?utf-8?B?bWtlb1BEd05RZm5SQysrUHB4NkpuUGNROXJYdzRSTHVPbHRhQVVpKysyeWlh?=
 =?utf-8?B?RkNLTis2VG1ldEhqUmMxWUVlTHN2QTRFLzd4ZzVEU0NwcUp2UnNTWk9EZ1NB?=
 =?utf-8?B?a1ROckhGbmllSHR3QjJPRmk3WEp6ek9Qek10VUtneXJCQVhJSEdsV051OVFr?=
 =?utf-8?B?YndqVVBYSWhraTFXTUhkWUNrVmpQK1A3Uis5RVVjQ3Z4NVZvQmNha01YZWVV?=
 =?utf-8?B?d1NPQ05MVzBYNzRzdnRPZW10QktlMlpqZWllQU1GeFdtcU1oYUdDVXo5KzF3?=
 =?utf-8?B?M3Z4dml5ZzFZQkdvR2hvSXowZ2dYY3NWZkhJU3lzdjFjL0ovNkJkcURTelZZ?=
 =?utf-8?B?dVFMbDd1RjJyYmlnTTJWeXdMMGtVMTlLOFRIbVdEejRYTTduaVRFNmRMWE50?=
 =?utf-8?B?SjdmRkE3OGZjZWlWRUdnUkFFeExQcm8wdGZSUDFjb1ZpZUQ1N0M1ejRybURH?=
 =?utf-8?B?N2IzTFZybXFuNzZpRFNkenZITERBV3lMQUlKUll6WncrM3RtNEZaaXp3VjlT?=
 =?utf-8?B?SHVEVGZ2bU15TXk0WXdodnhkNWtxZS9OVTJmdE9XL0pySjU4K05BUXdpN2xs?=
 =?utf-8?B?RWhRQloxSlVidVJTSTZZSlFZSXpHTVVNb0dZYmNwY1FWQ1FaK2V6MmxIb3pn?=
 =?utf-8?B?dG5sUjV3QkFSTlZ6U2JaUW4yWVphaUNGb3pMbnFqVENGZnBzcDdHclRDS1JI?=
 =?utf-8?B?aUUvSkJtemJaQzBCU3FHVWFLWUs3ZkpneXZVWlFLeGtUajNLNEJIaXBuQzJ3?=
 =?utf-8?B?N3B1TmJwOTViVy8wQVE4R2NSWjZtL2tIMkJyZjU1SDZoaXlGM1ZxNzBMdHNN?=
 =?utf-8?B?RmFCeWpGM2pDcWlwcVpMSWJPSTRBWHM0Q0ZiQXphc2s0UTlNREJ4VEZpMVZl?=
 =?utf-8?B?MzltdVA3VTBxa0cvS0pHSldURWdwaFY2dGxQd3lPK2Z1WXVtRkdqYWcyTVVk?=
 =?utf-8?B?Q2FFaGUvVm9RWjM0R3RVRWg0RVIxYkg2azhjUGk4VXk5Wk8vUXdPTzJaa3RE?=
 =?utf-8?B?c3VEMVErcUd3d05SM3R3UjZaYVBYSThOTXdFNllLTERaS0JRcFdmYmVWdnZI?=
 =?utf-8?B?ckZsUUpDWEZuL201dFM0VWozdE9KWEFtUDh5SUdEWlB3WkpnTDRTbWpyU05F?=
 =?utf-8?Q?y8fotXACKM4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1JITStpL3lEcjJGOWVsdTh6ZitBL1k4aXEvcU9WSGFqWjZ3Tk41a1lZZ0R1?=
 =?utf-8?B?R3RWSlNERDBPaTFEUnF2cmpBR0Nmd2ZxbFVaTWJUUU5ScVE0Z2ZzbmpRbmV5?=
 =?utf-8?B?dldVK2Q4N3g5MGg1VzN5b0U0L2NxMkg1OWg1RGNxZXBFMVR6S2hhMWFsWllU?=
 =?utf-8?B?alBHcnhQUi9UajBqSkk1R05mckhRUW5vREdDbUxkWnBQZjh0aFNFbUlPZkkz?=
 =?utf-8?B?OXJhM2ZvalN0SUFXQ0xob3VsTWt3Ry9VUUt2Sk9OclM3bUlpUGc2a1dtaSt5?=
 =?utf-8?B?d3QxUkRseFVlSVpKQWtXcXcvVk14ZSs4VEZJVVNjTFpEelN3U0w3WkVKSjBC?=
 =?utf-8?B?Umc0OFRyUE5QbHArWE9aTSszZTJ2WG5wZVluZm9OOXgyNDZUcXhIUExYcUpy?=
 =?utf-8?B?eU5EMEROV1JTY043VEpzWVhGYnRNUHQxVGlXTGxpc0tYQm5McmJKU3dOeUZL?=
 =?utf-8?B?U2toSVovbzExZEFhd3FGUWZWTmpCeVNpZ0s0YWdVeTYrd0I3Z1lYWEQrWHVC?=
 =?utf-8?B?ZVJzVDYzaVAxa3VLc0JUZEVhdzBiM1dqMjk1eVVzUENMaWxMODVlcDVsaElr?=
 =?utf-8?B?SjlzOXhXZXlkeEk2RlA2bHduMVBobzl1d1ZpeHEyd2U2cVRiUWtMZGtvUGFk?=
 =?utf-8?B?dmIvaGF1LzB4K2o1VUxmZFFaeHJZeDN6MS81WUNpclROekxpTHpxakM2QVdu?=
 =?utf-8?B?REdkZ3BYSVVFYnI4L1Y5RlZuQ0xkam80Y3JaSFdoOXNmaTVhSE5vT1ZxUE1a?=
 =?utf-8?B?S0JjdExYTlhjSmROVFhKTllPM1kwVlgyY3FPMUJGSGZ6MENkVjR4MTVKWUpS?=
 =?utf-8?B?YVlxYUh1MnEyWmJTSGtQb3dZL3VqNUc5dVQzNlUzSVptZllwVTlOdVNtdnJQ?=
 =?utf-8?B?VElRNkpSVXc5K3VMeGN1aHRJV1VtQkhDSk5lVldqOTNjV1liUGhITkdzUHA2?=
 =?utf-8?B?YlhlT09oeURuVEpZcWF6eklYanRjc2lENTdkTWhxOG5TU1g3TlBnN21YZ1RN?=
 =?utf-8?B?ZS95aGhJVENlSVdjUXlvUHBRZGgrTStuSUgwV1k1bkRmb0lPMTRBTW1jRmxM?=
 =?utf-8?B?azhNTTBzTEVLbk1ob2cyaEJmdmkzS1R2a1Zia3FMdjdNUlJoMEJwWlp1TnRz?=
 =?utf-8?B?U1dwcStDZjBacERERElrS1dZazF1SFJlQmI2OVc5bkFlYU5RM0haKzFQekJm?=
 =?utf-8?B?YWNxM0N0a3ZabWtPZGhQUkN1TEwrOUF1MEw3dVBZVzhWWjhMZ0pLdGd6ZFd4?=
 =?utf-8?B?TUJEdzllOEtYeGs2a1JMeXJyWmJLL0EydlROZTdGUTlNbkcyVUZrSWR3ZEVL?=
 =?utf-8?B?TktFQnhjYkxCZWkwYUlCMjExbFdiTkN4clBJVVkvaituaTRvZWhmQ0VTVElD?=
 =?utf-8?B?NTAwWVpMeWcvN2FQLzFvcDZaZEhaVnIrVThreXpFT2FyQjhYOVpqQWF2MTJv?=
 =?utf-8?B?VTRlNjRZMXhpZ2FKUjlvMlB6dDd2YVB6MzlWRThud0p2akJEb09QcnBwcXRx?=
 =?utf-8?B?cGVjakVnYWJnT2x3QU9ZNmNwUUpuUzlYazE0TWgxSUJSK0pISHhzcmpXMlVy?=
 =?utf-8?B?MWRHNGFYa3hZajdPSElmUnVoVXdqRmoybG5Zd2xkL3BzWGZFc2JMUUpFOUox?=
 =?utf-8?B?Wk5TTVJpMWdkMXZESTVNUHMwajk2RlB0V1ZFYkljL0xmU1hpVEk5Z2ZId25s?=
 =?utf-8?B?K1VGNWdTeVcyUEVoM281MlpkclhrMzdjWmIrdStudVRmU1dYMzV3Vy9PNHUv?=
 =?utf-8?B?YVN1ZXgvYnV4b0c3L3h6M2xrQ1RwcTE4YXQ4bHJDdHdRWXdDMDhqaU9qN04v?=
 =?utf-8?B?dkFBa1VSM3Exd2ZRdGRySWdlUGRrSU9uMUNCT2J5dUhyTUh3eVM4NjBWNDNJ?=
 =?utf-8?B?N21FcXY5MEtKYTVYVGoyQW1Ja3pUWTJ6R3VBZXdjQjdWODJPdXZhTnZ6QWU0?=
 =?utf-8?B?a29UcVJVckVEU1lCYWZwSmJjQllrTlFjdmdraEhKSi9iekRGS3FJWjF0bEw0?=
 =?utf-8?B?UDc2VEhlNUs3UHl3MExmL3NiWm1CTzRuL3doNHVvYnhSOEdtWUNocVA0SnF6?=
 =?utf-8?B?dExKZ2hzL1ZVRnRRbWJRZytOUjZaaUtFM29GaVJVZDRhd0dYelU3Tzg1aXNO?=
 =?utf-8?B?ZE05U3ljeTgzS0UvSU5uU0RFcXFud3l1Zm9WZjQwdk5kWkJuZkVDVG04RUVs?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77460b1a-6724-4774-7536-08dddb6ac731
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 19:43:01.1073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bf1PfuxIjLuAH5AirEj3Jsij8Oo9JXC+EoNjo++ku27tDVIbzJ4JUPwF9h0DmIub842+4LIJ/XYYm2ZJPrNWmQpfZ1hffBiaCxDfbkgBZZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6402
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDEyOjI0
IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCkNj
OiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnIDxzYXVyYWJo
Zy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47IEtlbXBj
enluc2tpLCBaYmlnbmlldyA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgVmlzaHdh
bmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbGliL3hlL3hlX3NwaW46IEFkZCBhZGRpdGlvbmFsIE1J
X0FSQl9DSEVDSyB0byBwcmVlbXB0YWJsZSBzcGluIGluaXQNCj4gDQo+IE9uIFRodSwgQXVnIDE0
LCAyMDI1IGF0IDAxOjExOjM5UE0gLTA2MDAsIENhdml0dCwgSm9uYXRoYW4gd3JvdGU6DQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBCcm9zdCwgTWF0dGhldyA8bWF0
dGhldy5icm9zdEBpbnRlbC5jb20+IA0KPiA+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMTQsIDIw
MjUgMTI6MDUgUE0NCj4gPiBUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGlu
dGVsLmNvbT4NCj4gPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEd1cHRhLCBz
YXVyYWJoZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0Bp
bnRlbC5jb20+OyBLZW1wY3p5bnNraSwgWmJpZ25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGlu
dGVsLmNvbT47IFZpc2h3YW5hdGhhcHVyYSwgTmlyYW5qYW5hIDxuaXJhbmphbmEudmlzaHdhbmF0
aGFwdXJhQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIXSBsaWIveGUveGVfc3Bp
bjogQWRkIGFkZGl0aW9uYWwgTUlfQVJCX0NIRUNLIHRvIHByZWVtcHRhYmxlIHNwaW4gaW5pdA0K
PiA+ID4gDQo+ID4gPiBPbiBUaHUsIEF1ZyAxNCwgMjAyNSBhdCAwNjo1MDoxMFBNICswMDAwLCBK
b25hdGhhbiBDYXZpdHQgd3JvdGU6DQo+ID4gPiA+IEFkZCBhbiBhZGRpdGlvbmFsIE1JX0FSQl9D
SEVDSyB0byB0aGUgc3BpbiBpbml0aWFsaXphdGlvbiBmdW5jdGlvbiwNCj4gPiA+ID4ganVzdCBi
ZWZvcmUgdGhlIGNvbmRpdGlvbmFsIGJhdGNoIGJ1ZmZlciBlbmQsIHdoZW4gcHJlZW1wdGlvbiBp
cw0KPiA+ID4gPiBlbmFibGVkLiAgVGhlIE1JX0FSQl9DSEVDSyBmb3JjZXMgYSBwcmVlbXB0aW9u
IGluIHRoaXMgY2FzZSwgd2hpY2ggY2FuDQo+ID4gPiA+IGFsbG93IGFkZGl0aW9uYWxseSBzY2hl
ZHVsZWQgZXhlYyBxdWV1ZXMgdG8gbWFrZSBpbmRlcGVuZGVudCBwcm9ncmVzcw0KPiA+ID4gPiBl
YXJsaWVyIHRoYW4gaWYgd2UgcmVsaWVkIG9uIHRoZSBhdXRvbWF0aWMgdGltZW91dCBvZiB0aGUg
ZXhlYyBxdWV1ZS4NCj4gPiA+ID4gDQo+ID4gPiA+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNTc4Mw0KPiA+ID4gPiBTdWdnZXN0
ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwu
Y29tPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNh
dml0dEBpbnRlbC5jb20+DQo+ID4gPiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT4NCj4gPiA+ID4gQ2M6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEgPG5pcmFu
amFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGxp
Yi94ZS94ZV9zcGluLmMgfCA0ICsrKy0NCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9s
aWIveGUveGVfc3Bpbi5jIGIvbGliL3hlL3hlX3NwaW4uYw0KPiA+ID4gPiBpbmRleCAyNWY3NTU1
ZTI3Li5iM2E5MzdmZTgwIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9saWIveGUveGVfc3Bpbi5jDQo+
ID4gPiA+ICsrKyBiL2xpYi94ZS94ZV9zcGluLmMNCj4gPiA+ID4gQEAgLTMwLDcgKzMwLDYgQEAN
Cj4gPiA+ID4gIA0KPiA+ID4gPiAgZW51bSB7IFNUQVJUX1RTLCBOT1dfVFMgfTsNCj4gPiA+ID4g
IA0KPiA+ID4gPiAtDQo+ID4gPiA+ICB1aW50MzJfdCB4ZV9zcGluX25zZWNfdG9fdGlja3MoaW50
IGZkLCBpbnQgZ3RfaWQsIHVpbnQ2NF90IG5zZWMpDQo+ID4gPiA+ICB7DQo+ID4gPiA+ICAJdWlu
dDMyX3QgdGlja3MgPSB4ZV9uc2VjX3RvX3RpY2tzKGZkLCBndF9pZCwgbnNlYyk7DQo+ID4gPiA+
IEBAIC0xNjcsNiArMTY2LDkgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNw
aW4sIHN0cnVjdCB4ZV9zcGluX29wdHMgKm9wdHMpDQo+ID4gPiA+ICAJCQkJICAgb3B0cy0+bWVt
X2NvcHktPmRzdC0+bW9jc19pbmRleDsNCj4gPiA+ID4gIAl9DQo+ID4gPiA+ICANCj4gPiA+ID4g
KwlpZiAob3B0cy0+cHJlZW1wdCkNCj4gPiA+ID4gKwkJc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0FS
Ql9DSEVDSzsNCj4gPiA+IA0KPiA+ID4gQnV0IHdlIGFscmVhZHkgaGF2ZSBvbmUgdGhlc2UgYXQg
dGhlIHRvcCBvZiB0aGUgbG9vcDoNCj4gPiA+IA0KPiA+ID4gIDcyICAgICAgICAgbG9vcF9hZGRy
ID0gb3B0cy0+YWRkciArIGIgKiBzaXplb2YodWludDMyX3QpOw0KPiA+ID4gIDczDQo+ID4gPiAg
NzQgICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gTUlfU1RPUkVfRFdPUkRfSU1NX0dFTjQ7DQo+
ID4gPiAgNzUgICAgICAgICBzcGluLT5iYXRjaFtiKytdID0gc3RhcnRfYWRkcjsNCj4gPiA+ICA3
NiAgICAgICAgIHNwaW4tPmJhdGNoW2IrK10gPSBzdGFydF9hZGRyID4+IDMyOw0KPiA+ID4gIDc3
ICAgICAgICAgc3Bpbi0+YmF0Y2hbYisrXSA9IDB4YzBmZmVlOw0KPiA+ID4gIDc4DQo+ID4gPiAg
NzkgICAgICAgICBpZiAob3B0cy0+cHJlZW1wdCkNCj4gPiA+ICA4MCAgICAgICAgICAgICAgICAg
c3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0FSQl9DSEVDSzsNCj4gPiA+IA0KPiA+ID4gTGluZSA3NCBp
cyBoZXJlIHRoZSByaW5nIGxvb3AgcmVzdGFydHMuDQo+ID4gDQo+ID4gSSB0cmllZCByZW1vdmlu
ZyB0aGUgdG9wIE1JX0FSQl9DSEVDSywgYnV0IHRoYXQgY2F1c2VkIHRoZSB0ZXN0IHRvIHN0YXJ0
DQo+ID4gZmFpbGluZyBhZ2Fpbiwgc28gaXQgbG9va3MgbGlrZSBib3RoIE1JX0FSQl9DSEVDSyBj
YWxscyBhcmUgbmVjZXNzYXJ5Lg0KPiA+IC1Kb25hdGhhbiBDYXZpdHQNCj4gDQo+IEl0IHNob3Vs
ZG7igJl0IGJlLCB0aG91Z2guIEEgY291cGxlIG9mIGluc3RydWN0aW9ucyBsYXRlciB3ZSBzaG91
bGQganVtcA0KPiB0byBsb29wX2FkZHIgKHRoYXQgaXMgbGluZSA3MyByaW5nIGluc3RydWN0aW9u
KSBhbmQgdGhlbiBleGVjdXRlIHRoZQ0KPiBNSV9BUkJfQ0hFQ0sgcHJvZ3JhbW1lZCBpbiB0aGUg
cmluZyBhdCBsaW5lIDgwLg0KPiANCj4gSeKAmW0gYWxsIGZvciBmaXhpbmcgdGhlIHRlc3RzLCBi
dXQgSSB3YW50IHRvIHVuZGVyc3RhbmQgd2hhdOKAmXMgZ29pbmcgb24NCj4gaGVyZS4NCj4gDQo+
IENhbiB5b3UgcmVsaWFibHkgcmVwcm9kdWNlIHRoaXMgaXNzdWUgYW5kIGNvbmZpcm0gdGhhdCBp
dCBmYWlscyBiZWZvcmUNCj4gdGhpcyBjaGFuZ2UgYW5kIHdvcmtzIGFmdGVyPw0KDQpZZXMuDQoN
CkJlZm9yZSB0aGUgY2hhbmdlLCB0aGUgaXNzdWUgb2NjdXJzIHdpdGggbWl4ZWQgZnJlcXVlbmN5
IChhYm91dCAxMCUpLCBhbmQgbWFueQ0KcnVucyB0YWtlIGFyb3VuZCBhIGhhbGYtc2Vjb25kIHRv
IGNvbXBsZXRlLiAgQWZ0ZXIgdGhlIGNoYW5nZSwgdGhlIHRlc3QgY29uc2lzdGVudGx5DQpwYXNz
ZXMgYW5kIHRha2VzIGFyb3VuZCAxMCBtcyB0byBjb21wbGV0ZS4NCg0KVGhlIHByaW1hcnkgY2F1
c2Ugb2YgdGhlIGlzc3VlIHNlZW1zIHRvIGJlIGFuIGVuZ2luZSByZXNldCB0aGF0IG9jY3VycyBk
dWUgdG8NCmFuIGV4ZWMtcXVldWUgaGFuZy4gIFRoZSBhZGRpdGlvbmFsIE1JX0FSQl9DSEVDSyBz
ZWVtcyB0byBmb3JjZSB0aGUgc2Vjb25kDQpzY2hlZHVsZWQgZXhlYy1xdWV1ZSB0byBtYWtlIGZv
cndhcmQgcHJvZ3Jlc3MsIHdoaWNoIHVuYmxvY2tzIHRoZSBmaXJzdCBhbmQNCnByZXZlbnRzIHRo
ZSBoYW5nLg0KDQpQZXJoYXBzIHRoZSAicmVhbCIgaXNzdWUgdGhhdCB0aGUgTUlfQkFUQ0hfQlVG
RkVSX1NUQVJUIGxvb3BiYWNrIGNhdXNlcyB0aGUNCmV4ZWN1dGlvbiBjYWxsIHN0YWNrIHRvIGZp
bGwgdXAsIHJlc3VsdGluZyBpbiB0aGUgc3lzdGVtIGhhdmluZyB0byBjbGVhciB1cCBtdWx0aXBs
ZQ0KbGF5ZXJzIG9mIGV4ZWN1dGlvbiBvbmNlIHRoZSBzZWNvbmQgZXhlYyBxdWV1ZSBjb21wbGV0
ZXM/ICBJIGRvbid0IHRoaW5rIHRoYXQncw0KcGFydGljdWxhcmx5IHNvbHZhYmxlLCB0aG91Z2gu
DQotSm9uYXRoYW4gQ2F2aXR0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+
IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiArDQo+ID4gPiA+ICAJc3Bpbi0+YmF0Y2hbYisrXSA9IE1J
X0NPTkRfQkFUQ0hfQlVGRkVSX0VORCB8IE1JX0RPX0NPTVBBUkUgfCAyOw0KPiA+ID4gPiAgCXNw
aW4tPmJhdGNoW2IrK10gPSAwOw0KPiA+ID4gPiAgCXNwaW4tPmJhdGNoW2IrK10gPSBlbmRfYWRk
cjsNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuNDMuMA0KPiA+ID4gPiANCj4gPiA+IA0KPiANCg==
