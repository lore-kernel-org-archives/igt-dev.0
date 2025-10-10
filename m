Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD98CCCA476
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 06:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B9F10E26C;
	Fri, 10 Oct 2025 06:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftK3c9cZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9202510E26C;
 Fri, 10 Oct 2025 06:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760077699; x=1791613699;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QTW3muZ0Oyodk6oeK8sq2+4tmKx/YvaLvUiLFZ5Wfik=;
 b=ftK3c9cZwvrHcPDStDX9H16wVyy39O3C2jPPh6oBxRyAtVIWr4AkQ3wi
 ApdOdsFYXJ+k+HZELBfXqTq9k6KSFVy4DRm4fEsKc5ocD3KAeyOFD9biY
 DS2nn4GhMhPAPHIb+qIYXEl0FWrfifxz1WFULluS8c2NAeGtVp6pFJznE
 yPmdLRuu77OtPtrKv9zZZGbYFzRvndNwr9KbTIvazaYr7DKA9McERMMMV
 Fbqkyp9bqb7/sU5vfCN43t1APicw4FwO5+KZPybd8mADj/l+eTDRxWYrF
 YiLGECqBLDC+BeEeJH/KuFySXJ0dCDJ/secuZtp+fSBVfR+umzH5n9dyi Q==;
X-CSE-ConnectionGUID: oL82eD46QUCxM+yGw0GNjw==
X-CSE-MsgGUID: lYHk1vD2SJaQZd6Dkt4lGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62392101"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62392101"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 23:28:19 -0700
X-CSE-ConnectionGUID: LEmrrE9gR9qPG1HKOf5XNA==
X-CSE-MsgGUID: 2GuUWwX0RlOaOu5nCC48/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="181673769"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 23:28:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 23:28:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 23:28:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 23:28:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1p7OOYcfDGu0d0uh404gr2zRVysrp4JVGJ5YXz/JjrAF+6zptmWoFkTjapTz+L0dW76mT2g2xv3B3mzoF6i8MjsRLYUP7wIxtAYDd5OwsnhsAGCg8H77hmflRwlA6m0IOSt0iUjEZwiJ+BgU0eOMDKuQXySJdRdqpjIuapZbY2x+s6B9p3O+AfHHP0K71BOvapXvlSWDkZ8HBPhvMn8HKpsnTcKN6I8Uy3RMN0AxJmKI8bAHxt4hBCt927S9m4UaYP0b2phwpN/+JLq7sRztkMNCjHL6a1kdfMKwCLCX52nDOxFfdN2XznL6QQ7bE2S1YTgZ3N0a8khTcZKBS+dfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTW3muZ0Oyodk6oeK8sq2+4tmKx/YvaLvUiLFZ5Wfik=;
 b=Ky/Ee9IoncrB3Z5fVuAVRUXu5+5hQfNcA9f6C+vnCtLLpVUCy2NRmW0lJS6z+87d/gwv1IRYSMn9fnzIXvMJuT7ChX0gbaFr3zvO5g0luh9Jt+6sAOJFmu/GTDbhBP7G726enCkGMdYnuaWM/Kj8uZ6L6Ro1kTmeGHYvupecbzWtcg0NWOTauVKlC1OQUQ+vnaQyNXozLd6AZPOB32DS5Nz/f5h4evsClzZJEjhr3XGfpIUzVYmjW/hTHB4OgSk7MGSTahnb7jwxR4tq//JwAu1EKkktf81qX4G01/rWBybvux3kzf0iUZ/oWQOvh7Odoyb2wIXY6Rwt/ZFpO1NysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by BL1PR11MB6025.namprd11.prod.outlook.com (2603:10b6:208:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 06:28:14 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 06:28:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL3N5bmNv?=
 =?utf-8?B?YmpfdGltZWxpbmU6IEV4ZXJjaXNlIHNpZ25hbGluZyBvZiBhd2FpdGVkIHBv?=
 =?utf-8?Q?ints_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvc3luY29ial90?=
 =?utf-8?B?aW1lbGluZTogRXhlcmNpc2Ugc2lnbmFsaW5nIG9mIGF3YWl0ZWQgcG9pbnRz?=
 =?utf-8?Q?_(rev3)?=
