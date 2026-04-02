Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB25CC6B03
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 07:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC99910F049;
	Thu,  2 Apr 2026 07:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zcso9QNX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547AA10F11F
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775113788; x=1806649788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xxu3j9RtH6DvslTbuFFq11HfsaA6I27Pk3abjtVVcMQ=;
 b=Zcso9QNX/UBKxV6oPRbnAZWhAjgn1DgNcrk7QhoM5oIe1mEKTROl4T4x
 /zSOmNXF38TpRm0d0ixLG6avGVZwGlHe0TO3QIz10oiDSoA+VPgYaBVn2
 KOsfby2aRPuckUBVzd7zVw/NnpAobs9j6qXs0F/gZ2mnHBaR6Wmvke/u8
 K8vH1NQzlcZ7xCknOrwW7Dy49rXtpVYTchGotDEtzTUALh45jcngEu0PN
 +b2ijXa5QvQWQnTLtuQJvHDl6b8cXZDCvYu0J3nezVerN6o+4caoOcbZY
 onSTTLc6R1ZXpU3SmjVprc64PqKYDqydWp4P1nnO6M0WGac2CaZxLOWCH Q==;
X-CSE-ConnectionGUID: 8DncPAKvSRW0qCBhGoRJFQ==
X-CSE-MsgGUID: lIQ1uu8sRamzwGWsY+0REg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76054298"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="76054298"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:09:48 -0700
X-CSE-ConnectionGUID: l6F5OrQMS5ud/E7boCeTjQ==
X-CSE-MsgGUID: AvkpTTiDTgaKiOCd68G5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="230966239"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 00:09:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:09:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:09:47 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:09:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkSMXXCpS4PGF8i2IH/rZfeRHrrPXml5dMTlLpH84/aF3ifMRTtJtX4CIQO9EOpmfP34uQMsfp/eUJ8AFhTA/9iDndpMul48Lq19l68mZU3xTp2u7lrt6szVjDMzuPxOO9so4UW7E7jS3lvhqWU+IXxZ6rT3O+H7LchEckVIu9NGcAZhG2aXXnEFJ4/0fHo6n9m5FuvCeIbqJnxnTCb5/JdHZC7GpRK9/0oy3Z1EefaRq0bp3oK1jcj7IQXW5ZQOeLm9MEZLR//9I2e9HWDEdRrAK7uM2dkNHLo3o71GiNsDihMMC/zJyXETr89O5wwP6RPShYp65E+w/psIo/Dqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxu3j9RtH6DvslTbuFFq11HfsaA6I27Pk3abjtVVcMQ=;
 b=n3dHQyeyV+sauI4tUriQM6lwCH7dDt5RVVkQL7Ta/VGWojfRcmb2Hwvm3cvYEEgCvW0lQZS++FDf/duypSoZ4OM4EgwQtxYdPceXaS3Q5ECjwulgLocQAPfcGm0adwm6wK9mIxyAKGkFNZFx9s9DBN+z4BakeIv91+c+rH4CmnVstEi1ktTLKI8h0MLnUC6n+WJOLCC1rTSaze8guGiKZYSXwBvik42HEQTjKsOzzrGEblHjC+eKilo5mWgBQzwfpwqsZ9KclC/1opV5/Czs7u2BwemUyZpdzH3SH+9MwA5LP+gq0gpu+oD4PNZs5pjic87ej97mBHciWIo95k3++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 CY5PR11MB6319.namprd11.prod.outlook.com (2603:10b6:930:3d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Thu, 2 Apr 2026 07:09:37 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9769.018; Thu, 2 Apr 2026
 07:09:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v9 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Thread-Topic: [PATCH i-g-t v9 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Thread-Index: AQHcwBtr6vy3C2CkJUKICW6PVmc8V7XLXxmA
Date: Thu, 2 Apr 2026 07:09:37 +0000
Message-ID: <b6897e072a1731c0700a987797d80edd980e111a.camel@intel.com>
References: <20260330080104.2956810-1-sobin.thomas@intel.com>
 <20260330080104.2956810-3-sobin.thomas@intel.com>
In-Reply-To: <20260330080104.2956810-3-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|CY5PR11MB6319:EE_
x-ms-office365-filtering-correlation-id: f5b71787-d36a-40c5-1d8c-08de9086cd11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: lFiOFzr4QtY7fkaGP0fMMhCbtYw/93A+5KYxUm8ei9DY+ZPQ9vt80gaDx6l3Q5F2j+h+ptTNRYUMck0D9dXrAN4Ldf38Rccs2iILntpuIXlE3h9GC8PfhjlPT/XziWRNXTJlXNfBBAV8k2TuUBMnjXT0O47OrTBW6xrpBXOG78JJWyuAh1/mNY2An1uMde3LIVfFLgQw+XjXkUlbkWxKHigC6tiV+li1pBDlTMiOmiJzYjikGvVl5rA04EGzQtL4SRUgTP0gW5vkHg/Peh5GvUZOOVUfcgED+J52I7wZPrxVBjYSZVY3yANDA9+wqbKJTrWxKWLQv0c0kaPP34zYqHbzsL9b8msjbMuNhFCtuC0oQjycrnQCS2fXE6ku5knrYhuM6UcbA/NyMUsoj5ocjjSckVgAuIaCbnQV+p3n6guLKz9DP8mUvTkdTXQJUHJXMr3tLDZDxIHnr+TXUeuSSiq6J6xujR7iHqTuRAT3h7xiZew8qSHOVNHm9u4fUtWRdECmADV7tE8E9A6dNBwmMwAK0WldjPHG848mnrUsyrSFfr/iOXmLxmLtnRtWDymxIwFRsDYKS+uHWzR5PsOk4jfPaTSuIrAirOCXy7yTQSAe+7UpO083LPaXtzfCzXRiO3Uoe3dds1PBvkMA+PLaxr5bPxXEp4Qh1vS9bpSbllAGe+b2hTWhLf7JmdSs8B93PZxpTaShOQDtAsuIts8hgTOSjVX4Na2U7z5MwIyTzg1HdayEoQ8HMOabNAaOQyb9wFf6q67FjhnjFlUrPqMtGhxMeECYuaX/fDCfE9E5Xwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2RnbHVJRmk0Y2VNc1NQZERzbHEvS0FOcG42VzZhZlVWMSt0NHB5YXlSZDdy?=
 =?utf-8?B?eGFyYkVRaVZsb1pxNUc5bU8xY0FkVmxJS0tqdUNlYzdaU1ovdVY4bjhEbkRJ?=
 =?utf-8?B?OEpYRnRMbEgxVCtjK3o4RzkvOXhYYm95RG1lbU9qaFF2Tk8xQm1JMHZESG92?=
 =?utf-8?B?M0xCc1VMR0dyc3ZDTmNlZXBrNDA3QnIvUUhKM2FmWnhJaFUyOUxaeDZYSE15?=
 =?utf-8?B?ZlcvdURkNjlScTIyejFpY0JqdFZLV1R2V0FKclROZWJrWSt6VXJ5bGtsY3I2?=
 =?utf-8?B?MUgvcmNqLzlWeW9BZGF1SVNWLzZEcmg3K1hHQkFwSTlkUy9SbWp4VzFLTlp3?=
 =?utf-8?B?NFB0V3ZtOERWYzJtUGg4aXNXTHI4WjFiYUU5akVKd3BtNTErZCswd1hrSEhi?=
 =?utf-8?B?UVRxWmQ5SlVFM0F1Y2ZDeEJkTmdObEx1NWQrZjVMVlRMZWhYb1lLaGx0c2E5?=
 =?utf-8?B?SWh6SDZHSWxYSmwzYzZNWmxCNnJrSGpBK0s1cWszcFNVUEd0bFA1a1RzVGhs?=
 =?utf-8?B?TVZ2RE9WM0hhT053bWtYbzdQQWh0Y1FiSWthelFLelJWS0tuRGM0d1FDQVY5?=
 =?utf-8?B?N2Z6WXBPWXkreVRtSW0xTEw3TnNXTThaaENSdmpZdDdMRTBvU25Xb3dDaGVa?=
 =?utf-8?B?VmFVV1Z0SWdOY3Q4YlVsU0NJRk9pNVZiTlFiQTNabURuNUN1TjRWaWNoZGdI?=
 =?utf-8?B?aGVIUkI2TlNvNTdTSGEybUFHSWxKWFBLQmJpVVpLSkVrV0N2Sk1XK1E2OHd3?=
 =?utf-8?B?aUZWTlgxM2I0dTBZYTVYcDYvVUY3eWlZRU1INVNZdXdzc21OZ1A2TVZTY1JF?=
 =?utf-8?B?YWdyS2IxYllXbS9NMHlRL0srWU5kOGtjQ29nSG5mRHhRV0I5MjNEYThWaCtZ?=
 =?utf-8?B?VEV4RUt3USt0VlMrTGY1MVRDUHE4Q0E0b3N0OU9OZEtYdDdqbUlzN3c5ZWNw?=
 =?utf-8?B?RDkvdWxOaDNacEgwRGRXQTRCYjdxaGdPUFZ1aVpja1B2VDJuYWJpVlZUVWNT?=
 =?utf-8?B?WHZjekk5c01QOHBJeXdNaGZnUGw5bUtqa1FvRmxYRDZBYjNGVzgzZzJpUjF2?=
 =?utf-8?B?dUVGSTA4Q2gxMzdzQXZEQjI2UFV1Ny9VbkQ2S25qbCtvT3FEVThtTG9OVUJS?=
 =?utf-8?B?V0VmYk5kOW1rd2kvWkVPTm5PN0hzTm5jUmNqWDBYNjEvS0NGaDdtQTBYNmRa?=
 =?utf-8?B?d2Y4YzZRa0JBSHpwU2FJU0djOUxVVVI1MnZqWko2VnlKTU5lNlAxM3RWcUdm?=
 =?utf-8?B?M3JHSzJXSDNTQ0pKWURPWGJuWlkvSkVYQlBhUUZTQkkyRW1oUmlDaEZ2Z3E5?=
 =?utf-8?B?MDBPTllvVHNIcFBZZ2UyS21rUnFpd0QybC9hekk4YVd6VGFBTlRKU2hGaEFW?=
 =?utf-8?B?TitFV1NPdzJNQ3BnZEtSR1FNeXNxaFQ5Q0JqWjV1NnRPQWNPa3h1bGtLUCtE?=
 =?utf-8?B?c3N3TmwwNWNaNW10amt4ZWlYblFhZlV2ZURuZmNMNDBzbGZXd3p6MERuMUJ4?=
 =?utf-8?B?Y0NQNHlwbk5QdVo4OXRESVBmT3lwaFY3ckZ4RkdXUjhkT1lNOUtrcStBTHYw?=
 =?utf-8?B?Q3l1aU00bUxxY3ZqYzFVbWlYamo1L1JQV0RQTFNRZ0dYTHU1OGM3YzdnV1px?=
 =?utf-8?B?VTUwNDAwSE1uZENBUXVuVXJpSDhyNEQzSjFReWpTRnJWR29JMzhJdm5ocGJl?=
 =?utf-8?B?TXpWRUIzTklZY1hsamhQNEhaSTY4cnBKZWtuNDNuQ1d5OXl4eHJQQ0VsenRW?=
 =?utf-8?B?ZnZtaFZFOE5oRmNkR29kbGkzUGJzQWMrUEU5N3JLYUthbTR3SUZ0OHhIOHFD?=
 =?utf-8?B?UjV6SktQc1E1NVdiTFdFZ21IRjdqVExxWWgvcllGNFEvZmRqMjFmdDN3ek5r?=
 =?utf-8?B?TnZsTjhBRGZtRTBDcHgyOHZ2TitlUUhyRWhneDJLZXd5U2liY1N1RS9RMHpV?=
 =?utf-8?B?bzNLWUU4VXJEdW85NDJNNDVNSW5HOFB2V0syL2xDemJYU0U5TFgwNWYrS3cw?=
 =?utf-8?B?Q0NBbW1tZkNOUDB5ZE5PaVV3dUttY0NOTk96emY3VDBvLzZucUo2ZUtDQnlt?=
 =?utf-8?B?TVBpOEZxaEFZeDVEblpqYVpjS0lSYTF0b094ZUxSUFJtUTd3NWphN2pnVXFu?=
 =?utf-8?B?T1NlajJockxaMXBrNURBR3o1WklyYnE0eXpXRE4rQk82WWZ6dGJxWTFrbDgz?=
 =?utf-8?B?aC9Cc2srNytISnZHRTBQNjEzb2RqdWFIOEhVV0p2TDBBWW5IMEIxNUhIeCth?=
 =?utf-8?B?eTY3YTVmNDZrYlVpaytqcSt1WHE4WUFPNDd4K1JSSk9ERlpkd0RBSDQ3aVhW?=
 =?utf-8?B?OEI3eDQ1SXhiRzZCUnJDcVh0a1hsNUJ0WWhFVHZtbkVJY1dXTEtCQ01LZDBW?=
 =?utf-8?Q?7yTG156y3jaMgYqIapfqwzIrjtHySbuIp1rKvqgVua7O8?=
x-ms-exchange-antispam-messagedata-1: A8wnKpPpF4MDZg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4312F876FF70604AB69BFD2FA5F87090@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: patWmu1QPaAsmmcWFWq8SZ2qcPWQcV/xzmFGrXbbpZxL2r/T2iWuiR3LJ0ZEI1yRusRpZ7esDw6BOGsZEhumNoIux3WRLOcrwVfTkxiwWGzAzLkGNDot+rZhUTa+y91YodIcLRAK4F+C46McFmoslMvQcs2CRbIgpY45YDY5Ewqh6OkIPwarn3kwMy9kMm5rzX8Pgn9wcydKtxhaeBvkCJ0tvRjXRItLp7OOel2SyrLf2DmZ0te7WioUHyx4rYH6duZ4iL4phRWRiiKyTnup2VbsemMYcdOUPKSp3dRTI5fLRyupquvRWBoZOm11PHF9OotLfbfCenrM/991wiX62Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b71787-d36a-40c5-1d8c-08de9086cd11
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 07:09:37.3289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVwch/a+EoQJmhEk2dA+WcqFfRf09ZpIRBKKj9YCibhK6RPbQQZ6xTzenIrtyAQtLz3EqCUWBvrY+qyI7kbnCHmahLl0cWZy1fHIX3cXjdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6319
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

T24gTW9uLCAyMDI2LTAzLTMwIGF0IDA4OjAxICswMDAwLCBTb2JpbiBUaG9tYXMgd3JvdGU6DQo+
IEFkZCBfX3hlX3ZtX2JpbmRfbHJfc3luYyBoZWxwZXIgZnVuY3Rpb24gd2hpY2ggcmV0dXJucyBz
dGFuZGFyZCBlcnJvcg0KPiBjb2RlcyBpbnN0ZWFkIG9mIGFzc2VydGluZyBvbiBmYWlsdXJlLiBU
aGlzIGFsbG93cyBjYWxsaW5nIGZ1bmN0aW9uDQo+IHRvIGhhbmRsZSBWTSBiaW5kIGZhaWx1cmVz
IGV4cGxpY2l0bHkgd2hpbGUgcHJlc2VydmluZyB0aGUgZXhpc3RpbmcNCj4geGVfdm1fYmluZF9s
cl9zeW5jKCkgd3JhcHBlciBmb3IgdGVzdHMuIFRoaXMgZW5hYmxlcyBjYWxsZXJzIHRoYXQNCj4g
ZXhwZWN0IGJpbmQgLyBvdmVyY29tbWl0IGZhaWx1cmVzLg0KPiANCj4gdjc6IEludHJvZHVjZWQg
eGVfdm1fYmluZF9scl9zeW5jX2ZhaWxhYmxlIChUaG9tYXMpDQo+IHY4OiBNb2RpZmllZCB4ZV92
bV9iaW5kX2xyX3N5bmNfZmFpbGFibGUgYW5kIHhlX3ZtX2JpbmRfbHJfc3luYyB0bw0KPiBjYWxs
DQo+IMKgwqDCoCBfX3hlX3ZtX2JpbmRfbHJfc3luYw0KPiB2OTogUmVtb3ZlZCByZWR1bmRhbnQg
dHlwZWNhc3QgYW5kIHJlbW92ZWQNCj4geGVfdm1fYmluZF9scl9zeW5jX2ZhaWxhYmxlDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTb2JpbiBUaG9tYXMgPHNvYmluLnRob21hc0BpbnRlbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQoNCg0KDQo+IC0tLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5jIHwgMzUgKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4gwqBsaWIveGUveGVfaW9jdGwuaCB8wqAg
MiArKw0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmMgYi9saWIveGUveGVfaW9j
dGwuYw0KPiBpbmRleCBlYTNmMmZjYWEuLmRhYTcyNWQwYyAxMDA2NDQNCj4gLS0tIGEvbGliL3hl
L3hlX2lvY3RsLmMNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmMNCj4gQEAgLTgyMiwyMyArODIy
LDM4IEBAIHZvaWQgeGVfdm1fbWFkdmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRf
dCBhZGRyLCB1aW50NjRfdCByYW5nZSwNCj4gwqB9DQo+IMKgDQo+IMKgI2RlZmluZQlCSU5EX1NZ
TkNfVkFMCTB4Njg2ODY4DQo+IC12b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQz
Ml90IHZtLCB1aW50MzJfdCBibywgdWludDY0X3QNCj4gb2Zmc2V0LA0KPiAtCQkJdWludDY0X3Qg
YWRkciwgdWludDY0X3Qgc2l6ZSwgdWludDMyX3QNCj4gZmxhZ3MpDQo+ICtpbnQgX194ZV92bV9i
aW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDMyX3QgYm8sIHVpbnQ2NF90DQo+
IG9mZnNldCwNCj4gKwkJCSB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0K
PiBmbGFncykNCj4gwqB7DQo+IC0Jdm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9IG1hbGxv
YyhzaXplb2YoKnN5bmNfYWRkcikpOw0KPiArCXVpbnQ2NF90ICpzeW5jX2FkZHIgPSBtYWxsb2Mo
c2l6ZW9mKCpzeW5jX2FkZHIpKTsNCj4gwqAJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7DQo+
IMKgCQkuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gwqAJCS50eXBlID0gRFJN
X1hFX1NZTkNfVFlQRV9VU0VSX0ZFTkNFLA0KPiAtCQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigo
dWludDY0X3QgKilzeW5jX2FkZHIpLA0KPiArCQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcihzeW5j
X2FkZHIpLA0KPiDCoAkJLnRpbWVsaW5lX3ZhbHVlID0gQklORF9TWU5DX1ZBTCwNCj4gwqAJfTsN
Cj4gLQ0KPiAtCWlndF9hc3NlcnQoISFzeW5jX2FkZHIpOw0KPiAtCXhlX3ZtX2JpbmRfYXN5bmNf
ZmxhZ3MoZmQsIHZtLCAwLCBibywgMCwgYWRkciwgc2l6ZSwgJnN5bmMsDQo+IDEsIGZsYWdzKTsN
Cj4gLQlpZiAoKnN5bmNfYWRkciAhPSBCSU5EX1NZTkNfVkFMKQ0KPiAtCQl4ZV93YWl0X3VmZW5j
ZShmZCwgKHVpbnQ2NF90ICopc3luY19hZGRyLA0KPiBCSU5EX1NZTkNfVkFMLCAwLCBOU0VDX1BF
Ul9TRUMgKiAxMCk7DQo+ICsJaW50IHJldCA9IDA7DQo+ICsNCj4gKwlpZiAoIXN5bmNfYWRkcikN
Cj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ICsJV1JJVEVfT05DRSgqc3luY19hZGRyLCAwKTsNCj4g
KwlyZXQgPSBfX3hlX3ZtX2JpbmQoZmQsIHZtLCAwLCBibywgb2Zmc2V0LCBhZGRyLCBzaXplLA0K
PiBEUk1fWEVfVk1fQklORF9PUF9NQVAsIGZsYWdzLA0KPiArCQkJwqDCoCAmc3luYywgMSwgMCzC
oCBERUZBVUxUX1BBVF9JTkRFWCwgMCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZ290byBvdXQ7DQo+
ICsNCj4gKwlpZiAoUkVBRF9PTkNFKCpzeW5jX2FkZHIpICE9IEJJTkRfU1lOQ19WQUwpDQo+ICsJ
CXhlX3dhaXRfdWZlbmNlKGZkLCBzeW5jX2FkZHIsIEJJTkRfU1lOQ19WQUwsIDAsDQo+IE5TRUNf
UEVSX1NFQyAqIDEwKTsNCj4gwqAJLyogT25seSBmcmVlIGlmIHRoZSB3YWl0IHN1Y2NlZWRzICov
DQo+IC0JZnJlZSgodm9pZCAqKXN5bmNfYWRkcik7DQo+ICtvdXQ6DQo+ICsJZnJlZShzeW5jX2Fk
ZHIpOw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVfdm1fYmluZF9scl9z
eW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLCB1aW50NjRfdA0KPiBvZmZzZXQs
DQo+ICsJCQl1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncykN
Cj4gK3sNCj4gKwlpZ3RfYXNzZXJ0X2VxKF9feGVfdm1fYmluZF9scl9zeW5jKGZkLCB2bSwgYm8s
IG9mZnNldCwgYWRkciwNCj4gc2l6ZSwgZmxhZ3MpLCAwKTsNCj4gwqB9DQo+IMKgDQo+IMKgdm9p
ZCB4ZV92bV91bmJpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50NjRfdCBvZmZz
ZXQsDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwuaCBiL2xpYi94ZS94ZV9pb2N0bC5o
DQo+IGluZGV4IGI2MmQyNTlmZC4uMmU0YmQzYjUwIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVf
aW9jdGwuaA0KPiArKysgYi9saWIveGUveGVfaW9jdGwuaA0KPiBAQCAtMTE3LDYgKzExNyw4IEBA
IHN0cnVjdCBkcm1feGVfbWVtX3JhbmdlX2F0dHINCj4gwqB2b2lkIHhlX3ZtX2JpbmRfbHJfc3lu
YyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBibywNCj4gwqAJCQl1aW50NjRfdCBvZmZz
ZXQsIHVpbnQ2NF90IGFkZHIsDQo+IMKgCQkJdWludDY0X3Qgc2l6ZSwgdWludDMyX3QgZmxhZ3Mp
Ow0KPiAraW50IF9feGVfdm1fYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQz
Ml90IGJvLCB1aW50NjRfdA0KPiBvZmZzZXQsDQo+ICsJCQkgdWludDY0X3QgYWRkciwgdWludDY0
X3Qgc2l6ZSwgdWludDMyX3QNCj4gZmxhZ3MpOw0KPiDCoHZvaWQgeGVfdm1fdW5iaW5kX2xyX3N5
bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0X3Qgb2Zmc2V0LA0KPiDCoAkJCcKgIHVpbnQ2
NF90IGFkZHIsIHVpbnQ2NF90IHNpemUpOw0KPiDCoCNlbmRpZiAvKiBYRV9JT0NUTF9IICovDQo=
