Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36355103E17A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 14:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB88610E836;
	Wed, 18 Mar 2026 14:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPRHEJjS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCBA10E825
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773842999; x=1805378999;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=vjTGtfAng6WPw5/fTnSnO1WV4wgB8+A1jBNGbXy4r4Y=;
 b=BPRHEJjSAUiHbx5h6aU8nshgGhOPJwcxh8/eID8luf+jo8iud5rjChYr
 e9jvHrArYFKyQVxhTHubdHoQGiKAr4maSTxEfyxOH5Ch6SbAbsIJc157H
 DSWDALBPivd/IGrmWkQyZCLg9kn53qv2E94hRdJDvgHLul2ttYYmwJOwy
 NI4TPOb/BCJxYTEQHWHhCMcq8KRbEhLDvXGlI6mIZJ/olBnEwdKMHK6ND
 uDqcSCSDlUVYfUQC1IrXwLdoO7SdqIqvlVYnD4/3yhejeantfjSQfCyAu
 jEb19YkDlD2j/d87eZh24han76tdqgJDzwerCKeCR7DbuMala2+Y6JIG0 A==;
X-CSE-ConnectionGUID: o926b69USHSPU4omMcD+ag==
X-CSE-MsgGUID: L58PYq2zQh200+K/w5vpPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85594993"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85594993"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 07:09:59 -0700
X-CSE-ConnectionGUID: ZvLtlx6MSHS+o2n/T3Ao0A==
X-CSE-MsgGUID: VRz35A/WSfaJAfKOrCvTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="253117081"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 07:09:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 07:09:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 07:09:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 07:09:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhn8CNnjuBD8s3p+6wm96NP6+8vviAucRiea2arBSvbMGoKU6TcWcQAORzIj2a+UPqenjUANlISDWKk/ZQ9gTm1tJnx95vVhALN4QLyZPMlMRoYBZaQoT8/lE+rkRsn9uG8w9vYrNedlVVoDDxQgaAbVWW/lBQraHSsFwK3Lefv/x2tcTjNdlh9fAClgxastXSB2HSEwaFmS0h6xJHMZ8TNt4iyMSiVNW2hywhl1X10zoBlJvevC2l2C0dwdkrGqQsl0PiDbSLBD2fR5OUwkDHyn2A5ohNqcDMXGUu0x3Fd5z6qWhFVacQZL49HXSR3d0cywd6p/NP5hTqBskup/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjTGtfAng6WPw5/fTnSnO1WV4wgB8+A1jBNGbXy4r4Y=;
 b=cTzWXR39VYGtTcEfnu/flzSIZKrgJTvvy/+QK2xVyTiSmh7ajrt+09grd+0drAXn3bz08FeZeWjreF85MtZ5MtxGcDX9vkcghVFRxnBKBe55rrnLf37UO5FRIW9efU83khB3qZwfubxMPl19u2LW9fyOWm2XIJLyDyElIUoj3vUaEOMz3Bzyo567AX3E+/Gxl4Hl/YSOiBNGXSb5dJ0bRLJK9nBQXM4r6JozuxSsMBQoV7C3JOVgb0MCgsIvulJCDNjiALSqwWXcTs8mSRvCuqxKKis6BL9b+g5O87pUeotkuzgS5b29npR7EiKG0pv/79/1HwcJso3ZA1y99tCA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 14:09:54 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 14:09:54 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Pass output to PSR helpers