Thread-Index: AQHcOEqFLtLjTuGGaESf7SALT9OVHrS5Y/zw
Date: Fri, 10 Oct 2025 06:28:13 +0000
Message-ID: <CH0PR11MB549101D418CDBBCB5A99B6D4EFEFA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20251007152315.3403250-2-janusz.krzysztofik@linux.intel.com>
 <175991232048.16773.5200182812065395164@6aec98b87f92>
 <18925748.sWSEgdgrri@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <18925748.sWSEgdgrri@jkrzyszt-mobl2.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|BL1PR11MB6025:EE_
x-ms-office365-filtering-correlation-id: 639c1231-2b25-446a-0712-08de07c630e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7053199007|38070700021|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?QjVRaGJZbXVQWmx1d3grRDJJQkpOOFBnaUZtK3pnTXEraGNMZitYNkVDMTg0?=
 =?utf-8?B?elpraGY3N3ZuS0d4VXY4enRLTDcwa3B4Y0N5OUs2K3dsWDZIRmNYQVM1YzFq?=
 =?utf-8?B?dHZXNTFIYys3S2lNcWRVcjcyemhxWnZpcW5wZHIzVFR0bk41dVo3bWhuM3Zl?=
 =?utf-8?B?ait3ZWJaTmhUY0VFK3dIMW03M00rUGhPK1BNNmw0Uyt3YU9rOW9hMnJEZXd1?=
 =?utf-8?B?VDlZQzdlSWtFYktVaDY2Wk9nQ0l4ekp6WVVuOVFvMC9JYlcvaGpwdGVEbG9V?=
 =?utf-8?B?OWFKK3ZxY05mbm9ZVjllcXpoQ3FVM0s1QlNnT0xnNmQ0eEl6d2FzWlcycis2?=
 =?utf-8?B?N2dxK1U3TkNKb01qSElDeUV2RnB5UDhZYnBRbHZ4NWcxdENOaWp6dUVOWWNu?=
 =?utf-8?B?ekpqOUdtS1pEbHl5QWtkSjhTbytydDdmcTZhZW1nWUtodkZCVUdvMnZvLzRa?=
 =?utf-8?B?bXYvdmp0NUs3MFdTSlpPdEVZcnQvMnFncFZsWGFueUVnZWFMQTZBZlJOeER6?=
 =?utf-8?B?blZLVk51N2UzQlhpM01IcjEva2dvOS8vd0I4Tm5XQVYzcldhYnBnbDlGakd4?=
 =?utf-8?B?RGMzaVhRM1JVaTJnNjNhNlRTVXVROVdwTkxqUlhiZVdnVDRIMkZiR1NDVVBC?=
 =?utf-8?B?b2pSSjlYWnh3anM2YUFJQ0p2NVMxMVNMVVhwNHBwNldXQXJoQTFXNDVUaFNH?=
 =?utf-8?B?M2tEK2EzM0lXdEtCMUNtVDFzVm1LL2d6ZElIRUJIdnovY3BCa1FNNWNGb1NQ?=
 =?utf-8?B?cUd5VmVEcnpKaFFjd2lmYkVPbEdJNHVEMkt6THFPN0U1M2V3QmRWRjh5RjRN?=
 =?utf-8?B?UmxVZy9TUUQwN2xQMUhwekcya3NubnByVno3emVqVmgxaWZmWGt4WmNidmpW?=
 =?utf-8?B?V0lmTmRLY3prYzQ4c0NDUFVTV3NXQ0J3NUhDYmZJQ1E3Vk95MjdndUUwcFFm?=
 =?utf-8?B?bDQyKytSSU5kN3hlLy9Wa2xnd0RtNUh3RlIvR05zZU5aZmhRMFNaQ3Y2bWdF?=
 =?utf-8?B?V3BBK2hUc09vYmlnZzhyeFRLdUdOaXRhOW1hYWZsS3ZlUFhyRm1WcjRrSkVn?=
 =?utf-8?B?S2Fwdy9rd2JGR2pGaVNnNmJQMC9SSE1ldTB3aFp3dCs1TmlsQUdBZkpwSnFm?=
 =?utf-8?B?dDYvVDJqQ0FGUjNOcjFCNEQzMC85MGtkcGh6ZkN5eU5XcUNXZTJXeWl0akVP?=
 =?utf-8?B?bTkxKzF4V0M5SXozZ2Nxa2NHdWhHNzVQZk5mMEFVQW95RHBZQmxoNXY4c0hl?=
 =?utf-8?B?WTQ2cDgvdE51ZkdpYzd2eEZxTVEzTHJWcHNld1JXcTYyOER6ZTJVb0wxY1J5?=
 =?utf-8?B?cjBLL3NpbE5ocTdLc0ZaVWVoakp0a0NxaHY4bmJrSTlpcUNLUkpNNExETTR1?=
 =?utf-8?B?QVkwV3p6L252Q0duZm5LUE80MmF6UHN0dW9SOVVrZkdobDBrTk5XS3FqNkZX?=
 =?utf-8?B?a1hLcGU1SmNUN2xKMGEzcW9jV2E1YUxkSkNxSExSSTRtWEY0YWNPZStwVFln?=
 =?utf-8?B?aXRHRHphOXIrM3gxeExSNGRoV2xkWFZkeGZYY3NQUGxQNGR1OGFTVkptUXZw?=
 =?utf-8?B?RVAxcDEwTHZ3UjhadVVsN1E3bXM2cGM1a0N3UUM5Qkxjc216WnR2cVVVZFg0?=
 =?utf-8?B?QVNReFgrdktLTkVETDM5dXBnMldwQS9haTQyZHd2WGFjYzE4ajVsNUpYb2FG?=
 =?utf-8?B?S2pyTnNqUEwwa1ppZ1FxNFBxRUhHbENWTEYzTnFqNU83K1IyVTlXcVNjS2dZ?=
 =?utf-8?B?K1VzRDFUVlNhSVZZT293MnphZHdJUTlhZEVMUm56ZFRmM0svZW5QdmY5WDNo?=
 =?utf-8?B?ZDdjMm1oUEtHeVBGMzE3bUhrWDJqM2FmU1VmbEk0eXd6M0xJNzk3Y1BwNjY3?=
 =?utf-8?B?emh3OUlkZUhjWWpPb2ZCY2FodU5IWU9tcEhLaEJObi9mRjREMlhoN3gwMVp2?=
 =?utf-8?B?YkttVkY1dUgrb1JQZkZzR01obU1DcTJveFJvVkhRdkxmbFFkdnc4SVZJNTlz?=
 =?utf-8?B?QWNZUG5nNFRnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VGYwTkp1NUFrZTUyenBSNW5YWmI2bHBubWlhcU51bGxCZnRHOFlsQUhKQ0Nx?=
 =?utf-8?B?cFA0c2NlRmVMWTB0Tk5nT0VkNUI2aDV1NWRiNjBvR3dxZjJiRGxWZVF5V24r?=
 =?utf-8?B?U0k5dHlvT1l0bmh4RjdYa25GeUlGWENFN1d0eGpTdVh1dVREUHhmNFpDek5U?=
 =?utf-8?B?b2FkZjBONFdIVFVCTkw4MEVCZDBRSGxqZndBalNkMWhucTRKNUhQTlB2YnUy?=
 =?utf-8?B?akxXVFM0cWFQWFhhY0VCTnN3YnZSUk5HTTVnZE5NRWx0UHlVSExOL1BWcEVq?=
 =?utf-8?B?c29mcy9VWllJYW1tcmpvbzVPbHdYRTR4Vm5NcmRlMlRiVzN2c0JOV2VXbERs?=
 =?utf-8?B?ME9hY0FONjV1MVN3VFZ3SVR6U2xqUFVNaWllVTNlVHFMYWE4Y1hMaXNUK0RT?=
 =?utf-8?B?aFIxRzZMaDZ6K01rcFVXNlpyS1BxSnUyakxyQlZ0ODY1eW5hTldMMEFBN09x?=
 =?utf-8?B?ZlZJRHkzRnVGelVWS2pRZzhrVXhjVjVyYzhPVS9RQm9xUTA3QnRtTnZpbkd5?=
 =?utf-8?B?YjJ4WWhidXVFTEhzSjFnMmtpNjY5ZXZCbVVPanpDWGM1MTh0Y0lKdXBSWWI1?=
 =?utf-8?B?RGltWjNWeVkvbUJvcGhiS2hRTHFyeHdwZXJHMEs5WEFlUTZBWmVMSlRURy9k?=
 =?utf-8?B?d3dva243REV2N040SEpQZDNteU9oRTVmb3NGQzluUDlQMkJORk1jaFJzWU5a?=
 =?utf-8?B?R3lqKyt5dlEwRlFqMXVvZXFyMlFRb1hNMUNOR1lHNWtwVFYvMFFyQU5Od0lz?=
 =?utf-8?B?bHorV0dUMU5hYklxaWNsMmZqQU5JOFppRTF1MklzZHhoWG5GNW1hckN1THdu?=
 =?utf-8?B?Mmw4LzBJaWhaT0daU2tKa0h5aWVyK2RnNXE3V2cyK3FqTWo1S2hOWTZZNWZW?=
 =?utf-8?B?ekJ6Q1k0d21FN0l3dno4L2ZlNWNDaGJMamVIbExlQTV2bHJKa0hLc2dOTkVL?=
 =?utf-8?B?eU4wWjdWTnoxREFIWkdDV1VCMVAvcU95aGlCOERWZEJYaXBOMHRja2x4QUIw?=
 =?utf-8?B?SHpqejMxdHRRRmEzTFlYbTdMZWVCc0x4OWFiTXkwME5jZXFzUENKNEpkeE0w?=
 =?utf-8?B?Q1RYVFBNVHhRRlZtMVdraXVJZUs3S0xhcDFkdlRTMHQvWHpIT29QemhCTWxU?=
 =?utf-8?B?UUljYythcVpYT1I2bDFuN2R4b2ZDUm9FTjVNZ3p2Z2xLY0o4d21wVGlyWlFN?=
 =?utf-8?B?anFyQVJmd3FkUlA4RDUvSVVuaXBDZUNJLzdCaklSMjdUUWlpZEsvVjdjUmFC?=
 =?utf-8?B?WlBDRHd1N3hDNDBDbjgxU3NMR2ZyMlpJd0xaRDh0U0svOEJEQ1l6ZkJ5Rm01?=
 =?utf-8?B?RG0yaW0rNDd2cVZOZ1RkbmdGLzllcVlpcXg5dUdObFdDZGRNSnMvVTQvMDlp?=
 =?utf-8?B?VWMxUWhDdU9vVlFJcW1Vbm9SS3dXR2xmbGRrUnRtR0hDbDRVcVl1eTdvdkp3?=
 =?utf-8?B?dU9FZ0lRTkpreHRqSjJwc1ExSm5CVjF0WDErazdsSmxtS2ZFNzYxNnZzelFD?=
 =?utf-8?B?eERJc0JjSU0wUno4MCtobU9YS3VEcksybmFFSTNobkRNdG1xWVdJMnpCZ09R?=
 =?utf-8?B?T25ZNG5WR1R1blg3ZWFwaDE1cmEyK3k3ZUNmRzBLVEw5MmltZSszMWJuVnBP?=
 =?utf-8?B?WjMwdk9pQ21sNHNjTXk1R0RNOHBid1MzVGY3aEgwZ0lleGRzS3JKcnNNanZ6?=
 =?utf-8?B?bnk4OUsyVElQVnIxWVUzNkVEeWMydkFLcFZpeTZiKzVUK2xiY1lEV3pJZUNr?=
 =?utf-8?B?S29WMkRwNndCTWhmTDFibE5mTlhXalorWVNUbU4rU3ovSFhncWprN2dyc3BJ?=
 =?utf-8?B?Ulh4MlJzZDNBa2RlNXRVZnpSWW9kUHg1a3E5eXV2VDM4RkE0VDNOOFg1VkJt?=
 =?utf-8?B?eW9DZDJFMDBGNzVJNHVlWm14cVhzN2tEdVRHM0NJU1pLRjhtdG9hSzJuQ1cz?=
 =?utf-8?B?aHp6Mmg3aHlDTGw1RE5mUDE0RzA0eEJwTG5seEZObEFxTW1ueVdKUlR0VmEz?=
 =?utf-8?B?NkYvZ1lnWGR6WitWU0JiSDRINHl5MlhGcFhwbVBFMk5BTW1HTFEwUzdIWEc3?=
 =?utf-8?B?a2lLSWFYdjZQMmVEMm1rRXdMTllDdEpwQzBvcFk2Y09xSEFRVUkwTGJxcHBB?=
 =?utf-8?B?U3VVQ2h6NGxObGpQVlA5c01hc2llejQyajBuNXlKcWtpZDVmTFhFQ3dkZGZl?=
 =?utf-8?Q?g46pNC0CmnowNwMqHmVh+c56bKxKWuUMAs0U2plo1DHp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639c1231-2b25-446a-0712-08de07c630e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 06:28:13.8338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt7+l24NczhauKq3s94s8R6Z0dMv3XrqZ2YZ3dpA5V6L+sWqvddAyK2kaVXHB/AmfvclB10F5/1aN+zet3EQWAtwta8lpRX4wnxqHm6LFTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU0NTkwLyAN
