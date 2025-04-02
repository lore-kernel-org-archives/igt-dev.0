Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A890C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A2610E082;
	Wed,  2 Apr 2025 06:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GgVnTZdE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA4110E082
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743574866; x=1775110866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RH3Z1fGM1nKDb+hQqheV4Lezt3dV6GKQElgqnDjw2ko=;
 b=GgVnTZdEDAXoPcOYPLQtnRQoxXzhuQGJU1BYx9pX2Lf7rDxPkwLv4Wtq
 b4SWCih4nhYMfLDrFtGxfRJhLxZCHfU6CTFWG3Sk0jpOMldMQcNespSuz
 UWJXjz0Z7SWhk81yg7AMAsgIXi8B5fUxSY2tpureHRkXOwZvt7R0VrB7T
 gvBLcAdDnalpGro9S42E+/ngYpBOeN5OLBoF7K74oJA8HMkhDpk8LJ3C3
 XSx3h9RBwgc2VBghKLy88ZQFU/Tbv77urjNPDYXsT1SXgEm/2IFbIJzOf
 vbtrIzZSnB5riNCGZaw2muO/3S7haSrilghQRYKjBi3MejmDsXOyB5Xgx A==;
X-CSE-ConnectionGUID: ISZODKU4QSSzjuM/KJ02tA==
X-CSE-MsgGUID: Lj69lGFOQOOLQ3UFqaVtpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="56289006"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="56289006"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:21:06 -0700
X-CSE-ConnectionGUID: 96LM+d8aSQGtt/UQ8iL9tA==
X-CSE-MsgGUID: +V1AvxElTR6XNu0vgW396w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="131326303"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:21:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 23:21:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 23:21:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 23:21:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp4+uBSFBBAcESW8ASTJzTuXdjiMwEn9ko6ffJ4/SyoCqZ7KmtiHsiZBTYkKLKksDUpK1xkBrX27XL8Vzqdvu7WkBGP3JQRgl5VgZyEIQwySvyvY9Eno9KAhXGmZk4ZaplLovhUCpeTagvcNKNqizuWjS+BWPAkSM/2NzkE/ZZhe/r30dqOrRiVEFM/XRXVBwYrJ+vs3yaIbvfPzqxgUY/h/JWGro7lUC+/N+C5hz2WbbkHmW0eAz4pN0naPQI7cSq1BkzvlNCH8NN1ZWsahavv6g3trwhVQcdg7W3hXCdNeaQ17x+nHVfXdEeXhSBCGcDtcL5qxFArxBXlfUyVehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH3Z1fGM1nKDb+hQqheV4Lezt3dV6GKQElgqnDjw2ko=;
 b=gXvFyDG24kl0x07nlQPGoQCrgEEcRJuG6U/S9BlBHZQNiNTgW4LGZ6nOTF73KrWR/6bs9/8tnG8Y9Add37ggOImD67881lrpvpMAugvozK3RZtK3lpuM36x0YRCE9wCvfgr4biCkz9JdWxdlLhJKIk8kIphJp+WFmKl77JGJo0iJPNMajwupJsUXj4Llb3H7Z97TJzAjCx1hol3YRgViOx7JPT0VWkzwObBARyb86K4kTppRGBWZiTKcy0TV7yU1okVyFnsj9GvlQjqDhokuWgyOBeOaWKfzSVtCRKIK303YiwU5tTazIKMCxtIZ01vFkmRvnU1NV3mG7hEZmZB6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 06:20:46 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:20:46 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH 4/4] xe_exec_nop: create xe_exec_nop
Thread-Topic: [PATCH 4/4] xe_exec_nop: create xe_exec_nop
Thread-Index: AQHbo5U7TuJum2iO/k+9PaB7qPsqlrOP5r3Q
Date: Wed, 2 Apr 2025 06:20:46 +0000
Message-ID: <CH3PR11MB8434A7C9F41C7DB4AA9C06F38DAF2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250402061033.659931-1-pravalika.gurram@intel.com>
 <20250402061033.659931-4-pravalika.gurram@intel.com>
