Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B92FC5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 22:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B4510E0E1;
	Wed, 28 May 2025 22:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQPDfTHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CB610E0E1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748471788; x=1780007788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/0gLuo4FUsrwF6eKp2JyK0pghSRiWwnD4jzknQQuJGs=;
 b=GQPDfTHkHwT+bxWgotXe2QA8TtWPSKohqfI/oySkqpjOT6gi5dDvJEgc
 21xCOGRcgEbz/NHQOqyn8lt4QkdRKIIecfv9qyQqzBah2rOOegudo1e9h
 d5UnT1kQqvFtqWJRrqvxTcc5mAnbdINqRspbZ6BzAfanbEZGID3giGVtX
 I3lLiXyNZ0Em+XuvMzmnMCJiqqKHhdcpihY5pQ/OJR5nOK716cmMPXN22
 tlOr6xMYvDwRXlwdIMiDe20QQlq2VXpCttGrotKpoN9rKqeWnWwiM4TgK
 5dSKDEVwICkJm6y62TdUdzCpH5KKHHUWg+1tohj8dCHMZWxDnz6GiCyWX w==;
X-CSE-ConnectionGUID: 4RAxFnSaSriXeyFw1ysM8Q==
X-CSE-MsgGUID: ZQ+07l4QTMa4/8vqIxOxbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61870251"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="61870251"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:36:26 -0700
X-CSE-ConnectionGUID: 0ZO6jxvETpmDskb8SV+ptg==
X-CSE-MsgGUID: /l/+MmjwSvmR1gyCkmij0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="174255464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 15:36:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 15:36:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 15:36:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.71) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 15:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7TBLttz+FbOLD2BqzNqnmOVTFwYgRY3FyshGr8p5WWMwwjW0HefYwsLxtGFSJjEYIXJI4hodTp92GFPikhtVkmHaNNW1QleZVdhUP8/DD9YXf6lXePk6Hq3GdG+boHCN6aZI2yBQMP+iZyuOZjFA5OKg+GXw2cq6ZoP3jA5+5dSy+fc0dyzXFjGX24ba9bSER5dvixmZg2GyE/NE5ZGIZLgBATCI4ser3CWAQ8K1T9XGUSsjy88miululSlDzBO2F754+/gF7VwcLy9PQu1vd5taplBfOud2SJOjrlu5KmvAuPjXJOrIyibSfYy4PhUHTgplVGud2nSkxaGH/YgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0gLuo4FUsrwF6eKp2JyK0pghSRiWwnD4jzknQQuJGs=;
 b=cl1dMQ2Pw3cABDB4vKZvTU95S3LO+dC35kZJKWaQHaaRQA0qDnDl/8CB3akLeQWlvYKUo4k1AYrKr3TjSsDcQjGTR/jyvX0onXIXka9R2X5DLmnuYOR4Cn+mpS4s3uuav+XYWiw1evC3o9gWb0VY/A2+o266Lg3QGXr2i2VvkC2idd8pzsu0Fdxvsw0cRWmkkMYiCes/Ct/iq6nK2PxOWFYTJ0YMn406XG6vxlCv22KS7ZX54nKa8LvmCIXC7OJZKYsblW9RbFPhKhm9FWnpR9v6svHudSJrAhbPlxW59GLi80+f+e/QILpN0x/+YoHPM97KJfU6mJlBjdLf43NtqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ0PR11MB5072.namprd11.prod.outlook.com (2603:10b6:a03:2db::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 22:36:17 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 22:36:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable
 activity stats error
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore enable
 activity stats error
Thread-Index: AQHbz9J3J5RieLbmwEyA5/q1tbMsIbPoll6AgAADVoA=
Date: Wed, 28 May 2025 22:36:17 +0000
Message-ID: <CH0PR11MB544432177919DE6B16FF8A70E567A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250528133049.8975-1-satyanarayana.k.v.p@intel.com>
 <aadfb113-f41c-4d31-8f7d-31778aa0bef5@intel.com>
In-Reply-To: <aadfb113-f41c-4d31-8f7d-31778aa0bef5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ0PR11MB5072:EE_
x-ms-office365-filtering-correlation-id: 43a4f4a6-cd05-44cd-87bc-08dd9e380f8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Mk1vZmpEbTRyQVZKZTZsTmdYYWdTVU5QQkdvdFpsaThtemdjd1U0U3N0dUFx?=
 =?utf-8?B?QTkzVmUvR1VXbHVzc2J4VXM2N3d6REpsaEc1RzVaRXBuQmwxeE5iUndxYyts?=
 =?utf-8?B?Q0YxYmRCUzhFT0p6dGQzSVpCYjNqc1dyc09BU2NOMU01RjhiMWFmenI3aVly?=
 =?utf-8?B?K3VuUjFkR3phR2duVDlVb2ZZNkp1WXJGL2tQNGhDLzdQMXVFTHBidWdpWkxr?=
 =?utf-8?B?cUZ5eWkrQkZSWjFTb0tYWGs3ekF2dFMrbEdOdlE0dEQrN3ZxQVAvRk92VXZW?=
 =?utf-8?B?MENTcFF3ZXg0a21wU280VmZHblBnNXRRZm93RTVDYm9QcUJMN25IaHVlNlhl?=
 =?utf-8?B?VDR1aE5RYURoWi9mZi9KQkhDelNqOE8yZWdwSEY3TnJYV3BNNFlUN0kvSmZ6?=
 =?utf-8?B?YTRaaGV0ZFpmSm1sdGlzUUlweG9xM3hhZERtMnY3cnliZEMvdWZjemVKeWRX?=
 =?utf-8?B?bHI3RWh0U2RKb3RIaEQ2ZnhHc1RkbTJ4M2RLY3BsaXNTOURSdUVWSzZkN25Y?=
 =?utf-8?B?aHJSNk1ZMDZEeWpDOU93UDZMZUUxeW5rNkRZWmp1a29BWndtb0hzQU1iQUpJ?=
 =?utf-8?B?eWdiRnhtY1lQYS9JNGlhNEdMNWoydkpEREs3RkFBcmJkUXMvNEg1ZEN1Mms0?=
 =?utf-8?B?NUREL0I1bWd6bmZIbFc3Uk1HUDI1a1I0QUhReGg3K1R6dzdjdUJFK1FPNDdv?=
 =?utf-8?B?cTlJY2hNRFlFalVIeFNSMW11Q1g3OTZ2cGF3YytxM3V3MFFrVm45dXpJSGMv?=
 =?utf-8?B?QWpjMlBjMkxLZ2lrQ0Z1WEV0MTdjWW4vWStuUEZWUkZuN3dzREVnblI2dkY0?=
 =?utf-8?B?cWRiTjcwajQ2Ymd1SDVwZzREb2NlbWM0WHBaZC9zZ2pCRlc3UDBqQjdjUW9l?=
 =?utf-8?B?bUN3R29ESlRmc0NNNmRKcmNBeFE1aGVyb2FRL2lacnpXcGVJSG9oYXZmdkRV?=
 =?utf-8?B?dzYxYjhGdzdCRnV5OVk4Slgwd1lPWWxlWHlVZC9NaVBSa29vMlA0amc2dTRL?=
 =?utf-8?B?ODRoK1E1YnJja3lWTjAvb3RjQUFMcEEyZWh6L1NWY3pzYWUwbFFnSXd6Vmxt?=
 =?utf-8?B?eCtSZVpzdmUxaUVjV0xJNGg0cjVFWE1pOTlJQ0d0UVplZUJRKzBKd25SOVVP?=
 =?utf-8?B?WThlRHRaM2gyUVgwbW1WOVArVVo0cnVHSjZzKzhsVW8wTDlsVVI4ZlJSaXRQ?=
 =?utf-8?B?OEpidnd1Tzlaak1Hb0krWUJlR0pWd1RMcEpBUWo2TTN1K3RnQytGMmpUMUtq?=
 =?utf-8?B?Vi9tMnIvU3hGVU5iMjd2R0xmelRzRHpPMEZYZGFlOUdsaDN5ZzFMeUFSdlVh?=
 =?utf-8?B?UEttTkFsSldjVEZHTncvcWlTcHlWYVNSRTRuQzBYRXlXVGVvdEc3T0YwRmN4?=
 =?utf-8?B?VU5aUURoS05UdjlHNmowVW9oMjdvZURxU0JGdWtoemtLUWhMaTJWSDlnNFM5?=
 =?utf-8?B?ZzVYQkZkU1Z3YmhrRDQ2TE1kRjBjaDQ2RmREbkJEV3RpSUR0UXhuekM4eENE?=
 =?utf-8?B?MUlkK0VXWC9zNFVJSGRwaW5XU0NQOGl0RWR6TWpDbk8vcUJqT01udUtJWXFW?=
 =?utf-8?B?SmhVWW9zY0F1VTlYd0M1UVJRR2grVVMvaGdVTk44b1Y3anMwTWtjYWhBQmJt?=
 =?utf-8?B?d3BZWDdLL2x0NUdiN3p0TE5DTm9KWW9zblV4Um5WQUxoZ0R1a0tjaDNKRWM5?=
 =?utf-8?B?dzZuVUcveGloSnVnaWtIVFp0c041RUQ1c2FuVGdYZUJ1MGdqaklWWkUwOEpE?=
 =?utf-8?B?WHVtUE9rTmtyV3R3elpGY01kdysxaDdyemszL0xYQlkrUE5uL3FGQVNCcktl?=
 =?utf-8?B?YXR6empaMDF6M2JlaW05aVpMQk80WFd4b0FOdllIQm1MY0Y1UlU0QjZzY244?=
 =?utf-8?B?a3cyTDBXdmhGbXBCUVhHWU5hSXhOR1g0S1ZWMHp3dHEzbXNDcXJaN3gyem0z?=
 =?utf-8?B?VmpOMnRQRHUvcDhkRE85NlJBSmFnTFVDdElra0N6YVF6Ni92eFZyQlh5dFNY?=
 =?utf-8?Q?LUMysLrHwhMhYVeTf5CZKL3P+N9gx8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXIyYnhSSTIxdFlTd2FGT2l5VG95SE1IUTlSQS9ueUN1M2pVdDh4bGVnZWdF?=
 =?utf-8?B?VHErN2VoaytZbUJnL1g1alUweUdCMk9tRmpOS2p6RnVpdFlkMW4wZHZQU3Zz?=
 =?utf-8?B?MjRYd3hMd3pxTStqdnROL3BhOGZxcWJUMUtBejQxWnNMWUxSNnlHc09welJZ?=
 =?utf-8?B?RTdvMFB0OTVndmZ6WUlDMjZ0TXlZcC9WcVcvVmtmSkRDcldSQnNEVFpXNGo0?=
 =?utf-8?B?RDA4anNjYndmYk1EbjZveUc1WGNSbzNxL2U3ZmQ3QUt0cUhvM2cvZTV0U3pF?=
 =?utf-8?B?d1M3MWk5c1dwTERxZkhhdlR2dG5yTnRCN041Q3ZJRW8ycEE5M2pRTGQ4anhZ?=
 =?utf-8?B?cm5BRTc3eG1meVhhOFVZQ3VmelJqMU5Qb2J0bG9qZDlGZHdEcm9vMlExeEJ1?=
 =?utf-8?B?MnBndVpCd3E1azVWYWpNQ2pDb3gyZlpVeldtcURsNU8rc0FxY3JDZHN1RTFv?=
 =?utf-8?B?Ni96M0FPSVJjKzlOQUlSaUp3VzlMMjQyVGNtdDZmallud2JzWUhVMVVVOTQ3?=
 =?utf-8?B?bVp3K0xvY1IxcmZ2UXg3VmZxK0FKYXZ6Y29PdU0wejJOZzI0aWVJTVMzQnJn?=
 =?utf-8?B?VVFoUFgva0ZWR2FpQWtKTzl4ZGk2cFM5NXRUc21FaU9mbi93Unc3WVhqN1FK?=
 =?utf-8?B?MFU3UW9WY1ZEamFab0owOWVoYm02SVFkRkhrd0FLakRuTnJLUEtMZXZ5eVR0?=
 =?utf-8?B?UGMrd3VXeGFDRXhINjdqWjAzRnU3ekhIWkxYU0NhTVA3cmhrMllVYldvajRT?=
 =?utf-8?B?Z3Q0OFhHalExYmM1bm5aSlR0ZS9vMDlNOFFBcVFCcmQrVzV0bVRBK09rLzFY?=
 =?utf-8?B?WUpyQytyaVlkenNYNUJrR1BaNW4ydlJDSFdRZzBUSGRnUXQzSGs2LzgvUTg3?=
 =?utf-8?B?NmxOTTJtbFNwM2JFYzg1dkFTMmpCUUFHazNvQnhmM2dZRVpEMG5tc2FrVzFp?=
 =?utf-8?B?U3BUcWNvZ3QxRGVmYUwvWW5IckhTZ1hHZUxKWkZQWFBSNU4xcHRlV0JJRmZr?=
 =?utf-8?B?M3NOY3dSYTZJbFF1QjZmNHN2cCtJdzkraFRCcXcwTTlRSlkwUzI5a0RMTjVy?=
 =?utf-8?B?cytFRWtTeXJkMEt0Z25MNUxNc2I2d2JVdkhtMFJSV3hHRkZ6d09FMVBsRDBJ?=
 =?utf-8?B?bklmaXdqVkhzbXljdDNoQThpY2thcGE0Tk9VU0thTWdxUEh1VHpDREVIcDZr?=
 =?utf-8?B?cnQ5ZkF6VWMwcWN0Mm9lT2s4RXhNbWE2eFZzd29idm1RWVRxTGQ3cmJGczlG?=
 =?utf-8?B?T1c2REhFQXR2U1Zja254dzdOVnphQXhxUFViNE1BK3pGa2szOTJTL05UOWRS?=
 =?utf-8?B?ZTFGb3pWY3ZIalg0dmRWckJqR3dHL0tYOERsSGNoZ2U1dzFVZUUyV3NVZ1VW?=
 =?utf-8?B?cGpjY2UxdnZCbTRUcndyaS91S2J4cVhneDdoak0yK2Z6U2Vna1EyVzE1akdz?=
 =?utf-8?B?QzRzcllTdDVIb203dVdaRHdhaDMzOXJ2eFMvNXlrUGlxNWJCa3NodnhFSnY3?=
 =?utf-8?B?UUM2aGs3Y1RuWklKQ3poQ3hSVXpKdk1tUlVyd0VwQXRLcXJEQzByUWc5VDdT?=
 =?utf-8?B?dW54UW1IL1BTQjJvU1k0dmFSeHBvN3dSWUNHRFhJckJtSURYQktoZUdPWUFR?=
 =?utf-8?B?akJZQzFNZE5Td3VPdmZKejdXNWRuSFlLdG9mV2o1R0lNV3l0UGVsbkduTEFX?=
 =?utf-8?B?VnJic2hEV0FobUhnMlJ4VU5rSTc4bVJQNU1wMkVEZUNWcG5oV2tlQ05YVjVC?=
 =?utf-8?B?WjRvbUQzeEpvalpPZHJ6T1grUmgvdjRtei85bVpDYnpYOE9kODEwK0NkWkl4?=
 =?utf-8?B?WWFkOHhCa2lPcmw3UkVqTGkxMzVLNkEwWUI1NGo3SmovY1hGcWdFU2hZNTJV?=
 =?utf-8?B?ZjBBblNNbXJYaDRkMXNIRmVIc3B2SUJia0ZWcTVPN2h3bGpNeTNDMmxabGNQ?=
 =?utf-8?B?L2xuQzZmYnkzQWV5aENWRGZwRUFaU05waHQvT3VQaTVpSnR2WlhhRS9MUExz?=
 =?utf-8?B?aFJmSjFHNC95NXFzbHRzYTNxaVg0LzZ1azE5MEUzS2M4NnJiNUdHN1BvcGJv?=
 =?utf-8?B?R3NBZXBqWUdnL2hHK04wU1M0VHBKTWQzVVJxMHlzQnVsS3pZdkNsVW9Hdnph?=
 =?utf-8?Q?edIb+s9N46019mle7Zvmv4qxC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a4f4a6-cd05-44cd-87bc-08dd9e380f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 22:36:17.2462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TD2IF3rAxBDKhrFSz5mD0yflXs5a3Rrw9jvfNp3PRFs0yUsKSonDmVqYLk403eF9SV18I0Sj3GBbpniL9W7siVCjP35160R12/hO5wJZ0N8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5072
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyOCwgMjAyNSAy
OjU0IFBNDQpUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50
ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERlIE1hcmNoaSwgTHVjYXMg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+DQpDYzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT47IEhhcnJpc29uLCBKb2huIEMgPGpvaG4uYy5oYXJyaXNvbkBpbnRlbC5jb20+DQpTdWJqZWN0
OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb246IElnbm9y
ZSBlbmFibGUgYWN0aXZpdHkgc3RhdHMgZXJyb3INCj4gDQo+IE9uIDI4LjA1LjIwMjUgMTU6MzAs
IFNhdHlhbmFyYXlhbmEgSyBWIFAgd3JvdGU6DQo+ID4gQWRkIHNvbWUgbW9yZSBHdUMgZmF1bHQg
bWVzc2FnZXMgaW4gdGhlIGRtZXNnIGlnbm9yZSBsaXN0Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPg0K
PiA+IC0tLQ0KPiA+IENjOiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQo+ID4gQ2M6IEpvaG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jIHwgMSArDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyBiL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jDQo+ID4gaW5kZXggZjliZDVjNzYxLi40Y2E4YTM0YmYgMTAwNjQ0DQo+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC04NSw2ICs4NSw3IEBAIHN0YXRpYyB2b2lk
IGlnbm9yZV9mYXVsdHNfaW5fZG1lc2coY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4g
IAkJc3RyY2F0KHJlZ2V4LCAifEdUWzAtOWEtZkEtRl0qOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSB1
QyAuLUVOT01FTSIpOw0KPiA+ICAJCXN0cmNhdChyZWdleCwgInxHVFswLTlhLWZBLUZdKjogRmFp
bGVkIHRvIGVuYWJsZSBHdUMgQ1QJLi1FTk9NRU0iKTsNCj4gPiAgCQlzdHJjYXQocmVnZXgsICJ8
R1RbMC05YS1mQS1GXSo6IEd1QyBQQyBxdWVyeSB0YXNrIHN0YXRlIGZhaWxlZDoJLUVOT01FTSIp
Ow0KPiA+ICsJCXN0cmNhdChyZWdleCwgInxHVFswLTlhLWZBLUZdKjogZmFpbGVkIHRvIGVuYWJs
ZSBhY3Rpdml0eSBzdGF0cy1bMC05XSoiKTsNCj4gDQo+IGFyZSB3ZSByZWFsbHkgZ29pbmcgdG8g
YWRkIG1vcmUgYW5kIG1vcmUgc3BlY2lmaWMgZXJyb3IgbWVzc2FnZXMgdG8gdGhlDQo+IElHVCBm
aWx0ZXIganVzdCB0byBtYWtlIENJIGhhcHB5PyBub3RlIHRoYXQgdGhpcyBjb3VsZCBiZSBuZXZl
ciBlbmRpbmcNCj4gc3RvcnkgYW5kIHN0aWxsIHZlcnkgZnJhZ2lsZSB0byBhbnkgY2hhbmdlcyBv
biB0aGUgZHJpdmVyIHNpZGUgaW4NCj4gZnVuY3Rpb25zIG9yIGNvbXBvbmVudCByZW9yZGVyaW5n
IG9yIGltcHJvdmVtZW50cyBpbiBtZXNzYWdlcyBvciBkcml2ZXINCj4gYXR0ZW1wdHMgdG8gcmVj
b3ZlciBmcm9tIG5vbi1mYXRhbCBlcnJvcnMNCj4gDQo+IGNhbid0IHdlIGp1c3QgaWdub3JlICpB
TEwqIGVycm9yIG1lc3NhZ2VzIGR1cmluZyBmYXVsdCBpbmplY3Rpb24gdGVzdHM/DQo+IA0KPiBh
ZnRlciBhbGwsIGFzIHdlIGFyZSBpbmplY3RpbmcgZXJyb3JzLCBvdXIgb25seSBleHBlY3RhdGlv
biBzaG91bGQgYmUNCj4gdGhhdCBkcml2ZXIgd2lsbCBub3QgY3Jhc2ggb3IgaGl0IGFzc2VydHMs
IHJlZ2FyZGxlc3MgaG93IG1hbnkgZXJyb3INCj4gbWVzc2FnZXMgd2lsbCBiZSBwcmludGVkIGlu
IHRoZSBtZWFudGltZSwgYXMgd2UgZG9uJ3QgZXhwZWN0IGVycm9yIGZyZWUNCj4gcnVuIGhlcmUg
YW5kIHdlIGNhbid0IGV4cGVjdCBzcGVjaWZpYyBlcnJvciBtZXNzYWdlIGVpdGhlcg0KDQpUaGlz
IGlzIHByZXR0eSBzaW1pbGFyIHRvIHNvbWV0aGluZyBJIHdhcyBnb2luZyB0byByZW1hcmsgb24g
d2hlbiBJIHdhcw0KcHJvdmlkaW5nIG15IFJCIGZvciB0aGlzIHBhdGNoIGVhcmxpZXIsIGJ1dCB0
aGF0IEkgZWxlY3RlZCB0byBjdXQgZnJvbSBteQ0KZW1haWwuICAgQmFzaWNhbGx5LCB5ZXMsIGl0
IGZlZWxzIGxpa2Ugd2UncmUgcGxheWluZyBhIGNvbnN0YW50IGdhbWUgb2YNCmNhdC1hbmQtbW91
c2Ugd2l0aCB0aGVzZSB2YXJpb3VzIEd1QyBlcnJvcnMsIGFsbCBmb3IgdGhlIHNha2Ugb2YgbWFr
aW5nDQphIGxpbmUgb24gYSBiYXIgc2xpZ2h0bHkgbW9yZSBncmVlbi4gIEFuZCB0aGUgZW5kbGVz
cyBwdXJzdWl0IG9mDQpzdXBwcmVzc2luZyB0aGVzZSBlcnJvcnMgaXMganVzdCBnb2luZyB0byBj
YXVzZSB0aGUgcmVnZXggbGlzdCB0byBiYWxsb29uDQpvdXQgb2YgY29udHJvbCBldmVudHVhbGx5
Lg0KDQpIb3dldmVyLCB3ZSdyZSBjdXJyZW50bHkgIm9ubHkiIHN1cHByZXNzaW5nIDUgb3IgNiBl
cnJvcnMsIGFuZCBJIGRvbid0DQp0aGluayBzdXBwcmVzc2luZyBldmVyeSBkbWVzZyBlcnJvciBo
ZXJlIGlzIHdpc2UsIHBlciBzZSAoRS5HLiwgaWYgd2Ugc2VlDQphbiBlcnJvciBvbiBhIG1vZHVs
ZSB0aGF0J3MgbG9hZGVkIGJlZm9yZSB0aGUgR3VDIG1vZHVsZSBkdXJpbmcgdGhlDQpHdUMgZmF1
bHQgaW5qZWN0aW9uIHRlc3RzLCBJIGRvbid0IHRoaW5rIHRoYXQnZCBiZSBleHBlY3RlZC4gIEFu
ZCBpZiB3ZSBmYWlsZWQNCnRvIGluaXRpYWxpemUgdUMgZm9yIG5vbi1FTk9NRU0gcmVhc29ucywg
dGhhdCB3b3VsZCBhbHNvIGJlIGNhdXNlIGZvcg0KY29uY2Vybiwgbm8/KS4NCg0KQnV0IGZvciB0
aGUgc2FrZSBvZiBhcmd1bWVudCwgdGhpcyBpcyB3aGF0IHRoYXQgd291bGQgbG9vayBsaWtlIGlu
IGNvZGUgKEkgdGhpbmspOg0KDQoiIiINCnN0YXRpYyB2b2lkIGlnbm9yZV9mYXVsdHNfaW5fZG1l
c2codm9pZCkNCnsNCgkvKiANCgkgKiBGYXVsdCBpbmplY3Rpb24gdGVzdHMgc2hvdWxkIG9ubHkg
ZmFpbCBvbiBoYXJkIGVycm9ycyBhbmQgY3Jhc2hlcy4NCgkgKiBJZ25vcmUgYWxsIG90aGVyIGRt
ZXNnIGVycm9ycyBhbmQgd2FybmluZ3MuDQoJICovDQoJaWd0X2VtaXRfaWdub3JlX2RtZXNnX3Jl
Z2V4KCIuKiIpOw0KfQ0KIiIiDQoNCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gPiAgCX0NCj4g
PiAgDQo+ID4gIAlpZ3RfZW1pdF9pZ25vcmVfZG1lc2dfcmVnZXgocmVnZXgpOw0KPiANCj4gDQo=