Thread-Index: AQHctoU89YdWS2pMZkKmKZ2AtFFBZLW0VLwA
Date: Wed, 18 Mar 2026 14:09:54 +0000
Message-ID: <dd67478c2f6d00d07487deb003e3b22c4ee88594.camel@intel.com>
References: <20260318031205.70655-1-jeevan.b@intel.com>
In-Reply-To: <20260318031205.70655-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SA0PR11MB4559:EE_
x-ms-office365-filtering-correlation-id: ee5ee54b-1737-400e-9686-08de84f80792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: Wzr6yy9TNr3OZNAIOOnB5NjLbDewJPPaRUlAPDswnzhbSzj1EltGFPm0ckwR1VwKWF6q7WsIDgpXu0DbA7eokW8aIgPo4sMYdEl3sLitSVIZn+5lubHmjaJqq7gXq7TpmVcQAuocNOibrThrbJ4P6G8PbYz55OkXstfQMT/nLYKFk2PzUpTHtcFVh0k05ykjEtzvfjuY6w4rNkmgk6gYB8RbrG/PE2GkyZjnY5mVpK335AYW2cUpOl0AZDidIQDm4KC3VbTnQvuXzIDpDlGWLv3LmYXmLvCSsRTUr584t0pBuMBM2IqT/CVYk1mETGpdeKox9ATlhQ+ZAzyHdyDECF+jAtzdm7rwU58/e4rUkuddHtiGCw7g4gHYk52r4exjPEcryDxrlw8LWpCNv/e4vAYfettRJTihgvdBVCx+gCgMmjKmsZ588yqGRkt2bfN+DaqpHilXEHmeeWival9eym6W3aBRlSGxoVtpK7w6GCAoBfIMjpMFtMilQ//aLZQzP1P2oy28Dl6V9C2+u507wAdf5r5lsAoVmkOafj1uLu9QyoW1bw3IGZYMV4+m2r34RUGkl4p5U3j3SepOPrvZD/v0d8524geJKiHkuP/TTAoKi+BIEhrNANyJ17MzRxTOOkUYAk9ojdoDQvriY/PQ+Bp/Jyq83S881nAKiXQ0SCfg0QibwvFniNu6aW/fh61O+qKTqbMrcU3rb49w+joQ3wlq3WQplEi9OHgxAcQZiwinmFaCA8QgIPgDggokjBD7cM2MByJx2iWwFd7+Wvl0ELjqyLItzeissmzZcVvKvVA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bThLSUVRa2YzZUZtc0ltWWpWQUhKT0RxWTVDa0dxM3B0eHVPeEhJamp4NUwz?=
 =?utf-8?B?d0J6RjdVTGJEOGVCRVh6cFRZaVBGMm9VT2pObUNRZDdDbXNNY21yaDF1TmQw?=
 =?utf-8?B?NDQxbHhQaFU2L1VadVRWYUNTMStuYUVnNGVzbXlEL2lFOTFXWngxRFY0bGhV?=
 =?utf-8?B?S0l1aTc0emhqOXpLT1I0N2s3WG5WdHBkcmd5VGpEZkM1aXpCWHMwK1ZZU0Nr?=
 =?utf-8?B?N01iTGdXay93MnI5S0NGWm5aRkxNSVN2RTBaQk95UVFqVUw5UHJ6NndUalNw?=
 =?utf-8?B?RXZpYmhGQXhUdGNHY3pReE85c1lORkJTaThUVTR5MDZEWmd2QWM3T1p0VmMw?=
 =?utf-8?B?M2V3aXhPQ01QZGhOcGxjUkRGSVkrR2RKZHFqVlBsazk4Tjl5YXJrM0t0bmxE?=
 =?utf-8?B?SHowdWtCRmI3by9SZVJhbWVja2NiM2lTS05ZdUhGaEh1dHNuS1VvNHVFSVNC?=
 =?utf-8?B?bk1SWFZwcklNRUFPamRxbTJKakNKU3NwakJ0Y1cvMlNVeUlGQWhwMjk2dVlE?=
 =?utf-8?B?SEtwTDBYcDNMdWo2enVVZXNmWUd5Vys5M012SE1YVEcreEpucVorRS9JMDlQ?=
 =?utf-8?B?L3FXMkhDODJiM2V1R2MvU0h4Q2VxSmgxMVlKY1E2U0RjYmZTSjMxVDkxaUxv?=
 =?utf-8?B?MmUza241cHJzejJzWnpNQk0xeS9iTWF4Y3FIdHh6VVFIeUNUUWRVbFRoN0Fo?=
 =?utf-8?B?cGRMdERmVjRqOTgrY2R2OG1USlhXKzNESHFaY2NXRTZ5TlYwVDJnL1VYVmtn?=
 =?utf-8?B?VkFRSmtxWC9RNmp2K2lRbUFPOS9tWnFxdVZNeS93K1ZRTjNwOSs3UTdVNXNr?=
 =?utf-8?B?RW1JVzhXTU1WaVZVcUFyb3Z2b2VMeUhwV2lSZVByY0dZT1pvdit1ei8zdVVm?=
 =?utf-8?B?WHA5U2JJcS8rV25sQ0JmeWJFVjJ2MTFKblFaWHozMjk5WWpYY2NYYTZ6d1Q2?=
 =?utf-8?B?YktDSGZtM2lIWHRZZmFoUDdTckc4bVBXMTJOMEJSZnN3QUswU3V6enlzN3BJ?=
 =?utf-8?B?VGJCaDZZWkZoOGR3dWRqRWpRTEhscHJoM3d3UWpFWXVmV1VPSVh2b1hEUXI5?=
 =?utf-8?B?UzIyS1ZNVktEWGxDV09iTjhFaUtOam9BSGZwOXNKazF2T2dOQ0JWaXBTa2lJ?=
 =?utf-8?B?SEJjb3BPblkxV3YvdC92eDNEeUpiaFF5TEkybDlRamtCQWV2dXdWbWt3eFZp?=
 =?utf-8?B?SUhkWUdUTXF0c0xBTjVvSUNxM0tyeHRjZm51bW1EWTBZeG5WQ2FGaEN5dXF3?=
 =?utf-8?B?VndBTFEvcGc4TDFhNjU1dVdJVDlkSWw1YjdyQnpjNFoycG1CYWE3dU9xd0Mv?=
 =?utf-8?B?aUcyd0xpR0pXZTd3YkJmZ1dsRVZzaVEvT01OdWRzLzZoaXd0Tngxd1RiVWRn?=
 =?utf-8?B?aXowNng1M0YvK1NLWnBHZXA2aXh0R2lNWHBOaGZaaHlRUXBCaVhrN3RSZnRh?=
 =?utf-8?B?bFJ2YzhuRHpSeUhrU0JhcEtCUFpVOHpRQUYweUdXL2Q4dkhPcTNHekVXdkdV?=
 =?utf-8?B?elZoTDhPM1R2Z25zNTczeWVRMzB6bC9jQmw3b2NZSmZJUGdLSUZ6MzRKcCt5?=
 =?utf-8?B?azhzc1VnM29pQmp2NWhPcGp4ZUFiZmZZSytpU2ZFSTVIeXNoRFRnNlNtYTU2?=
 =?utf-8?B?WTdzODM2V0c1a3A2RXFsak90TVovZDd5R2NYWHo5TnpYdnlLUG5Kcjdtbkwz?=
 =?utf-8?B?WFM1TEFydmVPZ082bWkzcGZsVjRzcm5QeU5JdVJKLzFwTEUramxaQ3pMd0pE?=
 =?utf-8?B?Qnpnd29CT01KWVF4ZWF1VWhwdHJXYnl5U25jUmFjSmdsa2RMdXVwQVNVRG5H?=
 =?utf-8?B?TldvRnNYRE5reGxpUGVvYWR3S09KTmZCeWJmcERkTFlwUDlGcFpQdWcrWWdV?=
 =?utf-8?B?a1hhZ0tMOHc4c3VUVWRXQ1U5NlRHYi9PK2Q0bDIxODE3NFdFbjF0UFFZSFZs?=
 =?utf-8?B?VmZPOWV0M0JtUjcvU1dDNUFMdG9vSzNNVlhyc0Z2a0hWeVNsd2t0Yk1tcnJs?=
 =?utf-8?B?MEJ5ZXVlNmFZcmgwV0xPSC9YR2MrbktmMkZkT2h0L1Y3UlZFQTJkTXp6S3lT?=
 =?utf-8?B?KzBGZGhvWWw1eHlKWUxFUnJaUU1KZzZLRnJLUXBMUVpSQVo5UmZPczFQUHZB?=
 =?utf-8?B?b0FzWmQwcFl2RnFjcjhPWEtZdllsSlBQOFZFeHZzM21ERGpVZ1JwcnBvNDJh?=
 =?utf-8?B?SHhOODNQQUc0KzJIODM0czczUjZqSUlRdElCT3lzUFJIeGJmTmlncEUzR1o0?=
 =?utf-8?B?YjJoZ2p3RlpUWmlaUWdPUTlWVGlqYVBZL2x2YlZrSUxIRjZtK1VieW1adEd3?=
 =?utf-8?B?UnFEMnIxQ3VtYU9Dd2w2ODBWUnJ3OTVNTEpuRUtVMEVZT0RPOExOOHRqMHFB?=
 =?utf-8?Q?tod00ocpVERKfkDn5epZbCavKSDUsQehb+BdVz5GDqv2e?=