In-Reply-To: <20250402061033.659931-4-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW4PR11MB6764:EE_
x-ms-office365-filtering-correlation-id: 95ac6efc-6790-41c7-1b0f-08dd71ae816d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|10070799003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?bENibEI4TUczdkExeGxpeWpkR0EwRDhqamIweFRmdU9uN2dlUDhKK2NwaVQy?=
 =?utf-8?B?Z0d4cWgxaFdUUE45RGRKcnBMRUJRbjV3Tk5pUTRkZE01NFZtQWtBY0hpckJa?=
 =?utf-8?B?WFZ4dUN2OWwwSnNhQXdUTDJkbTdHUUxNTk94T1ZEVUFEak53U296SHlWOEI1?=
 =?utf-8?B?OERkYmJ6TGVTbG1iTHdJSUNRaEFhUG9sKzV2SzBBUmNoNUUwT2dMd2VrZnJW?=
 =?utf-8?B?OE9Jc2owOGlkK1dSQjNTZEhQek5RQ2VUQjdOYUsyYmJVQytQcjArUzlCZ1I1?=
 =?utf-8?B?L3IvN1p0Y0JsZXlBSnVmMXN1YXNEOVREd2kvQ0NYRlpnWDRYalhsVDh0VThz?=
 =?utf-8?B?NHVWQjIzcjg2OWhNRGZ5bWhIbG5KL21YbjVmbVptaGQ3SGx6eURoTWcxei93?=
 =?utf-8?B?akF5dmdFYk9ESlhLeWpJS1ZKY05wQWdBbmRiUHFCYWxVT3lEbk5aT1JLcGRS?=
 =?utf-8?B?THpLaHB5QVNkTDQ4azBGTGdzOXRib0J0R21YMzQxc3F6eU94ZS9DM0dWRzJF?=
 =?utf-8?B?aHJOR2dlYnY0MWlYdTMvbG9oTktGVFdnelBhUit3K21nUTBnelRDZCtmcndm?=
 =?utf-8?B?ZFRhZ1pSMmI4SVZzUUx1aDJaUldNcjFCSjV1VDlGT0RESHVZUjFybk5QSkFy?=
 =?utf-8?B?NnpaNjArTWZJbExmRkFjYU9pNUo5aEUzVUxldmxZUXA4TVNVR1hCUWdvQXBC?=
 =?utf-8?B?Z3lFTjhNTWpIRjBCaU01eVpuWXB0T2FmUW9jYVZvYmxuREhtVHQ0RE1NMDN6?=
 =?utf-8?B?TkpqOVJHOHY2OGZHenBtZVZaclh3bHNNdkxwUUNZaFkyNXh3dUd0VzRhc1FY?=
 =?utf-8?B?WXNDS0tER0dSTTBHRFFKOHhQaHdENmhBSjVzdGlUcWdPa2pXUEdkeitQaXkz?=
 =?utf-8?B?QTdJZTJ1Tzl4Mm1rYUZrNDhBOEdhOWkvaTBSZnZXYVdpSUxTZWQrMmsyRktK?=
 =?utf-8?B?NE1wc0hrNHJGaGJyRXFsTTZ3UzRhemh1WGdyV1FReG5taE9GeHBZNXk5ckFD?=
 =?utf-8?B?RGpLWEE4cFIwSHBxLzRPSEdIYU5TRHg5RTlwcDFnbVR5S05pUC9VTk5vYU1r?=
 =?utf-8?B?ZVFQWFh4REs5QXJFT0o1REIrMXkwSTE5MGFUVmZ5Q0p5TVMwM1k5MDFLQ1lV?=
 =?utf-8?B?UGRNUmxuM1l2R2xPZFVZamhoaUFXd1VyanB3T0lrcWJpYUxxWjd3L0VmQkor?=
 =?utf-8?B?eFIvWmVXOWlzVVQ5cm04MTdYTjFWOGdlRmFYcWoybXFXeUkraFZuTjV2MmNB?=
 =?utf-8?B?THpWclR4RlFVWk43dVJEWEhXL09JVHZ0bHRCS3JrSVlzVjhqNWZoUUVzN3da?=
 =?utf-8?B?Si9uMXMvdXFzT0RTK3RBWE9pMHNRWjhLMURRZzFzSDV3TURBenE4SmtlQmpw?=
 =?utf-8?B?QURWK2hYQlpYL2Y4RXBzcDBUWldDN2l4N2pqQTVoODBjb25BSExTTjE2QzQ1?=
 =?utf-8?B?eklnQ0UwVVJtS2FTRDZrL2EySTQ1NGFJKzBmOWNhKzRvaVJzYTQ5VWF2ZCt6?=
 =?utf-8?B?WDJtTm9NeEl3OElPMEFUdUdPV3VZckROZ05KU0k2L3ZJT2FnSVdqQ2pzSGpD?=
 =?utf-8?B?Tmo2K29PSWlrai9FN0FESkRTSWlOTmFVb1JNR1NwZVhQekIyaVlyY01oVU1o?=
 =?utf-8?B?Z2NGK3hIQ3lPOG1OelVSS1NDa3lmUVptUnNxWklmOXhGVFRicDBJcXFwWDFS?=
 =?utf-8?B?L1RPMk9hUU5JUTd4RkZwZjVybi9YcGorYnlpUWt3Zzg4Mzk1ZlZCUm0rbTRW?=
 =?utf-8?B?R3k1OFlRWFNrSlZBcElPYVJiYko5M3NQTWJBTVZJZVhGMlR6c0RQd25qcGV3?=
 =?utf-8?B?NXNnSHJPNkFkOTZiVUNMdnlzd3JPc0hFYWhwVllrSnllcDRKZHp5NzVLUGZR?=
 =?utf-8?B?SDljNzh1R2laSVp5SUZhL0lRMytDNEdnRDNpMGRBTHZ5bEYzN1VwWTNMaktC?=
 =?utf-8?Q?SkOSN+pu8odZRPXmN/05sZJbPAvE5PiW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkRabVQzeGdKdnJQOHpvUG5nWTFpSEpSdHNBWjJUZ0ZUTWVPY3BYakhMZHVM?=
 =?utf-8?B?V0JibElRWS9vbVZFTktvU1NvRy9LMEVZbEZEOW00UmFmVlFUcERQWkZJYTQy?=
 =?utf-8?B?VDBVRmRYdjZRUXB3OGFkNEVXTFBtOEFoaGJqTkM4NGVWWWVReWpSU05rSTRr?=
 =?utf-8?B?R0hHZStFKzRZZ1I2eDIyUUdrMW81MGFhOG9GRjVxL3dUaU5ndFpJZEoyUWFU?=
 =?utf-8?B?ZzlhSHRkVmdXdnZ1Q2pob2lFanpHZUt3bElHVVdzRERsK0Q3aXlJWnBvUUxB?=
 =?utf-8?B?L3crVWtObDJqUGtHOG42SjZHR2Fvc0s0bm51VHJFVjZJTlZhZXQ4eTlZKzNR?=
 =?utf-8?B?Tm92M3oyOTBRN3k0Tmw1TWJOU040RFRWejYrYW15WmFHOFQrN0Y2K0dUYWJY?=
 =?utf-8?B?VDhRSk5YRlU0TFVVVXYxbVJoYS8zWUlGT2g5UXBUc2FNL1Fsbm9reVQxVlNP?=
 =?utf-8?B?anhlTlZ1WStHcjk4NjNPRGtDTHBGeFBmSUluWmpCeU51NzJEVm5maVo2VThK?=
 =?utf-8?B?c2ZKSWd5NnRVbUczMS9pZVRVWnNEN1BCTzNDaTZWTVNyUjROOWQ3YVBCbWdo?=
 =?utf-8?B?eHdFb2R3L0E2Wmh4T2V3cFdla0pqUzJENkpZK1pRS1cwaUtVQTdiOTk3NUJH?=
 =?utf-8?B?clVSS3pidjd0dkJGWFhyRjJ2clRNRms1dEIvNjdoK1VpbXlZTjdleWF5TEd4?=
 =?utf-8?B?QkxQYU13dGQrbGVUN0hJcHcya3dJeGV3Y3pVbWQ3cis5Vkg2YWVHNlZkRlhU?=
 =?utf-8?B?dzFCM2hOVFN1T0NGU041UXduVXB4bmNVblZFanJYc1BHOGx6TUxudUxBaFhN?=
 =?utf-8?B?M0dxb2pyRGVXeWtRb0p3QzU4TnZpcVR6S2FmUWdmS0t6amVqR2Ryc295ZHhS?=
 =?utf-8?B?eVI0dFp0a3lma0h5ZllVb09scnlOVmJqZDZYeVdLNnMwQ3NPb1g5c1NoanNE?=
 =?utf-8?B?UVlna3c3WDRhSWF0RUlTaVkzWjNoaS9ILzc5OWpZZ1hlaDM5Sm45YnA4d0VG?=
 =?utf-8?B?M2xuUjFwQS9ydnNrb015MTJSSGpSNzV5QkJPbWZVMm01SytQMkxxT2VFYTF2?=
 =?utf-8?B?Q2JESkpTdW5WMjVKbXgydlpFODZCTHVybjlrRk9JS1ArOC9FUjlLUjRZVkRV?=
 =?utf-8?B?NUxPMitxRW5lVEFhaS81VmlwU3ZQMmpQcVlpNWMzclY2SUFxWkJHZHoyeDYr?=
 =?utf-8?B?YXgxNFViUGZtaE01bFFnY3Y4Z0pmY0RrSDF3RFUwRTk4UHE4ZkVvc0VVaURM?=
 =?utf-8?B?Zy9iS1NyNmYvWjJHNy9nWDU2R0FLdFBSUUIzNmpoVEIvZDVhUTZwdUkzdTg0?=
 =?utf-8?B?Q2dJaW9Lak1UaWR5N1p5NEUzK1pFUVBmSW5hcUVsY0MyaXFOcUVsRmNBYS9B?=
 =?utf-8?B?dzhtbGVoNkhIbHNURFpINFlGNEliSkRmV1ZLaTVyb1RWTUdrNEVkbFkvcDdU?=
 =?utf-8?B?V0hMZS9Ua1BZN2VqV1BhMzNOMkNsRXYrOU9zVHdBSXpDRWkwTHpZcXBTNHNH?=
 =?utf-8?B?cnpkeWgzMTdUODJOS2VCSUNxcHVpSExJWGtIVExqM3E0L21SMjN3dnZnek9v?=
 =?utf-8?B?eUlpNmxBSklLSG9PQ1Erc3dsUkZqVGUzSk9MOTB0UU4yYmpRdTdyS0k1bmdi?=
 =?utf-8?B?OHc4N0pHbnNBTldxNzYyU0lzdXhjWlQwNE1ibTFheFNyNUc0clNLVURXK3N4?=
 =?utf-8?B?NXlFeFlTejJESEJTNnI5bXpoakNudFBFSWJTTldUK3pLdjhvVVBHRjB4Mkw4?=
 =?utf-8?B?Wk5QRzBLRG5ySk1WZjdnUDNKbFRvS0hvbkFGMlFWQ3lQTEZBTTNSa01JVEFF?=
 =?utf-8?B?b25KWVNtdGhJN3dNdVh5VXZ1K3NCVStvY0Qzb0Vlc3hGeElOLzhSSEJSMlBa?=
 =?utf-8?B?dUo1N2VzV1ZERTQreHdseWh4RTRxcEpxUEMvNktWWUlPWVBJcTR4T3FoZ3Z5?=
 =?utf-8?B?djVzY2FQc2MySEdHelNYK25MUlppWHFhVFozRWlqV3FQOVVvTzMzajZSUEcz?=
 =?utf-8?B?dTFNOEplNGFyeUw0c2dnRTVFOUZkU0dnbUJld0dDMVpWYzVKcFAxVldBb3B5?=
 =?utf-8?B?bzBNTWs3NGF6ZGFxSnFCK2FRTkhIQzJrYVNjT3FRTkc5REtXOHRUdWRxVUFX?=
 =?utf-8?B?M0w4blhxcDhKc1QvNTFWY2NhVy9yb1hGbDJidDlFTitybnd2Y2ZlOVFlbkQr?=
 =?utf-8?B?UDc1enNwaUZ6bHE2R28zbHd4cE5wL2VFRUdrWG1MaHV6L3JjTHRLZTJIcHdh?=
 =?utf-8?B?SjFBeXhQeFIyeUpaWHFLQ1ZMTWhnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ac6efc-6790-41c7-1b0f-08dd71ae816d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 06:20:46.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHOFjJZ1yaYsLZRpxoSMnqmazXcQG6pajGXmkFl+NGeiP8hof4wnDRyuoiPNIK7pEnZBuoMfR2BCSduar7KPOUvc4oE2+4MFM7hwigBCePY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFByYXZhbGlrYQ0K
