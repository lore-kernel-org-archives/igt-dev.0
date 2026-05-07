Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A63CD37A7
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 22:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8C410E120;
	Thu,  7 May 2026 22:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ps8PFhZM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694D510E120
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 22:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778194675; x=1809730675;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xnRbIxAKOegWw/sgF3OoV2OGSDggL1uwbdKzwl1/6GY=;
 b=Ps8PFhZMDPRAKxB/Yx+TZS7dBorEOT5Vd0aZkc4zcqLJMJCcYJSEODCK
 470YvDdoZEzOlvCJGPfgh6B5OF7vJ3O4t+WTXW9H6Gjs2GkH8NHwXYKEQ
 sCgWGSJgWjOIXiBhm9HTuDADoXgy2QECQR2siTOIfe9bC3YDUfknHTSjM
 +I8Un7gmdWjsGPtgy2O8BeNEN2Fz++f6BRr3e71lnKbsYp2AbTSmxFN/y
 hFAZSqwzsgPJwhb56Z5S/sf8sHRtQmTDLiN5KucD7mo7EB51SUKN0/dKP
 JRZ5AMoaHRWYsF5d1rhoNo8cCK0wkTHecZabSj84M4yrhc1CW+ebrlEH2 Q==;
X-CSE-ConnectionGUID: R2/ChZqMQJSX+qDhODqqbQ==
X-CSE-MsgGUID: +LppDBJDSe+jqzT2a2uWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90262407"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="90262407"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:57:54 -0700
X-CSE-ConnectionGUID: O7or598zRwWWeWlZGT/Zkw==
X-CSE-MsgGUID: VGFS0cluTry2X6/U47GxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="240589319"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 15:57:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 15:57:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 15:57:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 15:57:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGSnWCsmz19Foqljq/kDV0LjdM52Owdi7xF3ekLabFmkQPqPaoUzQLaTHkhxLJ+ugQl71px8AE4n+VJ5gYdSVY2WIxq6L/WLcsY0QSZmckDzKok2iOpmc7wbF/nOpPDzPJrH+7wf1/8u8CsrEPe9AMeIFlhNpEJnQpyb9WRgEleIN5K7W903tL8OIQU6/B6cydZjFNv2rRcEfG9xxbScbgrqnN6TjH+cr0b5JBV+YhBDI/W0IgA13lss7v8LmhSHJO9RTYYzL/if22udVYQD2d75WKvZduJwm32pi3QlWvo2yg0/mIgMG8b7tYP25O8mMEKjd5coGlWOlQb8RChc/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnRbIxAKOegWw/sgF3OoV2OGSDggL1uwbdKzwl1/6GY=;
 b=IOXN31hL8XYw/ghXCpt6QNdTh7O8Xq12X2WEPNxG/1UvF0Nxw8KKh+z4wtoDRsDrZBRcsh5auPphatqjKfnqGWINSVXpDdsp6kkHSYKDKyULYkvQrcVv0eDsSaWSpaMsgoGLWPd/r3Xac2NFy1dzDKuXsdOnDF/DxFc+1+PiZslO6/6gknhbrW2RDIjzn6vqrissxGb5Cx80MZOFHn96RBUPBYIhqaKX3QdPFvejr+AD8eazp1GuwgBhsGOKSx2wP+0RxbGTtDrfArpPU1SrBcoJwloBPD6fsj1MRpqfSeWMLg4p4fOvzWuTxvQXALI1ERABwhHqC9S/cHEEJdUO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ0PR11MB5151.namprd11.prod.outlook.com (2603:10b6:a03:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 22:57:49 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 22:57:48 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Wang, X" <x.wang@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 3/3] tests/intel/xe_exec_reset: Add multi-queue long
 spin tests
Thread-Topic: [PATCH v2 3/3] tests/intel/xe_exec_reset: Add multi-queue long
 spin tests
Thread-Index: AQHc3nPzHMbgWhkCdUiNfy8/Ri5xILYDLOwA
Date: Thu, 7 May 2026 22:57:47 +0000
Message-ID: <e86c5d759c369b7727d87ec57bedce34c259bf75.camel@intel.com>
References: <20260507225024.4544-5-niranjana.vishwanathapura@intel.com>
 <20260507225024.4544-8-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260507225024.4544-8-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ0PR11MB5151:EE_
x-ms-office365-filtering-correlation-id: 08de125f-644c-4514-d27e-08deac8c0f02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: UjtZ/V46QKKjTIbvvzQnnvVodrWbm2iSqOmPZPVNZ12LNqrPLnoh9gkdrbyFZwtuqxFPD6Fqv0Q+jDuE3H4JYElUTIWDnH5LQ5ORQcL4pWDtd3WsUxYo9lDFtkMhfKGzGru4VjMtjBh4YVglSMRtzhqtsV27Rei2BUh+VoondkCYvYKdqsj63fWeGIobBgRX3RswWrsyobZHMXm8pJ6dpvyKBMM/B1Jz6eVvtN7fJ3mZNClTe6L3VM7LrwOAHgCoA3SqmM1Mi6Oq9GExoCxgPRLgpSRCNSfCqsvLv1Haz0pmdz1ko0mH+uwT/XqvD36/UHt/lK5owkf4OwB0XZ0jlGmXcUQxCFhkB+EvEMsbIDRQ17A3Rlq0gadkz+NxOvVXlgqDKLudpwSCfXXapgiA1CM37eyytJLvgSfrQd9tH/wnuBAtaPY7IgvmY+cNuV3N1nCgkan7EieBM/UCxP2xpO1Hktx+Gk1/5DdK9EL3sDj3oD3XnN5tnMvAf8jhtdEQW4LCfM5sYoYZ5bIAVudnGVgNhYIFfv8Rh808gLMtMdnabsqo0H/skArapNsIPQBFPzW8X1NkwLNDcYXjCl022APXmI48lKHZSognI2e7NjaOOZJA/IdBIpxa2nEezafVFnG1fVwpdWzK/f5hRS/8sJQJJa5hD4nz32rOIYtvcoSviIjO0PPGIpJ2rZG4B9MuVZhxcPDt1KsZRroWMT5WAyi73F9FJKOoNmrFpvfvLsQfmNZBNlXgwiK/fgp6rmRy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWl1eGZpN0FWdXRKY2EwbVZYak1MdWQ4dktWT2FHamJ1RnI4bVhVWVdTbHlE?=
 =?utf-8?B?bWZvN3VCOEJ2K0RWQ01UVmk0L3cxeGhQci9LRjZsYTdUOVlqWXpaejg2QTZm?=
 =?utf-8?B?SUNHTE9GNkxGMHRSMzhWTFBaNVY4YWJNdjEvRDhpTFJFaW5VOHNPb3A4THlz?=
 =?utf-8?B?NVdVZHA5Q1VLT1N6UncxbDFHaFcweGRkUi9TN0pSYTR5UGI0ZlEwTHNjMDVz?=
 =?utf-8?B?RUhDMGpIL3YxT0YxY2xUZXFRVHZIa2NwdEpyMENaUGp6eWFhY0Y1V2J3N1pr?=
 =?utf-8?B?RXBhZ291Z01RUkNjbTBJSDNvbHNoSkphTFJ6ZzJPRDU5WldXVERJWUlqclR2?=
 =?utf-8?B?ekFQVTdFVkpUNlpMcEJMQ1kvRDduOTBtMEM3TTA5YWtoNWUvTjIraG5jMk01?=
 =?utf-8?B?ckp3UnNwVW5ZT0FzdmcyRlJSNysvcE15cEl1OXFEWnY1a3dRem0wYWEzTUp4?=
 =?utf-8?B?eG9IWkQ2M04reHVHTjJXeG0rNzJpeFJ1UzRwY0V6WUlJWExLMlZ2ZU1GUHVL?=
 =?utf-8?B?RGgrV2ZwdkYxU0N4UTgvN3hnUTNESkhibFRwdGltTVE5Zml1LzJGQnZ0N3dY?=
 =?utf-8?B?dnhPcFBxTE5hQzQyREcweDRBZDBMN2ZXR2NVUTVYTTQrbk9POC9qYlQySTh2?=
 =?utf-8?B?RzJIUW5IRGZWaXNXY2luNE1oRlZZQ3RVZWlRMUxKcTcxQWIzQ0JGTXNmOUp6?=
 =?utf-8?B?bUl5UndNeVJuYWFSMkVwb3c3S1FlVWxzY3lkSEtDNEhFc0JyM1FaQlAybzJK?=
 =?utf-8?B?V1J0ZkY1L081bXBoem1ET1dzcC95aDNoT21LVWVqSzFUWUJZQkdRZXNNSzR4?=
 =?utf-8?B?dm5oZWVBQlJMeVoreW5TT0R0Y1N3ZVgrdUl2UTlHNG5CTkxZVzZvaFErVmcy?=
 =?utf-8?B?R3NyeEV1Zml5ZlpsbjB0MU1idkVWWnN2dmtLKytBMkxuVERGNkd0ak1GMWhL?=
 =?utf-8?B?eXhpenAyZVdpWXNsZ3pqaHRCcG1TODc2TS9UVkZUN25zNnpjVzZsSUNua0Nz?=
 =?utf-8?B?cm5FdEIxZUZXd0FMcVJoSXVaRlU4dEY3eGEvS3BOcHFQUGwwbEMyTmRicEpG?=
 =?utf-8?B?aEJ6V2hCN1VtbE9BVURtM2NFMTRBcUZoNU5zQzNxb3BSYnpjR3l4VTc4Y2s3?=
 =?utf-8?B?eDFLV20xTTRPTTErSGoyeDNyLzliM0VzaXVhbExlSjhhakJwa2xoZVpzNkFY?=
 =?utf-8?B?QVdyZXdSa3lPdWl1VjM4bHQ2Ly84VzBVWW1wS0pkZUlFSnRHMW1PYzJKYURU?=
 =?utf-8?B?VUEvcW8rbHNVWkt0QVdoOTV2b2UwL1BRYlJRc0oxRkRCaU1QeldabVN2VUJ1?=
 =?utf-8?B?OEhvbko3dkpQc0lNcmZ2dUF3aXZ5Njh0V0tTaExhMVc1UVFRKzBhZnc3eVVK?=
 =?utf-8?B?NDFqd0J2UHpvZkpKSXlhSnZ2d2wzcVlDUThUbUFDc3JvUEJnQXQ4WmYxL09o?=
 =?utf-8?B?c1ZOSWNIdWRtVVJ6aDVtUXNUSDkyMUQ1VEpvdFk5NXhXdXlRV3R1T3JpNUhV?=
 =?utf-8?B?RmJ0RVZmMjNZSStKeTJPKzFDaW1QWnpTcUJxUXRkUG1JdjhRWkdoS1lwMUpy?=
 =?utf-8?B?WmJIRTlJNzUxbEJDd3VPR1RJZ3lWb1pEaXhwSmJHVk1YYzVFTW9QRElZTmQx?=
 =?utf-8?B?Y1UzdVB3ZjllWXpVU3JSV3lXZ29ydEo2WjhlWnIxc1B4MG55N2dFOXhIVTE5?=
 =?utf-8?B?cGpsSkpMQ3ZidVRIQ2hoZHhDRlNkS0hhRHcvSVlSZVUzSmhTVmZEbGFRZHBq?=
 =?utf-8?B?aHltNW85VDN2R0xIREtmc3Yra1lrdXlPL1BUcm9GMDdpVG9NbVJoaWtlY01w?=
 =?utf-8?B?eGdyaEE3WkNWdCtZcTJYbE9KRDJRZC9ZU2tmVnU1Q01idTZ5ZWZ2UGhtRENx?=
 =?utf-8?B?MDFDMitSbGgwSGRqN2hOQjVlWGQrM1BSYVl0VzJrSVY5Yk0rMktmOTk5STcx?=
 =?utf-8?B?a201UzFYRFFlMzdyemIyWTAvdm9VOFdEMCtXS1o5K2FUQ1k0UmRaNWtUV2Qw?=
 =?utf-8?B?N1QrbTBudVlNODgvY00wVXBuMGwrVkUybWhqUUpaTTYraFlRTFgwbjUvdENV?=
 =?utf-8?B?MWVobEVsVlNEZllnYzVJNXBJYjlqMElpaWl1MnphUFozcTlNcFptdTkrU2Vx?=
 =?utf-8?B?Z1pLTVBHZGZxMDdLRzBPNlVyZUt6dTVpbkkrWk5xaHptc0JtVXhxSlBOcHBM?=
 =?utf-8?B?UkU1R0duSENvOW1JUUZRd2tCaE9RRjIzZnBldkRDS1BXWS9FUG9vZ2I0NHJi?=
 =?utf-8?B?UGh6dW5Dejlyc2t6N2lsWHJOS2tJMU13ZXlyYmZiVWkyVjY4VVJPQW5jTnY5?=
 =?utf-8?B?SnhkVHR1eldXTDRDYVBqcjZFLzcvRDBpYk9Qak5RbVQ4UUhNMHp0VTlWem11?=
 =?utf-8?Q?gWu8DgFqpRA1SLZM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC2E0527A44F79488C67991464D9FEBE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tcQ1PCPQ40+VrUQ00iTedme7N4R7dg5Du0NMwfjpMWHF72x+FZ2b7hiiUf8QjgQMNNXFLdBxuD+aqYAvb1nM5rcO1y9KWEpAnY3ur889hg5HdLU9pTDkWaH0BxwXQd3HJmzvJ8HimkqcW9FbD+Sv6BQU9aScFFNQR5xBYBCPOQe1UUmMabsV4fpB2+wqdAI1O0zxN4ybZUM35XIzxiAxAj4jy49fYsrHGD2Y07IYgJUkUIz7nqKZEDiix1DgkjMUaHT3aOnbhZDQvFPe941yF3aykk5GwFPpJZlJsoyCn1//HJtXxqoVpr0nzKA6BUCwXYJakg3eHbEi2UVSd6S9ag==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08de125f-644c-4514-d27e-08deac8c0f02
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:57:47.9875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q8KoiAEj8ogGkiiF5qFP8b7y4zdga/I5dkwz3/8o/qDF7siPSd7hBANZsls/hqs/YBoHLPUMpvReTK7aabnKa/W+FwT8hHvfAgIrOJvBq5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
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

T24gVGh1LCAyMDI2LTA1LTA3IGF0IDE1OjUwIC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEFkZCB0aGUgZm9sbG93aW5nIG11bHRpLXF1ZXVlIHRlc3RzIGFuZCB1cGRh
dGUgeGVfbGVnYWN5X3Rlc3RfbW9kZSgpCj4gZnVuY3Rpb24gdG8gdXNlIHF1ZXVlX3RpbWVzdGFt
cCBhbmQgbXVsdGlfcXVldWVfc3dpdGNoIHNwaW5uZXIKPiBvcHRpb25zCj4gZm9yIHRoZSBtdWx0
aS1xdWV1ZSBzY2VuYXJpb3MuCj4gCj4gbXVsdGktcXVldWUtbG9uZy1zcGluLW1hbnktcXVldWUt
c3dpdGNoCj4gbXVsdGktcXVldWUtbG9uZy1zcGluLXJldXNlLW1hbnktcXVldWUtc3dpdGNoCj4g
Cj4gdjI6IENoYW5nZSB0ZXN0IG5hbWUgYW5kIGFkZCBkb2N1bWVudGF0aW9uIChTdHVhcnQpCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxuaXJhbmphbmEu
dmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8
c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgoKPiAtLS0KPiDCoGxpYi94ZS94ZV9sZWdhY3kuY8Kg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArKwo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19yZXNldC5j
IHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfbGVnYWN5LmMgYi9saWIveGUv
eGVfbGVnYWN5LmMKPiBpbmRleCBmOWJkNWJjYjYxLi5iNzA1NDc1NmNkIDEwMDY0NAo+IC0tLSBh
L2xpYi94ZS94ZV9sZWdhY3kuYwo+ICsrKyBiL2xpYi94ZS94ZV9sZWdhY3kuYwo+IEBAIC02Nyw2
ICs2Nyw4IEBAIHhlX2xlZ2FjeV90ZXN0X21vZGUoaW50IGZkLCBzdHJ1Y3QKPiBkcm1feGVfZW5n
aW5lX2NsYXNzX2luc3RhbmNlICplY2ksCj4gwqDCoMKgwqDCoMKgwqDCoH0gKmRhdGE7Cj4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9zcGluX29wdHMgc3Bpbl9vcHRzID0gewo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLnByZWVtcHQgPSBmbGFncyAmIFBSRUVNUFQsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5tdWx0aV9xdWV1ZV9zd2l0Y2ggPSBmbGFncyAm
IE1VTFRJX1FVRVVFLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAudXNlX3F1ZXVl
X3RpbWVzdGFtcCA9IGZsYWdzICYgTVVMVElfUVVFVUUsCj4gwqAjZGVmaW5lIFRIUkVFX1NFQ8Kg
wqDCoMKgwqDCoCgzICogMTAwMDAwMDAwMHVsbCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC5jdHhfdGlja3MgPSBmbGFncyAmIExPTkdfU1BJTiA/Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bpbl9uc2VjX3RvX3RpY2tzKGZk
LCAwLCBUSFJFRV9TRUMpIDogMCwKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19y
ZXNldC5jCj4gYi90ZXN0cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmMKPiBpbmRleCBhM2NmMjkwYWJm
Li44OWE0N2QyMzZmIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYwo+
ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfcmVzZXQuYwo+IEBAIC0zMzAsNiArMzMwLDEyIEBA
IHRlc3RfYmFsYW5jZXIoaW50IGZkLCBpbnQgZ3QsIGludCBjbGFzcywgaW50Cj4gbl9leGVjX3F1
ZXVlcywgaW50IG5fZXhlY3MsCj4gwqAgKiBTVUJURVNUOiBsb25nLXNwaW4tcmV1c2UtbWFueS1w
cmVlbXB0LW1lZGlhCj4gwqAgKiBEZXNjcmlwdGlvbjogVGVzdCBsb25nIHNwaW5uZXJzIHdpdGgg
bWFueSBwcmVlbXB0YWJsZSBqb2JzLCB1c2UKPiBxdWV1ZXMgYWdhaW4gc3Bpbm5lcnMgY29tcGxl
dGUgb24gbWVkaWEgR1QKPiDCoCAqCj4gKyAqIFNVQlRFU1Q6IG11bHRpLXF1ZXVlLWxvbmctc3Bp
bi1tYW55LXF1ZXVlLXN3aXRjaAo+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCBsb25nIHNwaW5uZXJz
IHdpdGggbWFueSBqb2JzIHdpdGggbXVsdGktcXVldWUKPiBzd2l0Y2hpbmcKPiArICoKPiArICog
U1VCVEVTVDogbXVsdGktcXVldWUtbG9uZy1zcGluLXJldXNlLW1hbnktcXVldWUtc3dpdGNoCj4g
KyAqIERlc2NyaXB0aW9uOiBUZXN0IGxvbmcgc3Bpbm5lcnMgd2l0aCBtYW55IGpvYnMgd2l0aCBt
dWx0aS1xdWV1ZQo+IHN3aXRjaGluZywgdXNlIHF1ZXVlcyBhZ2FpbiBvbmNlIHNwaW5uZXJzIGNv
bXBsZXRlCj4gKyAqCj4gwqAgKiBTVUJURVNUOiBndC1yZXNldAo+IMKgICogRGVzY3JpcHRpb246
IFRlc3QgR1QgcmVzZXQKPiDCoCAqCj4gQEAgLTExNzksNiArMTE4NSwyMyBAQCBpbnQgaWd0X21h
aW4oKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTVVMVElfUVVFVUUpOwo+IMKgwqDCoMKg
wqDCoMKgwqB9Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqBpZ3Rfc3VidGVzdCgibXVsdGktcXVldWUt
bG9uZy1zcGluLW1hbnktcXVldWUtc3dpdGNoIikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgeGVfZm9yX2VhY2hfbXVsdGlfcXVldWVfZW5naW5lKGZkLCBod2UpIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2xlZ2FjeV90ZXN0X21v
ZGUoZmQsIGh3ZSwgNCwgOCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExPTkdfU1BJ
TiB8IE1VTFRJX1FVRVVFLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTEVHQUNZX01P
REVfQUREUiwgZmFsc2UpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgYnJlYWs7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiArCj4g
K8KgwqDCoMKgwqDCoMKgaWd0X3N1YnRlc3QoIm11bHRpLXF1ZXVlLWxvbmctc3Bpbi1yZXVzZS1t
YW55LXF1ZXVlLXN3aXRjaCIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2Zv
cl9lYWNoX211bHRpX3F1ZXVlX2VuZ2luZShmZCwgaHdlKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV9sZWdhY3lfdGVzdF9tb2RlKGZkLCBod2Us
IDQsIDgsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMT05HX1NQSU4gfCBNVUxUSV9R
VUVVRSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMT05HX1NQSU5fUkVVU0VfUVVF
VUUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMRUdBQ1lfTU9ERV9BRERSLCBmYWxz
ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVh
azsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICsKPiDCoMKgwqDCoMKgwqDC
oMKgaWd0X2ZpeHR1cmUoKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX2Ns
b3NlX2RyaXZlcihmZCk7Cj4gwqB9Cgo=