x-ms-exchange-antispam-messagedata-1: yEriQ+aeoTt/afqvCXbgGMyrs7A5eGDufJs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <053C4AC567C7DD469CDCC9013696A581@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ia+lnuDX5ojwQTUfegSkdNK8LaX0Re/0jP2yIG/RqRDCcCEIWeURPP2S6uVMG/vjEr7Vz2zBWoWfO9AE3MkekbpFOfct4b+G/5FuJtLawVLt3DN6Pokb45KGNxG3ZHrombDUlchkzbKVWhRAtGnOaMiFp2kYIFVqaid4qyrCzeeWdNKwDfsUO1gmaa6ZiWBMEucU/qZY/uqyDekxj4Och+76jZlOLzkvMlwAqW9LpXr1jCd5LhGXHl5KZgUwRDFdyj+R6iqUXmyj+UCLQt3MCm2tHoq7jB0dYRPdEokOoxp4flBPagaXz4vsvcYqDklZDj8Fp2oFc2O1BN4GfJC1bg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5ee54b-1737-400e-9686-08de84f80792
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 14:09:54.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RAs9Kp8cjflzgMql4S/zq252jdLdwnm3H8T5j75cd2D6EhQhG79x3sa0h+YG9crnc6oGsJrS0FdCzNeKav7m8m4GFisLQazHVzepEDbnOvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
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