PiBHdXJyYW0NCj4gU2VudDogMDIgQXByaWwgMjAyNSAxMTo0MSBBTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEd1cnJhbSwgUHJhdmFsaWthIDxwcmF2YWxpa2Eu
Z3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDQvNF0geGVfZXhlY19ub3A6IGNy
ZWF0ZSB4ZV9leGVjX25vcA0KPiANCj4gU2lnbmVkLW9mZi1ieTogUHJhdmFsaWthIEd1cnJhbSA8
cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgYmVuY2htYXJrcy9tZXNvbi5i
dWlsZCAgIHwgICAxICsNCj4gIGJlbmNobWFya3MveGVfZXhlY19ub3AuYyB8IDIyMQ0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwg
MjIyIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBiZW5jaG1hcmtzL3hlX2V4
ZWNfbm9wLmMNCj4gDQo+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL21lc29uLmJ1aWxkIGIvYmVu
Y2htYXJrcy9tZXNvbi5idWlsZCBpbmRleA0KPiBmMjlkNWEyODguLjFhZjEzYjBjNiAxMDA2NDQN
Cj4gLS0tIGEvYmVuY2htYXJrcy9tZXNvbi5idWlsZA0KPiArKysgYi9iZW5jaG1hcmtzL21lc29u
LmJ1aWxkDQo+IEBAIC0yNCw2ICsyNCw3IEBAIGJlbmNobWFya19wcm9ncyA9IFsNCj4gICAgICAg
ICAgJ3hlX2JsdCcsDQo+ICAgICAgICAgICd4ZV9jcmVhdGUnLA0KPiAgICAgICAgICAneGVfZXhl
Y19jdHgnLA0KPiArICAgICAgICAneGVfZXhlY19ub3AnLA0KPiAgXQ0KPiANCj4gIGJlbmNobWFy
a3NkaXIgPSBqb2luX3BhdGhzKGxpYmV4ZWNkaXIsICdiZW5jaG1hcmtzJykgZGlmZiAtLWdpdA0K
PiBhL2JlbmNobWFya3MveGVfZXhlY19ub3AuYyBiL2JlbmNobWFya3MveGVfZXhlY19ub3AuYyBu
ZXcgZmlsZSBtb2RlDQo+IDEwMDY0NCBpbmRleCAwMDAwMDAwMDAuLmEwZTIyMjAwNA0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL2JlbmNobWFya3MveGVfZXhlY19ub3AuYw0KPiBAQCAtMCwwICsx
LDIyMSBAQA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9u
DQo+ICsgKg0KPiArICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFy
Z2UsIHRvIGFueSBwZXJzb24NCj4gK29idGFpbmluZyBhDQo+ICsgKiBjb3B5IG9mIHRoaXMgc29m
dHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlDQo+ICsiU29mdHdh
cmUiKSwNCj4gKyAqIHRvIGRlYWwgaW4gdGhlIFNvZnR3YXJlIHdpdGhvdXQgcmVzdHJpY3Rpb24s
IGluY2x1ZGluZyB3aXRob3V0DQo+ICtsaW1pdGF0aW9uDQo+ICsgKiB0aGUgcmlnaHRzIHRvIHVz
ZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0ZSwNCj4gK3N1YmxpY2Vu
c2UsDQo+ICsgKiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVy
bWl0IHBlcnNvbnMgdG8gd2hvbQ0KPiArdGhlDQo+ICsgKiBTb2Z0d2FyZSBpcyBmdXJuaXNoZWQg
dG8gZG8gc28sIHN1YmplY3QgdG8gdGhlIGZvbGxvd2luZyBjb25kaXRpb25zOg0KPiArICoNCj4g
KyAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNl
IChpbmNsdWRpbmcgdGhlDQo+ICtuZXh0DQo+ICsgKiBwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1
ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMNCj4gK29mIHRoZQ0KPiAr
ICogU29mdHdhcmUuDQo+ICsgKg0KPiArICogVEhFIFNPRlRXQVJFIElTIFBST1ZJREVEICJBUyBJ
UyIsIFdJVEhPVVQgV0FSUkFOVFkgT0YgQU5ZIEtJTkQsDQo+ICtFWFBSRVNTIE9SDQo+ICsgKiBJ
TVBMSUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GDQo+
ICtNRVJDSEFOVEFCSUxJVFksDQo+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9T
RSBBTkQgTk9OSU5GUklOR0VNRU5ULiAgSU4gTk8NCj4gRVZFTlQNCj4gK1NIQUxMDQo+ICsgKiBU
SEUgQVVUSE9SUyBPUiBDT1BZUklHSFQgSE9MREVSUyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwN
Cj4gREFNQUdFUyBPUg0KPiArT1RIRVINCj4gKyAqIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBB
Q1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLA0KPiArQVJJU0lORw0KPiArICog
RlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVT
RSBPUg0KPiBPVEhFUg0KPiArREVBTElOR1MNCj4gKyAqIElOIFRIRSBTT0ZUV0FSRS4NCj4gKyAq
DQo+ICsgKiBBdXRob3JzOg0KPiArICogICAgUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWthLmd1
cnJhbUBpbnRlbC5jb20+DQo+ICsgKg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJkcm0uaCIN
Cj4gKyNpbmNsdWRlICJkcm10ZXN0LmgiDQo+ICsNCj4gKyNpbmNsdWRlICJpbnRlbF9pby5oIg0K
PiArI2luY2x1ZGUgImludGVsX3JlZy5oIg0KPiArI2luY2x1ZGUgPHN5cy9pb2N0bC5oPg0KPiAr
I2luY2x1ZGUgImlvY3RsX3dyYXBwZXJzLmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNvYmouaCIN
Cj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5Lmgi
DQo+ICsjaW5jbHVkZSAieGUveGVfdXRpbC5oIg0KPiArI2luY2x1ZGUgPHRpbWUuaD4NCj4gKw0K
PiArI2RlZmluZSBSRUFEX0FMTCAweDQNCj4gK3N0YXRpYyBkb3VibGUgZWxhcHNlZChjb25zdCBz
dHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiArCQkgICAgICBjb25zdCBzdHJ1Y3QgdGltZXNwZWMg
KmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAx
ZS05KihlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2X25zZWMpOyB9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIGZpcnN0X2JhdGNoKGludCBmZCkNCj4gK3sNCj4gKwl1aW50NjRfdCBib19zaXplID0g
eGVfYmJfc2l6ZShmZCwgU1pfNEspOw0KPiArCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlIGluc3QgPSB7DQo+ICsJCS5lbmdpbmVfY2xhc3MgPSBEUk1fWEVfRU5HSU5FX0NMQVNT
X1JFTkRFUiwNCj4gKwl9Ow0KPiArCXVpbnQzMl90IHZtLCBibzsNCj4gKwl1MzIgcTsNCj4gKwl2
bSA9IHhlX3ZtX2NyZWF0ZShmZCwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX1NDUkFUQ0hfUEFHRSwN
Cj4gMCk7DQo+ICsJYm8gPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXplLCBzeXN0ZW1fbWVt
b3J5KGZkKSwgMCk7DQo+ICsJcSA9IHhlX2V4ZWNfcXVldWVfY3JlYXRlKGZkLCB2bSwgJmluc3Qs
IDApOw0KPiArCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgcSk7DQo+ICsJZ2VtX2Nsb3NlKGZk
LCBibyk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiArfQ0KPiArc3RhdGljIHZvaWQg
c2Vjb25kX2JhdGNoKGludCBmZCkNCj4gK3sNCj4gKw0KPiArCWludCBlcnI7DQo+ICsJdWludDY0
X3QgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIFNaXzRLKSwgYm9fYWRkciA9IDB4MWEwMDAwOw0K
PiArCXVpbnQzMl90IHZtLCBibywgKmJhdGNoLCBleGVjX3F1ZXVlOw0KPiArCXN0cnVjdCBkcm1f
eGVfZW5naW5lX2NsYXNzX2luc3RhbmNlIGluc3QgPSB7DQo+ICsJCS5lbmdpbmVfY2xhc3MgPSBE
Uk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUiwNCj4gKwl9Ow0KPiArDQo+ICsJc3RydWN0IGRybV94
ZV9zeW5jIHN5bmMgPSB7DQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKLA0K
PiArCQkuZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLmhhbmRsZSA9IHN5
bmNvYmpfY3JlYXRlKGZkLCAwKSwNCj4gKwl9Ow0KPiArCXN0cnVjdCBkcm1feGVfZXhlYyBleGVj
ID0gew0KPiArCQkubnVtX3N5bmNzID0gMSwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVy
KCZzeW5jKSwNCj4gKwkJLmFkZHJlc3MgPSBib19hZGRyLA0KPiArCQkubnVtX2JhdGNoX2J1ZmZl
ciA9IDEsDQo+ICsJfTsNCj4gKw0KPiArCXZtID0geGVfdm1fY3JlYXRlKGZkLCBEUk1fWEVfVk1f
Q1JFQVRFX0ZMQUdfU0NSQVRDSF9QQUdFLA0KPiAwKTsNCj4gKwlibyA9IHhlX2JvX2NyZWF0ZShm
ZCwgdm0sIGJvX3NpemUsIHN5c3RlbV9tZW1vcnkoZmQpLCAwKTsNCj4gKw0KPiArCWJhdGNoID0g
eGVfYm9fbWFwKGZkLCBibywgYm9fc2l6ZSk7DQo+ICsJKmJhdGNoID0gTUlfQkFUQ0hfQlVGRkVS
X0VORDsNCj4gKwltdW5tYXAoYmF0Y2gsIGJvX3NpemUpOw0KPiArDQo+ICsJeGVfdm1fYmluZF9z
eW5jKGZkLCB2bSwgYm8sIDAsIGJvX2FkZHIsIGJvX3NpemUpOw0KPiArCWV4ZWNfcXVldWUgPSB4
ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sICZpbnN0LCAwKTsNCj4gKw0KPiArCWV4ZWMuZXhl
Y19xdWV1ZV9pZCA9IGV4ZWNfcXVldWU7DQo+ICsJZXJyID0gX194ZV9leGVjKGZkLCAmZXhlYyk7
DQo+ICsNCj4gKwllcnIgPSBzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwgSU5UNjRf
TUFYLCAwLCBOVUxMKTsNCj4gKwl4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWUp
Ow0KPiArCWdlbV9jbG9zZShmZCwgYm8pOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtKTsNCj4g
KwlzeW5jb2JqX2Rlc3Ryb3koZmQsIHN5bmMuaGFuZGxlKTsNCj4gKw0KPiArfQ0KPiArc3RhdGlj
IGludCBsb29wKHVuc2lnbmVkIHJpbmcsIGludCByZXBzLCBpbnQgbmNwdXMsIHVuc2lnbmVkIGZs
YWdzKSB7DQo+ICsJZG91YmxlICpzaGFyZWQ7DQo+ICsJaW50IGZkOw0KPiArCXN0cnVjdCBkcm1f
eGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7DQo+ICsJc2hhcmVkID0gbW1hcCgwLCA0MDk2
LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwgTUFQX0FOT04sIC0NCj4gMSwgMCk7DQo+ICsNCj4g
KwlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiArCWlmIChyaW5nKSB7DQo+ICsJ
CXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ICsJCQlpZiAoaHdlLT5lbmdpbmVfY2xh
c3MgPT0gcmluZykgew0KPiArCQkJCWZpcnN0X2JhdGNoKGZkKTsNCkNhbiB5b3UgcGxlYXNlIG1h
a2UgdGhlIGNoYW5nZXMgd2hpY2ggSSBtZW50aW9uZWQgdG8geW91LCB0aGF0IGlzIHlvdSBhcmUg
cGFzc2luZyBkaWZmZXJlbnQgcmluZ3MgYW5kIG5vdCB1c2luZyB0aGF0IGluIHRoZSBmdW5jdGlv
biBhbmQganVzdCB1c2luZyByZW5kZXIgZm9yIGFsbCBlbmdpbmVzLg0KPiArCQkJCXNlY29uZF9i
YXRjaChmZCk7DQo+ICsJCQl9DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KRWxzZSBpcyBmb3IgaXMg
aXQganVzdCBpZiBubyBlbmdpbmUgaXMgZ2l2ZW4sIHlvdSBuZWVkIHRvIHVwZGF0ZSB0aGlzIGFz
IHdlbGwuDQo+ICsJCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgaHdlKSB7DQo+ICsJCQlmaXJzdF9i
YXRjaChmZCk7DQo+ICsJCQlzZWNvbmRfYmF0Y2goZmQpOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+
ICsNCj4gKwl3aGlsZSAocmVwcy0tKSB7DQo+ICsJCW1lbXNldChzaGFyZWQsIDAsIDQwOTYpOw0K
PiArDQo+ICsJCXNsZWVwKDEpOyAvKiB3YWl0IGZvciB0aGUgaHcgdG8gZ28gYmFjayB0byBzbGVl
cCAqLw0KPiArDQo+ICsJCWlndF9mb3JrKGNoaWxkLCBuY3B1cykgew0KPiArCQkJc3RydWN0IHRp
bWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQl1bnNpZ25lZCBjb3VudCA9IDA7DQo+ICsNCj4gKwkJ
CWZpcnN0X2JhdGNoKGZkKTsNClNhbWUgYXMgYWJvdmUgcGFzcyB0aGUgZW5naW5lIHRvIHRoZSBm
dW5jdGlvbiBhcyB3ZWxsLiBQbGVhc2UgY2hlY2sgdGhpcyBvdmVyIGFsbC4NCj4gKwkJCXNlY29u
ZF9iYXRjaChmZCk7DQo+ICsNCj4gKwkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAm
c3RhcnQpOw0KPiArCQkJZG8gew0KPiArCQkJCWZvciAoaW50IGlubmVyID0gMDsgaW5uZXIgPCAx
MDI0OyBpbm5lcisrKSB7DQo+ICsJCQkJCWlmIChmbGFncyAmIFJFQURfQUxMKSB7DQo+ICsJCQkJ
CQlpZiAocmluZykgew0KPiArDQo+IAl4ZV9mb3JfZWFjaF9lbmdpbmUoZmQsIGh3ZSkgew0KPiAr
CQkJCQkJCQlpZiAoaHdlLQ0KPiA+ZW5naW5lX2NsYXNzID09IHJpbmcpIHsNCj4gKw0KPiAJZmly
c3RfYmF0Y2goZmQpOw0KPiArDQo+IAlzZWNvbmRfYmF0Y2goZmQpOw0KPiArCQkJCQkJCQl9DQo+
ICsJCQkJCQkJfQ0KPiArCQkJCQkJfSBlbHNlIHsNCj4gKw0KPiAJeGVfZm9yX2VhY2hfZW5naW5l
KGZkLCBod2UpIHsNCj4gKw0KPiAJZmlyc3RfYmF0Y2goZmQpOw0KPiArDQo+IAlzZWNvbmRfYmF0
Y2goZmQpOw0KPiArCQkJCQkJCX0NCj4gKwkJCQkJCX0NCj4gKwkJCQkJfQ0KPiArCQkJCX0NCj4g
Kw0KPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmZW5kKTsNCj4gKwkJCX0g
d2hpbGUgKGVsYXBzZWQoJnN0YXJ0LCAmZW5kKSA8IDIuKTsNCj4gKw0KPiArCQkJY2xvY2tfZ2V0
dGltZShDTE9DS19NT05PVE9OSUMsICZlbmQpOw0KPiArCQkJc2hhcmVkW2NoaWxkXSA9IDFlNipl
bGFwc2VkKCZzdGFydCwgJmVuZCkgLyBjb3VudDsNCj4gKw0KPiArCQl9DQo+ICsJCWlndF93YWl0
Y2hpbGRyZW4oKTsNCj4gKw0KPiArCQlmb3IgKGludCBjaGlsZCA9IDA7IGNoaWxkIDwgbmNwdXM7
IGNoaWxkKyspDQo+ICsJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJlZFtjaGlsZF07DQo+ICsJCXBy
aW50ZigiJTcuM2YgbmNwdXMgJWRcbiIsIHNoYXJlZFtuY3B1c10gLyBuY3B1cywgbmNwdXMpOw0K
PiArCX0NCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAraW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQ0KPiArew0KPiArCXVuc2lnbmVkIHJpbmcgPSBJOTE1X0VYRUNfUkVOREVSOw0K
VXNlIFhlIGVuZ2luZSBmb3IgdGhpcy4NCj4gKwl1bnNpZ25lZCBmbGFncyA9IDA7DQo+ICsJaW50
IHJlcHMgPSAxOw0KPiArCWludCBuY3B1cyA9IDE7DQo+ICsJaW50IGM7DQo+ICsNCj4gKwl3aGls
ZSAoKGMgPSBnZXRvcHQgKGFyZ2MsIGFyZ3YsICJlOnI6ZjpBIikpICE9IC0xKSB7DQo+ICsJCXN3
aXRjaCAoYykgew0KPiArCQljYXNlICdlJzoNCj4gKwkJCWlmIChzdHJjbXAob3B0YXJnLCAicmNz
IikgPT0gMCkNCj4gKwkJCQlyaW5nID0gRFJNX1hFX0VOR0lORV9DTEFTU19SRU5ERVI7DQo+ICsJ
CQllbHNlIGlmIChzdHJjbXAob3B0YXJnLCAidmNzIikgPT0gMCkNCj4gKwkJCQlyaW5nID0NCj4g
RFJNX1hFX0VOR0lORV9DTEFTU19WSURFT19ERUNPREU7DQo+ICsJCQllbHNlIGlmIChzdHJjbXAo
b3B0YXJnLCAiYmNzIikgPT0gMCkNCj4gKwkJCQlyaW5nID0gRFJNX1hFX0VOR0lORV9DTEFTU19D
T1BZOw0KPiArCQkJZWxzZSBpZiAoc3RyY21wKG9wdGFyZywgInZlY3MiKSA9PSAwKQ0KPiArCQkJ
CXJpbmcgPQ0KPiBEUk1fWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0VOSEFOQ0U7DQo+ICsJCQllbHNl
IGlmIChzdHJjbXAob3B0YXJnLCAiY2NzIikgPT0gMCkNCj4gKwkJCQlyaW5nID0gRFJNX1hFX0VO
R0lORV9DTEFTU19DT01QVVRFOw0KPiArCQkJZWxzZQ0KPiArCQkJCXJpbmcgPSBhdG9pKG9wdGFy
Zyk7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNlICdyJzoNCj4gKwkJCXJlcHMgPSBhdG9p
KG9wdGFyZyk7DQo+ICsJCQlpZiAocmVwcyA8IDEpDQo+ICsJCQkJcmVwcyA9IDE7DQo+ICsJCQli
cmVhazsNCj4gKw0KPiArCQljYXNlICdmJzoNCj4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBS
T0NFU1NPUlNfT05MTik7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNlICdBJzoNCj4gKwkJ
CWZsYWdzIHw9IFJFQURfQUxMOw0KPiArCQkJYnJlYWs7DQo+ICsNCj4gKwkJZGVmYXVsdDoNCj4g
KwkJCWJyZWFrOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIGxvb3AocmluZywgcmVw
cywgbmNwdXMsIGZsYWdzKTsgfQ0KPiAtLQ0KPiAyLjM0LjENCg0K