Cmk5MTUuQ0kuRlVMTCAtIFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJh
LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFudXN6IEtyenlz
enRvZmlrDQpTZW50OiAwOCBPY3RvYmVyIDIwMjUgMTc6MjYNClRvOiBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpT
dWJqZWN0OiBSZTog4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgdGVzdHMvc3luY29ial90
aW1lbGluZTogRXhlcmNpc2Ugc2lnbmFsaW5nIG9mIGF3YWl0ZWQgcG9pbnRzIChyZXYzKQ0KDQpI
aSBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywNCg0KT24gV2VkbmVzZGF5LCA4
IE9jdG9iZXIgMjAyNSAxMDozMjowMCBDRVNUIFBhdGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVz
IERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMvc3luY29ial90aW1lbGluZTogRXhlcmNp
c2Ugc2lnbmFsaW5nIG9mIGF3YWl0ZWQgcG9pbnRzIChyZXYzKQ0KPiBVUkwgICA6IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU0NTkwLw0KPiBTdGF0ZSA6IGZhaWx1
cmUNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20g
Q0lfRFJNXzE3MzIzX2Z1bGwgLT4gSUdUUFdfMTM4NjdfZnVsbCANCj4gPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAt
LS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFu
Z2VzIGNvbWluZyB3aXRoIElHVFBXXzEzODY3X2Z1bGwgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+
ICAgdmVyaWZpZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRl
ZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9k
dWNlZCBpbiBJR1RQV18xMzg2N19mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5
MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8g
ZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBw
b3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTM4NjcvaW5kZXguaHRtbA0KPiANCj4g
UGFydGljaXBhdGluZyBob3N0cyAoMTIgLT4gMTIpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KPiANCj4gICBObyBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+
IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJl
IGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGlu
IElHVFBXXzEzODY3X2Z1bGw6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAZ2VtX3dvcmthcm91bmRz
QHN1c3BlbmQtcmVzdW1lLWNvbnRleHQ6DQo+ICAgICAtIHNoYXJkLWRnMjogICAgICAgICAgW1BB
U1NdWzFdIC0+IFtBQk9SVF1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5v
cmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNzMyMy9zaGFyZC1kZzItNC9pZ3RAZ2VtX3dvcmthcm91
bmRzQHN1c3BlbmQtcmVzdW1lLWNvbnRleHQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzODY3L3NoYXJkLWRnMi0xMC9p
Z3RADQo+IGdlbV93b3JrYXJvdW5kc0BzdXNwZW5kLXJlc3VtZS1jb250ZXh0Lmh0bWwNCj4gDQo+
ICAgKiBpZ3RAa21zX3BsYW5lX2N1cnNvckBvdmVybGF5QHBpcGUtYS1oZG1pLWEtMi1zaXplLTI1
NjoNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBOT1RSVU4gLT4gW0ZBSUxdWzNdICszIG90
aGVyIHRlc3RzIGZhaWwNCj4gICAgWzNdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMzg2Ny9zaGFyZC1ya2wtOC9pZ3RAaw0KPiBtc19wbGFuZV9j
dXJzb3JAb3ZlcmxheUBwaXBlLWEtaGRtaS1hLTItc2l6ZS0yNTYuaHRtbA0KDQpUaGUgYWJvdmUg
ZmFpbHVyZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggbmV3IHN1YnRlc3RzIGludHJvZHVjZWQg
YnkgdGhlIGNoYW5nZSBpbiBzY29wZSBvZiB0aGlzIHByZS1tZXJnZSB0ZXN0aW5nLiAgUGxlYXNl
IHVwZGF0ZSBmaWx0ZXJzIGFuZCByZS0gcmVwb3J0Lg0KDQpUaGFua3MsDQpKYW51c3oNCg0KPiAN
Cj4gICANCj4gTmV3IHRlc3RzDQo+IC0tLS0tLS0tLQ0KPiANCj4gICBOZXcgdGVzdHMgaGF2ZSBi
ZWVuIGludHJvZHVjZWQgYmV0d2VlbiBDSV9EUk1fMTczMjNfZnVsbCBhbmQgSUdUUFdfMTM4Njdf
ZnVsbDoNCj4gDQo+ICMjIyBOZXcgSUdUIHRlc3RzICgxNCkgIyMjDQo+IA0KPiAgICogaWd0QGdl
bV9yZW5kZXJfY29weUB5LXRpbGVkLXRvLXZlYm94LXgtdGlsZWRAc21lbToNCj4gICAgIC0gU3Rh
dHVzZXMgOiAzIHBhc3MocykNCj4gICAgIC0gRXhlYyB0aW1lOiBbMC4wOCwgMC4xMV0gcw0KPiAN
Cj4gICAqIGlndEBnZW1fcmVuZGVyX2NvcHlAeS10aWxlZEBzbWVtOg0KPiAgICAgLSBTdGF0dXNl
cyA6IDUgcGFzcyhzKQ0KPiAgICAgLSBFeGVjIHRpbWU6IFswLjA3LCAwLjIyXSBzDQo+IA0KPiAg
ICogaWd0QHN5bmNvYmpfdGltZWxpbmVAc3RyZXNzLWVuYWJsZS1hbGwtc2lnbmFsLWFsbC1iYWNr
d2FyZDoNCj4gICAgIC0gU3RhdHVzZXMgOiA2IHBhc3MocykNCj4gICAgIC0gRXhlYyB0aW1lOiBb
MTAuODYsIDEyLjc5XSBzDQo+IA0KPiAgICogaWd0QHN5bmNvYmpfdGltZWxpbmVAc3RyZXNzLWVu
YWJsZS1hbGwtc2lnbmFsLWFsbC1mb3J3YXJkOg0KPiAgICAgLSBTdGF0dXNlcyA6DQo+ICAgICAt
IEV4ZWMgdGltZTogW05vbmVdIHMNCj4gDQo+ICAgKiBpZ3RAc3luY29ial90aW1lbGluZUBzdHJl
c3MtZW5hYmxlLWFsbC1zaWduYWwtYWxsLXJhbmRvbToNCj4gICAgIC0gU3RhdHVzZXMgOiA3IHBh
c3MocykNCj4gICAgIC0gRXhlYyB0aW1lOiBbMTAuMTUsIDEwLjczXSBzDQo+IA0KPiAgICogaWd0
QHN5bmNvYmpfdGltZWxpbmVAc3RyZXNzLWVuYWJsZS1hbGwtc2lnbmFsLWJhY2t3YXJkOg0KPiAg
ICAgLSBTdGF0dXNlcyA6IDUgcGFzcyhzKSAxIHNraXAocykNCj4gICAgIC0gRXhlYyB0aW1lOiBb
My43MywgMTAuNjRdIHMNCj4gDQo+ICAgKiBpZ3RAc3luY29ial90aW1lbGluZUBzdHJlc3MtZW5h
YmxlLWFsbC1zaWduYWwtZm9yd2FyZDoNCj4gICAgIC0gU3RhdHVzZXMgOiA3IHBhc3MocykNCj4g
ICAgIC0gRXhlYyB0aW1lOiBbMC44NiwgMy43OV0gcw0KPiANCj4gICAqIGlndEBzeW5jb2JqX3Rp
bWVsaW5lQHN0cmVzcy1lbmFibGUtYWxsLXNpZ25hbC1yYW5kb206DQo+ICAgICAtIFN0YXR1c2Vz
IDogNyBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzEuMDAsIDMuOTJdIHMNCj4gDQo+ICAg
KiBpZ3RAc3luY29ial90aW1lbGluZUBzdHJlc3Mtd2FpdC1sYXN0LXNpZ25hbC1hbGwtYmFja3dh
cmQ6DQo+ICAgICAtIFN0YXR1c2VzIDogNiBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzEw
LjIyLCAxMC45OF0gcw0KPiANCj4gICAqIGlndEBzeW5jb2JqX3RpbWVsaW5lQHN0cmVzcy13YWl0
LWxhc3Qtc2lnbmFsLWFsbC1mb3J3YXJkOg0KPiAgICAgLSBTdGF0dXNlcyA6IDYgcGFzcyhzKQ0K
PiAgICAgLSBFeGVjIHRpbWU6IFsxMC4xOCwgMTAuNTddIHMNCj4gDQo+ICAgKiBpZ3RAc3luY29i
al90aW1lbGluZUBzdHJlc3Mtd2FpdC1sYXN0LXNpZ25hbC1hbGwtcmFuZG9tOg0KPiAgICAgLSBT
dGF0dXNlcyA6IDYgcGFzcyhzKQ0KPiAgICAgLSBFeGVjIHRpbWU6IFsxMC4yMywgMTAuNjVdIHMN
Cj4gDQo+ICAgKiBpZ3RAc3luY29ial90aW1lbGluZUBzdHJlc3Mtd2FpdC1sYXN0LXNpZ25hbC1i
YWNrd2FyZDoNCj4gICAgIC0gU3RhdHVzZXMgOiA1IHBhc3MocykNCj4gICAgIC0gRXhlYyB0aW1l
OiBbMC44NSwgMS44M10gcw0KPiANCj4gICAqIGlndEBzeW5jb2JqX3RpbWVsaW5lQHN0cmVzcy13
YWl0LWxhc3Qtc2lnbmFsLWZvcndhcmQ6DQo+ICAgICAtIFN0YXR1c2VzIDogNiBwYXNzKHMpDQo+
ICAgICAtIEV4ZWMgdGltZTogWzAuODEsIDEuODVdIHMNCj4gDQo+ICAgKiBpZ3RAc3luY29ial90
aW1lbGluZUBzdHJlc3Mtd2FpdC1sYXN0LXNpZ25hbC1yYW5kb206DQo+ICAgICAtIFN0YXR1c2Vz
IDogNyBwYXNzKHMpDQo+ICAgICAtIEV4ZWMgdGltZTogWzAuOTAsIDMuNThdIHMNCj4gDQo+ICAg
DQo+IA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQouLi4NCg0KDQoNCg==