T24gV2VkLCAyMDI2LTAzLTE4IGF0IDA4OjQyICswNTMwLCBKZWV2YW4gQiB3cm90ZToNCj4gUmVw
bGFjZSBOVUxMIHdpdGggZGF0YS0+b3V0cHV0IGluIFBTUiBmdW5jdGlvbiBjYWxscyBhbmQgdXBk
YXRlIHRoZQ0KPiBsb2cgdG8gaW5jbHVkZSB0aGUgb3V0cHV0IG5hbWUgd2hlbiBQU1IgaXMgbm90
IHN1cHBvcnRlZC4NCj4gDQo+IFRoaXMgY2hhbmdlIGVuc3VyZXMgY29ycmVjdCBiZWhhdmlvciBp
biBkdWFsIGVEUCBzZXR1cHMgd2hlcmUgUFNSDQo+IHN1cHBvcnQgbWF5IGRpZmZlciBiZXR3ZWVu
IGRpc3BsYXlzLiBQYXNzaW5nIHRoZSBzcGVjaWZpYyBvdXRwdXQNCj4gaW5zdGVhZCBvZiBOVUxM
IGFsbG93cyBQU1IgY2hlY2tzIHRvIGJlIHBlcmZvcm1lZCBwZXIgY29ubmVjdG9yLA0KPiBlbnN1
cmluZyBlYWNoIGRpc3BsYXkgaXMgZXZhbHVhdGVkIGluZGVwZW5kZW50bHkgYW5kIGFjY3VyYXRl
bHkuDQo+IA0KPiB2MjogUmVwbGFjZSBOVUxMIHdpdGggZGF0YS0+b3V0cHV0IGluIGFsbCBQU1Ig
aGVscGVycy4NCj4gdjM6IFVwZGF0ZSBjb21taXQgbWVzc2FnZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEplZXZhbiBCIDxqZWV2YW4uYkBpbnRlbC5jb20+DQoNClJldmlld2VkLWJ5OiBKb3VuaSBI
w7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqB0ZXN0cy9p
bnRlbC9rbXNfZGlydHlmYi5jIHwgMTIgKysrKysrLS0tLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0
cy9pbnRlbC9rbXNfZGlydHlmYi5jIGIvdGVzdHMvaW50ZWwva21zX2RpcnR5ZmIuYw0KPiBpbmRl
eCBiODVlMDkzNDYuLmI1ZGU2MzM1MCAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2Rp
cnR5ZmIuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZGlydHlmYi5jDQo+IEBAIC0xMjAsOCAr
MTIwLDggQEAgc3RhdGljIGJvb2wgY2hlY2tfc3VwcG9ydChkYXRhX3QgKmRhdGEpDQo+IMKgCQkJ
cmV0dXJuIGZhbHNlOw0KPiDCoAkJfQ0KPiDCoAkJaWYgKCFwc3Jfc2lua19zdXBwb3J0KGRhdGEt
PmRybV9mZCwgZGF0YS0NCj4gPmRlYnVnZnNfZmQsDQo+IC0JCQkJwqDCoMKgwqDCoCBQU1JfTU9E
RV8xLCBOVUxMKSkgew0KPiAtCQkJaWd0X2luZm8oIk91dHB1dCBkb2Vzbid0IHN1cHBvcnQgUFNS
XG4iKTsNCj4gKwkJCQnCoMKgwqDCoMKgIFBTUl9NT0RFXzEsIGRhdGEtPm91dHB1dCkpIHsNCj4g
KwkJCWlndF9pbmZvKCJPdXRwdXQgJXMgZG9lc24ndCBzdXBwb3J0IFBTUlxuIiwNCj4gaWd0X291
dHB1dF9uYW1lKGRhdGEtPm91dHB1dCkpOw0KPiDCoAkJCXJldHVybiBmYWxzZTsNCj4gwqAJCX0N
Cj4gwqAJCXJldHVybiB0cnVlOw0KPiBAQCAtMTUwLDcgKzE1MCw3IEBAIHN0YXRpYyB2b2lkIGVu
YWJsZV9mZWF0dXJlKGRhdGFfdCAqZGF0YSkNCj4gwqAJCWludGVsX2ZiY19lbmFibGUoJmRhdGEt
PmRpc3BsYXkpOw0KPiDCoAkJYnJlYWs7DQo+IMKgCWNhc2UgRkVBVFVSRV9QU1I6DQo+IC0JCXBz
cl9lbmFibGUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiBQU1JfTU9ERV8xLCBO
VUxMKTsNCj4gKwkJcHNyX2VuYWJsZShkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNfZmQsDQo+
IFBTUl9NT0RFXzEsIGRhdGEtPm91dHB1dCk7DQo+IMKgCQlicmVhazsNCj4gwqAJY2FzZSBGRUFU
VVJFX0RSUlM6DQo+IMKgCQlpbnRlbF9kcnJzX2VuYWJsZShkYXRhLT5jcnRjKTsNCj4gQEAgLTE3
Myw3ICsxNzMsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19mZWF0dXJlX2VuYWJsZWQoZGF0YV90ICpk
YXRhKQ0KPiDCoAkJYnJlYWs7DQo+IMKgCWNhc2UgRkVBVFVSRV9QU1I6DQo+IMKgCQlpZ3RfcmVx
dWlyZSghcHNyX2Rpc2FibGVkX2NoZWNrKGRhdGEtPmRlYnVnZnNfZmQpKTsNCj4gLQkJaWd0X2Fz
c2VydF9mKHBzcl93YWl0X2VudHJ5KGRhdGEtPmRlYnVnZnNfZmQsDQo+IFBTUl9NT0RFXzEsIE5V
TEwpLA0KPiArCQlpZ3RfYXNzZXJ0X2YocHNyX3dhaXRfZW50cnkoZGF0YS0+ZGVidWdmc19mZCwN
Cj4gUFNSX01PREVfMSwgZGF0YS0+b3V0cHV0KSwNCj4gwqAJCQnCoMKgwqDCoCAiUFNSIHN0aWxs
IGRpc2FibGVkXG4iKTsNCj4gwqAJCWJyZWFrOw0KPiDCoAljYXNlIEZFQVRVUkVfRFJSUzoNCj4g
QEAgLTIxNyw4ICsyMTcsOCBAQCBzdGF0aWMgdm9pZCBkaXNhYmxlX2ZlYXR1cmVzKGRhdGFfdCAq
ZGF0YSkNCj4gwqB7DQo+IMKgCWludGVsX2ZiY19kaXNhYmxlKCZkYXRhLT5kaXNwbGF5KTsNCj4g
wqANCj4gLQlpZiAocHNyX3Npbmtfc3VwcG9ydChkYXRhLT5kcm1fZmQsIGRhdGEtPmRlYnVnZnNf
ZmQsDQo+IFBTUl9NT0RFXzEsIE5VTEwpKQ0KPiAtCQlwc3JfZGlzYWJsZShkYXRhLT5kcm1fZmQs
IGRhdGEtPmRlYnVnZnNfZmQsIE5VTEwpOw0KPiArCWlmIChwc3Jfc2lua19zdXBwb3J0KGRhdGEt
PmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwNCj4gUFNSX01PREVfMSwgZGF0YS0+b3V0cHV0KSkN
Cj4gKwkJcHNyX2Rpc2FibGUoZGF0YS0+ZHJtX2ZkLCBkYXRhLT5kZWJ1Z2ZzX2ZkLCBkYXRhLQ0K
PiA+b3V0cHV0KTsNCj4gwqANCj4gwqAJaW50ZWxfZHJyc19kaXNhYmxlKGRhdGEtPmNydGMpOw0K
PiDCoH0NCg0K
