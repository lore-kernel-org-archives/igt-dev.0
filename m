Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5996CCFA13
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 19:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3810F14A;
	Wed, 29 Apr 2026 19:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hX76g/1V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B388710F14A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 19:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777490313; x=1809026313;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ngaEd9Yl/UKVThoDBPO2WSUAItLUfnwEk+V+G1oAzN4=;
 b=hX76g/1V3FHjPK1XtMcj+4SDV4TpcjWR/R/Z+3dChgPCBgSx3yTS3yDc
 PXm1kGW9hQqNhSwzbJfNC/aucrjyaxnYocKWPh97A63qHOqx3RWTbCska
 RFMOuB2iE4MzOcmMod8q3vEm7I0Q4mbmG2sDTQ24fzfXujvpFmS0yMKoD
 3vQcN5h06mevS5Fu5akpI9oGI+tjiQby+YNQIVyMI8k1kHoDVJU+z+nmY
 SIrGtcZOQZS/DHFg2pILuw97ouneDBnCqQnAEHzd8cwVf/CYvp/Vj0Idx
 1cUnNwDGroGZ2R/ga9uiaIDOzu+YkD7jO4gxlnG43UCrAW83wNMcE90dj w==;
X-CSE-ConnectionGUID: VE0vFhFSQ72nukLG1QLWUQ==
X-CSE-MsgGUID: 5Mrv/wSZSgORn9vI+YEVDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77457425"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="77457425"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:18:32 -0700
X-CSE-ConnectionGUID: T8/X7ieJS1qRzkJviNLliQ==
X-CSE-MsgGUID: J/qcECUBRx+uPdlSX3cTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233513330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 12:18:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:18:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 12:18:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 12:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLme9Bg8BIUhQI3hTDxwP2Z81QDWBXl9NO6Zv6h0NkTjRXO3RZdmV4qIh40Mv+UVZGmnrkPnhu9NJjkFk1qU4TzWhGrn7yyM1UAvIOS7j215XjWx3tY6fu9kvEEPtqNgxEGVQ3spqsVyc4vWJ9TewoO1E9ydoQSYCopctVB121H7bqhyoy7tnJoSAH1p76Sn0ykCwMi+SNzjvqFvFk1UeEUwD94NV3jTXRnuMSad/8X2M5u/XieYevpTlG1zdk4x8xCqeYJUb1+NLXcpU7tFLIfNH5JBjI9Vt1bFRgSDlPvb34XRps/LbKeUgRywRVqGaE/wqGeOTB4PZAcsvotDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngaEd9Yl/UKVThoDBPO2WSUAItLUfnwEk+V+G1oAzN4=;
 b=h5xCk8L4JfP+pE892C5QuAltlreeHxbiYlP4tpBxe2R1DVMuWmUs8aoJbx5QcaNqYAYvWyESDIBp3WFgFOYOWBpWQ1dmC9+kmzO/OvC8BWl6U3TyTSaj9zu3M6kZZ2Uo/1sougsRKNMD637bWl7ezywXUX7kyp+Z1+VIf/4EHqygjFhmgOEmqlb5dchMifImjgA9v/UQSPFh3YZLx+KCFiaAuF60QRw0Nf9Fji1N5NsgpVWoh2rggd7lCtbhGHKIHuVpyNQVu5UQsu6HI4pYZbJ9X1zWXBHYe3LoYxIube+fVNq0X28uL6FYxIgKkgqUU2d4WOcSbEXcvTOa/9CJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB6466.namprd11.prod.outlook.com (2603:10b6:208:3a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 19:18:27 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 19:18:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Topic: [PATCH 1/2] tests/intel/xe_exec_multi_queue: use timestamp to
 check job start
Thread-Index: AQHc1309VGUC2aXNLUaRDf8fVMyJPLX2auyA
Date: Wed, 29 Apr 2026 19:18:26 +0000
Message-ID: <ac12c5478231abf50662c7e1f4451e58c8742330.camel@intel.com>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-5-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260429020856.1857656-5-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB6466:EE_
x-ms-office365-filtering-correlation-id: 9222efdc-9ad5-4868-49b3-08dea6241708
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: hWF3juzRGJyhcgpkbIDvSorcYD5Rvo9g/hIV1XR5L+KHTLL6RlSA8so0PixBIQp5OKVUHqq58ugnmxshX56V5AiG1DPkPURfRA+KEgXgfy3WYa2agnk7rw7io81ikMvM3V5SGez4BQQq3O0xhg4tGLz93S/QwXMRpC0ureLdm40gpskQp1fW+cW8v0V91gjaGmCtUxeAKe2fbi5yyaP8FZUlP1+6KcypFKUullKr3jM0I5hyzx+W0lsBdm2NCgMp36U1iNQQ0tbbpsl7bvEYWPi4Cwsp0ptfwMe/hM3q4mWr/+zRPHyf8DBl/BUKSwHtLaOpn2glQmAxU0eGKNtC4yLHgAWEHT9kXGolp2qiQpYsThJLQr5NgNuiEioWrki1K5PM4poVJXLRmwu8PlDxHYgUfFChX/W78LFSYTduyFK7d6mGkIttEtlm31k3p0Zu93KXhy9dmZh+7SKW29ZbDmvW7eCnsB405POkrUApNDKXUNrURWY4lgib0QM1E1f5gWtLD5n3F3d7E1GI9nwJ8sXdKioHyykjF1gghFLF8kDAY/1vhjvm20lYZbDOFViPGSvWN8vS595aqbNBNZ6+lFmeiqCEIujhkp0+e+hUaLBDPASxttMmodnzCEGexNhBq5U5CkU23oZTaLcaMWFrTTq39rqXn9ct2gq+BElDyCT9vu+GFzBqB+XjxU4xT+SsyG+GaMwPnWBzgGF6t9Iy/BUA/81Lxk3L/vzB3enPxpV2/4TeWgSE8RJ/c2yQS5MtVwfQSX/hh0IOzG9vNG5oYU8xzZqdOzbPcgR0+iA61YA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDFCTEpySldJZlZ3OE9TUXRCT3RqN3FZQ2JiM0U0VnBHVHI5Uk5WaUhTSHFW?=
 =?utf-8?B?VTM3eW0wWjZ6SDdReTlvOUprZ1drU2xiQXZHRnVCZWdaM1lsY05DT3ZmdnBh?=
 =?utf-8?B?LzdBdk5FWGloZ3N2SUYvenowSE1rV0xNQlJIT2o0RDhyNmhnK0JJL1FWdEdZ?=
 =?utf-8?B?SHJoUHpzRnlQMWFCVWRTaUhvQmRzUWU5SDFJVXVZQjBUak9GN3JtYWg5MTh6?=
 =?utf-8?B?Z2NqRHdYekF6SFI0bUdOQmxFR1FYdktwaTVZZjdvb1N6NGpma1NlY0lTSEdW?=
 =?utf-8?B?MEc4aDNNRGx2czRIN2luWVE1YnJwNFlSWTNSME8wUmhuMm96clZxQmd5Rjhy?=
 =?utf-8?B?b2czc1FKaW1HclVSRnlMNFgwS3N4OFBpRmlKUGpFNTcyVnkyUENLL1J2M0JZ?=
 =?utf-8?B?ZUhUZTA5TjFuUG9hVDhVSk9rSThBZTQyQ1V1NjRRTEpKTXNCbVlvTzNNNTBG?=
 =?utf-8?B?bFQrUGxEbUNvL2xQMXgvRUlyeUNHVHpPSmxBajVFSW5sOG54TjU2em9Xek12?=
 =?utf-8?B?YkJ1K21lck5mWUxWNlRtekVZZXJXRG41OEU0NmVxYXRUaWRmSGhmU01ZQStC?=
 =?utf-8?B?UHQyRmFwSFYwbFE5WmhWbkdsRXpDMHVXNzZyMXUwTjdLWWJZVVdBL05xa1BG?=
 =?utf-8?B?S3VSRXhodHBOMjkwNzBTTFdzVmJPVnQ4anR1NWR5Z1dJQkJwanNrNmswbFNw?=
 =?utf-8?B?K2NHM1ViQ3kvNWlFRWtTYzRpOGVCa3hGMTRaZ2l1ZHZ6L09MQmxkbktvek95?=
 =?utf-8?B?LzZ2dnlXUlFqbUZaTWtPZ0NtNDU1NkVsRmgxeFVSMDlCRTBzVVpWT3Fubno1?=
 =?utf-8?B?ZW9YeTJuK1F2dzdFZllMLzlsV3BBT2JEb0dXRGJsN2RIVG1FOHp0Tk5GS2xw?=
 =?utf-8?B?UTQzcmdXQlhQbmtMSGUydFlVWUp3TXBHSGdKZUJaTjN4YnBBcnRpZEo3TjZ2?=
 =?utf-8?B?UHRtRTVYb29RT1l3aVlVNVlpOFQwSGZvS1ZxUEZHV2l6dzkxcFFzL3U1eGVY?=
 =?utf-8?B?UUNjK3BjcUMyU0ozOER3d3p1SGJsRjhJS2NmSU1SRHM1dXhwazgyY0RpZGN1?=
 =?utf-8?B?WFRQTW0xR1ZnYkdudE9jS0lUVnZZM0FJS3MvY3A2Z1RlRithODJVcE1UZ2xi?=
 =?utf-8?B?ZEJjaWo3VzFkNm9FSUVxd1drcUUvQXMxNTB4UjBmR1RkMGpxamhra2VhRm5h?=
 =?utf-8?B?U1Jwdks4TTk2RUdYVXA4TW5GZk9NQ1c1UmZtOTIwcFdONEdRUy94UGZTenY1?=
 =?utf-8?B?eVhCcmY1N01oYlFGQ3ltY2YxWnU0VEhWekg2Zm1YMW1IeGlTT3VBQk5YQWlX?=
 =?utf-8?B?djIvSE9CdXZ3aUJoTDdMY2I5T0IrUS9oSjF3OEhkK1RiYXBWWWkxY0c4QXor?=
 =?utf-8?B?cjJLeHBBalhicUUvc3poazgrbllKNHUrdXF1NGRYbnZyaDF5R3piVS9LUkdZ?=
 =?utf-8?B?QzNSUUk0WThNbDRxYmtRem56UHZSbUtrLzA5end2YlZYOTBkZWE0a2cvTjYr?=
 =?utf-8?B?cnF4MnZrcm82dHlsVkFSS1c5M1JXSFZSN0RLNGFnZ2lKNDFjNmJEQWNPaG83?=
 =?utf-8?B?OWRYbUwzVGxSS2h0bTZJVnltSHVwOVdWbHVpZDNUMDNhdm9mR21JVmd1SmQ1?=
 =?utf-8?B?djJ1UlNjMXVyUHZzL1RMSE9xdm40QTh6Um5yQmtmOUJBbHRhOFVkSHFGVEp4?=
 =?utf-8?B?UkhYeEIxbXg0aEFZQk4rRFUrSmtBRCtvUTVDcE55Qzk4UWRIY0FQWFUrRTVm?=
 =?utf-8?B?L1RqM3p0dnp3NW1nZnZqQk03T3RqVUNUTkw3NGlwZmNUZmxYRHl1Q3c1R2NG?=
 =?utf-8?B?Rk5wNFNET3BHditIMjRYMG9zUyt5TXRtLzVOY1VQSFZOcit6eGNtYjJKL3pq?=
 =?utf-8?B?QlRucUlLZlpsVjNialgzYnI3UU55ZWwvR2JXWmRpRENRejltaFZKOVpSMXlU?=
 =?utf-8?B?WVUwVC9DMVlpQTkvVVJHQ0lwaXU3TXNraThBSk5CT003dHJOdGFMMG9zejNt?=
 =?utf-8?B?UmY1YnhXU29DSVNWRjMxV2RBczN6aU1WVzJOaUJBcE1ZSlBPeWlNY2tBZ1NV?=
 =?utf-8?B?eHdJMU5tYU02UG5OQmVqRzV0ZVNxKzNGV2hPWGRxNmpGSWtncGliemJJbGRT?=
 =?utf-8?B?U3N4UkNBV2V4aEMvR01nUmFTNGovQXc1ZnlQc3h4UVRTdnFibWZEcWo3M0ZI?=
 =?utf-8?B?clUwdmpLckt4SGJRV0ZRRU90dHhLY0xPSWpXb0JEMFkwU1oxRXEzTGVSWjhO?=
 =?utf-8?B?a2l0SlRSRWJsTXBPOGZpQ1IxZzdyY21RR1hrWlVZVkdrbG5IbFdNQTN4c3Bx?=
 =?utf-8?B?ZTZ3U2tlM3FSRHYyRm1Cdm9oR3lSMDRRSVpRUmlSWGNKdk0wZURoWlZycVRo?=
 =?utf-8?Q?9VRV+N5GwvROQmaw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A45FA5C09865B439C7A3154C8615E93@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MCj6RzzOMIW8MrOo5b1W1tHadI7o4CuUuN6bSShdGnG4Q4sTlkrUE5EHmclv7mG0d8FgSK0G73gcXVjFaxEnM9ycHiLF6437Y+mY193R/ict+J4I7vG1CIGnuNQQ6Q1ga4aF209N6z9g/yGEoiKRo2Cae4HK3pG8oB42sHBk/u3poMrYL7w5+skkg87XDNvfcm51gneo5PZ+rpcgVZ+UTCksEkNmyKZv2h0PJtFEzCd3k9jRukzOyQt0jXGEJreziUvG9V0ogdV+uWJ8IZWX8nCIqzDneWSUiQh5SdSdt2x1/2wKlgsMYP9/uIsdywsYgCiLuvdAxymgIdgek2ZHIw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9222efdc-9ad5-4868-49b3-08dea6241708
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 19:18:26.8478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tSytdtvoV00ZgAvo+lOV1LWkDSrf4m7nf4EMoJqjdFik5/u9mKlg+s+nXcXyg3s3goOvyM70kBoG+5u1PSz8QoRUQT4vA1wnM/s2qaztZfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6466
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

T24gVHVlLCAyMDI2LTA0LTI4IGF0IDE5OjA4IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEluIF9fdGVzdF9wcmlvcml0eSgpLCBlbmFibGUgd3JpdGVfdGltZXN0YW1w
IGluIHhlX3NwaW5faW5pdF9vcHRzKCkKPiBhbmQgdXNlIHRpbWVzdGFtcCB2YWx1ZSB0byBkZXRl
cm1pbmUgdGhlIHF1ZXVlIHN3aXRjaCBvcmRlci4gVGhpcwo+IHJlcGxhY2VzIHRoZSBpbmRldGVy
bWluYXRlIHNsZWVwKCkgd2l0aCBhIG1vcmUgZGV0ZXJtaW5pc3RpYyB3YWl0Cj4gYmFzZWQgb24g
dGhlIEdQVSB0aW1lc3RhbXAuCj4gCj4gUHJlLXNldCBhbGwgc3Bpbm5lcnMgdG8gcHJlZW1wdC13
YWl0IGJlZm9yZSBzdWJtaXNzaW9uIHNvIGVhY2gKPiBxdWV1ZSwgb25jZSBzY2hlZHVsZWQgYnkg
SFcsIGJsb2NrcyBhdCB0aGUgc2VtYXBob3JlLiBUaGlzIGVuc3VyZXMKPiBhbGwgcXVldWVzIGFy
ZSBydW5uaW5nIG9uIEhXIGJlZm9yZSB0ZXN0aW5nIHByaW9yaXR5LWJhc2VkCj4gc2NoZWR1bGlu
Zy4KPiAKPiBBc3Npc3RlZC1ieTogR2l0SHViIENvcGlsb3Q6Y2xhdWRlLXNvbm5ldC00LjYKPiBT
aWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5pcmFuamFuYS52aXNo
d2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0
aV9xdWV1ZS5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAtLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVs
L3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IGluZGV4IGNhOTYwOTlkMzYuLjM4MjcwNWQwNjUgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gKysrIGIvdGVz
dHMvaW50ZWwveGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gQEAgLTQ1NCwyNSArNDU0LDI0IEBAIF9f
dGVzdF9wcmlvcml0eShpbnQgZmQsIHN0cnVjdAo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFu
Y2UgKmVjaSwKPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IG51bV9xdWV1ZXM7IGkr
Kykgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdWludDY0X3Qgc3Bpbl9hZGRy
ID0gYWRkciArIGkgKiBzaXplb2Yoc3RydWN0Cj4geGVfc3Bpbik7Cj4gwqAKPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bpbl9pbml0X29wdHMoc3BpbltpXSwgLmFkZHIgPSBz
cGluX2FkZHIsCj4gLm11bHRpX3F1ZXVlX3N3aXRjaCA9IHRydWUpOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB4ZV9zcGluX2luaXRfb3B0cyhzcGluW2ldLCAuYWRkciA9IHNwaW5f
YWRkciwKPiAubXVsdGlfcXVldWVfc3dpdGNoID0gdHJ1ZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAud3JpdGVfdGlt
ZXN0YW1wID0gdHJ1ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFByZS1zZXQgYWxsIHNwaW5uZXJzIHRvIHBy
ZWVtcHQtd2FpdCBzbyBlYWNoCj4gcXVldWUsIG9uY2UKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICogc2NoZWR1bGVkLCBpbW1lZGlhdGVseSBibG9ja3MgYXQgdGhlCj4gUVVFVUVf
U1dJVENIX01PREUgc2VtYXBob3JlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IGFmdGVyIHdyaXRpbmcgaXRzIHRpbWVzdGFtcC4gVGhlIEhXIHN3aXRjaGVzCj4gYmV0d2VlbiBx
dWV1ZXMgYXQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhpcyBwb2ludCwg
YWxsb3dpbmcgYWxsIG9mIHRoZW0gdG8gc2NoZWR1bGUKPiBkZXRlcm1pbmlzdGljYWxseS4KPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHhlX3NwaW5fcHJlZW1wdF93YWl0KHNwaW5baV0pOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3luYy5hZGRyID0gc3Bpbl9hZGRyICsgKGNoYXIgKikmc3Bpbltp
XS0+ZXhlY19zeW5jIC0KPiAoY2hhciAqKXNwaW5baV07Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBleGVjLmV4ZWNfcXVldWVfaWQgPSBleGVjX3F1ZXVlc1tpXTsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGV4ZWMuYWRkcmVzcyA9IHNwaW5fYWRkcjsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2V4ZWMoZmQsICZleGVjKTsKPiAtCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIFdhaXQgZm9yIGpvYiBvbiBRMCB0byBzdGFy
dCwgb3RoZXIgcXVldWVzIGJsb2NrCj4gYmVoaW5kIFEwICovCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICghaSkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHhlX3NwaW5fd2FpdF9zdGFydGVkKHNwaW5baV0pOwo+IMKgwqDCoMKgwqDC
oMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBzbGVlcChzbGVlcF9kdXJhdGlvbik7Cj4gLQo+
IC3CoMKgwqDCoMKgwqDCoC8qCj4gLcKgwqDCoMKgwqDCoMKgICogRXhwZWN0IHRoZSBqb2Igb24g
b3RoZXIgcXVldWUgdG8gbm90IGdldCBzY2hlZHVsZWQgd2hpbGUKPiB0aGUgc3Bpbm5lcgo+IC3C
oMKgwqDCoMKgwqDCoCAqIG9uIHEwIGlzIG5vdCB3YWl0aW5nIG9uIHByZWVtcHQgY29uZGl0aW9u
Lgo+IC3CoMKgwqDCoMKgwqDCoCAqLwo+IC3CoMKgwqDCoMKgwqDCoGZvciAoaSA9IDE7IGkgPCBu
dW1fcXVldWVzOyBpKyspCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3Nl
cnQoIXhlX3NwaW5fc3RhcnRlZChzcGluW2ldKSk7Cj4gK8KgwqDCoMKgwqDCoMKgLyogV2FpdCBm
b3IgYWxsIHF1ZXVlcyB0byBzdGFydCAqLwo+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkg
PCBudW1fcXVldWVzOyBpKyspCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3Nw
aW5fd2FpdF9zdGFydGVkKHNwaW5baV0pOwoKU28gSSBzZWUgaW4gdGhlIHNwaW5uZXIgYmF0Y2gg
dGhhdCB0aGUgYzBmZmVlIHZhbHVlIGlzIHdyaXR0ZW4gYmVmb3JlCnRoZSB0aW1lc3RhbXAuLi4g
c2hvdWxkIHdlIGNoYW5nZSB0aGF0IG9yZGVyIGluIHRoZSBiYXRjaCB0byBhY2NvdW50CmZvciB0
aGlzIHNjZW5hcmlvPyBBbmQgc2hvdWxkIHdlIGhhdmUgYSBjaGVjayBiZWZvcmUgd2UgZ28gaW50
byB0aGUgZm9yCmxvb3AgdG8gY2xlYXIgdGhlIHRpbWVzdGFtcCBiZWxvdyB0aGF0IGFsbCBvZiB0
aGUgdGltZXN0YW1wcyBhcmUgbm9uLQp6ZXJvIGZpcnN0PwoKSSdtIHdvbmRlcmluZyBpZiB3ZSBj
YW4gaGl0IHNvbWUgcmFjZSBjb25kaXRpb24gd2hlcmUgd2UgbWFyawpldmVyeXRoaW5nIGFzIHN0
YXJ0ZWQsIGJ1dCBzb21lIG9mIHRoZSBxdWV1ZXMgKHdlbGwuLiBhdCBsZWFzdCBvbmUgb2YKaHRl
IHF1ZXVlcykgaGFzbid0IGFjdHVhbGx5IGhpdCB0aGUgc2VtYXBob3JlIHdhaXQgeWV0LgoKVGhh
dCdzIHRoZSBvbmx5IGlzc3VlIEkgc2VlIGhlcmUgcmVhbGx5LCBldmVyeXRoaW5nIGVsc2UgbG9v
a3Mgb2sgdG8KbWUuIEFuZCBtYXliZSBJJ20ganVzdCBiZWluZyBwYXJhbm9pZCBhYm91dCB0aGUg
Y2FzZSBhYm92ZSwganVzdCB0cnlpbmcKdG8gc2VlIHdoZXJlIHdlIGNvdWxkIGhhdmUgc29tZSBo
b2xlIGhlcmUgaWYgdGhpbmdzIGFyZSBydW5uaW5nCnN1ZmZpY2llbnRseSBzbG93IGZvciBzb21l
IHJlYXNvbi4KClRoYW5rcywKU3R1YXJ0Cgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChmbGFn
cyAmIERZTl9QUklPUklUWSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyog
QXNzaWduIGluY3JlYXNpbmcgb3JkZXIgb2YgcHJpb3JpdHkgZm9yIHNlY29uZGFyeQo+IHF1ZXVl
cyAqLwo+IEBAIC00ODUsNiArNDg0LDMwIEBAIF9fdGVzdF9wcmlvcml0eShpbnQgZmQsIHN0cnVj
dAo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHNsZWVwKHNsZWVwX2R1cmF0aW9uKTsKPiDCoMKgwqDCoMKgwqDCoMKg
fQo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBDbGVhciB0aW1l
c3RhbXBzIGFuZCByZWxlYXNlIGFsbCBxdWV1ZXMgZnJvbSB0aGUgc2VtYXBob3JlCj4gd2FpdC4K
PiArwqDCoMKgwqDCoMKgwqAgKiBUaGUgb3JkZXIgaW4gd2hpY2ggdGhleSBuZXh0IHdyaXRlIGEg
dGltZXN0YW1wIHJldmVhbHMgdGhlCj4gK8KgwqDCoMKgwqDCoMKgICogcHJpb3JpdHktYmFzZWQg
c2NoZWR1bGluZyBvcmRlci4KPiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBm
b3IgKGkgPSAwOyBpIDwgbnVtX3F1ZXVlczsgaSsrKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoFdSSVRFX09OQ0Uoc3BpbltpXS0+dGltZXN0YW1wLCAwKTsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfc3Bpbl9wcmVlbXB0X25vd2FpdChzcGluW2ldKTsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIEZvciBRMCwgd2FpdCB1bnRpbCBpdCBpcyBydW5uaW5nIGFnYWluIHRv
IGVuc3VyZQo+IGl0IGhvbGRzIHRoZSBlbmdpbmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogd2hlbiBwcmlvcml0eSBhcmJpdHJhdGlvbiBpcyB0cmlnZ2VyZWQuCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAoIWkpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB3aGlsZSAoIVJFQURfT05DRShzcGluW2ldLT50aW1lc3RhbXApKTsKPiArwqDCoMKgwqDC
oMKgwqB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDCoMKgwqDCoMKgICogVmVyaWZ5
IHRoYXQgc2Vjb25kYXJ5IHF1ZXVlcyBoYXZlIG5vdCBiZWVuIHNjaGVkdWxlZCB3aGlsZQo+IFEw
Cj4gK8KgwqDCoMKgwqDCoMKgICogaG9sZHMgdGhlIGVuZ2luZS4KPiArwqDCoMKgwqDCoMKgwqAg
Ki8KPiArwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAxOyBpIDwgbnVtX3F1ZXVlczsgaSsrKQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3RfYXNzZXJ0KCFSRUFEX09OQ0Uoc3Bpbltp
XS0+dGltZXN0YW1wKSk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAvKgo+IMKgwqDCoMKgwqDCoMKg
wqAgKiBUcmlnZ2VyIGEgcXVldWUgc3dpdGNoIGJ5IG1ha2luZyB0aGUgc3Bpbm5lciBvbiBxMCB0
byB3YWl0Cj4gb24gcHJlZW1wdAo+IMKgwqDCoMKgwqDCoMKgwqAgKiBjb25kaXRpb24sIGFsbG93
aW5nIGpvYiBvbiBxMSB0byBnZXQgc2NoZWR1bGVkIGFuZCBmaW5pc2guCj4gV2hlbiB3ZSBlbmQK
PiBAQCAtNTAxLDcgKzUyNCw3IEBAIF9fdGVzdF9wcmlvcml0eShpbnQgZmQsIHN0cnVjdAo+IGRy
bV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwKPiDCoMKgwqDCoMKgwqDCoMKgaSA9IDE7
Cj4gwqDCoMKgwqDCoMKgwqDCoHdoaWxlIChpIDwgbnVtX3F1ZXVlcykgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChqID0gMTsgaiA8IG51bV9xdWV1ZXM7IGorKykgewo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX3Nw
aW5fc3RhcnRlZChzcGluW2pdKSAmJgo+ICgoYWxyZWFkeV9pbl9vcmRlciAmICgxIDw8IGopKSA9
PSAwKSkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKFJFQURfT05DRShzcGluW2pdLT50aW1lc3RhbXApICYmCj4gKChhbHJlYWR5X2luX29yZGVy
ICYgKDEgPDwgaikpID09IDApKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0X29yZGVyW2ldID0gajsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfc3Bpbl9lbmQoc3BpbltqXSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX3dhaXRfdWZlbmNlKGZkLCAmc3Bp
bltqXS0KPiA+ZXhlY19zeW5jLCBVU0VSX0ZFTkNFX1ZBTFVFLAoK
