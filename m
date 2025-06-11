Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF26C71134
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 12:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E23410E652;
	Wed, 11 Jun 2025 12:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VsaGiLui";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 437EB10E652
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749645166; x=1781181166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qJA/Q3j5U+B1zp6IBydS2hShEQ+MSevQJIoqpj2fURQ=;
 b=VsaGiLuih0H8jLU3DDdUc72PgiP+bml15CEZ8XnPm5w7Mmg59FOWW3fo
 T2aQm9FvS5+EcK+4F98BWCo1cTu3jMivv5uXvJ+IWNMg6+13TOP1CShST
 yc39Kc3BAv5cz0fH30yEiwGRhKiadYwTtoNEng1dv++LYpix2uu6tK+Tw
 3ESnG5tsF+3c5hEzItETNE9xXYSiDw4hd9fVCKnGGcYzK5tw0HGVXznP7
 jXM72iIVzjv7lqNQvN1ONtFzaClmgu41V0RFtxpjI1glQK91eX0Cjb/NZ
 1bu6mFwk7Ovlxr11Ahrx+8D7gDpiR1pFu0UYr6UDv8YdBPEh/hxC7pgnr Q==;
X-CSE-ConnectionGUID: HT8ljj8/SQiE7d0jW96d8A==
X-CSE-MsgGUID: WDxF2oKnRXSMSktelowkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62065161"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62065161"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:32:46 -0700
X-CSE-ConnectionGUID: Ajyi6988RkCmojdz98wP4A==
X-CSE-MsgGUID: ZA1EPVJCTWOWgVUCr1iVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147100912"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 05:32:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:32:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 05:32:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 05:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW599Vn1Y1KH2V7R4imqjfoHGn3OV33ArhBq79eQG4UjaNPdxglNzAzXrg+subtWIRI/bym0wZeSELGvpxwUkwCOCij6rv84eMs/JOwWn645G+hYhlZi76iLx0qV23PhgvzjJ7FAhC69OxWK1Tp8G5QAqU4as+Wi146sAhvlUSEwSfj58DwL+sGUFTjYmTzanvW7P4eKujIM5NJmhVsP/zUoXr+GX9XymsAWFBnjQt53vW2UAjRZwrNgF5aiyKj7E2QyeTUj6N4Nzb5geyNW9TNRqX0kW9WjSu77+/RJKVKjLoIcSaVoL+msq/cqiQqJQy3dP3IlPNR6ln7Cn9czSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJA/Q3j5U+B1zp6IBydS2hShEQ+MSevQJIoqpj2fURQ=;
 b=CVGtEPblP/Kf9k128GLMxlwWNVWMJO83c8KEPUANdy87W6FoSGken9DG19pbtXqFfaUjEgDsI0sb/McK6fGAhWk5IC0eUy5fFLy6lyVZrr7wVgu9phCrMXwW19Kb/Knt/C8POJhdC5xAsGMmKQ00D3Zkqb9B7m12YFuS7F8iJeE97JFi2WfhzC9CEA1iW6SaHTE5cEbHT7KnckqbUKS2PAa8I4OdVyPZ3KJJQ2icbjNLo+eZxgubzhjAe0bMeVT9daD6qi1ITOrzbnoebNlzku1qR05rWhYDE6L1CkLAwUXQNoKShLb8STC1UjeExpDKVsom32r/W1YQIlJ2c/8skA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by MW6PR11MB8437.namprd11.prod.outlook.com
 (2603:10b6:303:249::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 12:32:24 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::64eb:1ed9:fd84:f0bc%3]) with mapi id 15.20.8769.022; Wed, 11 Jun 2025
 12:32:24 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hajda,
 Andrzej" <andrzej.hajda@intel.com>
CC: "rk@dragonic.eu" <rk@dragonic.eu>, "adrinael@adrinael.net"
 <adrinael@adrinael.net>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [v2,4/5] meson: bump required and tested version of meson
Thread-Topic: [v2,4/5] meson: bump required and tested version of meson
Thread-Index: AQHb2sziRnVyZ2VPnU6jVuIqShK0Mg==
Date: Wed, 11 Jun 2025 12:32:24 +0000
Message-ID: <21a248d03b513492206b1f7239802f705dc65e12.camel@intel.com>
References: <20250611-bump_docker_distros-v2-4-90791ecb953d@intel.com>
In-Reply-To: <20250611-bump_docker_distros-v2-4-90791ecb953d@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|MW6PR11MB8437:EE_
x-ms-office365-filtering-correlation-id: defcf1e5-ab3e-4102-96a0-08dda8e404d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmFTTFZkcFBwNm5iaXFKQ1RYWWY4M0RXeUloM2RDZ2I3TzB1dGR2K1M1M1VM?=
 =?utf-8?B?YzJHYUIvTnpNV1JNdUpyQXB4UXFxMjhraTQrdW53N3ZlaVlZdjMvQnA4cytz?=
 =?utf-8?B?LzB2U0NybnpVUXhTcWIxbEhrb0FIWFF1YUh4RHR2b3FCOXlqM1VqSGhjcUR6?=
 =?utf-8?B?WXJvYUkreTVsdEQvVXJYV3pWU3YzbWEyc0xpZ3RkQysrTElON2JBZVFzM0NC?=
 =?utf-8?B?SlQyL3BHdDdYV1VQSG9kUXRpdWRETGVLSUs1WXlpZmVmaGszYk9ZS2NBQTlr?=
 =?utf-8?B?UjdvQVdHbkFDbVFJQWp1b0ZhUk12L0tVa1JjT3pMY0ROSHNlOUFONjRXMFAz?=
 =?utf-8?B?TFM1RWY0Ti9TaXZiSE1qTHNER25yVmZqaitnd3FqUjZWMmhzWDFXNHB1TjE4?=
 =?utf-8?B?RU5iZFViemtWbE51YVZreXhvVmdoYXk4VDRqMjFnWXlnWTEvNlFIOUJHZ3VN?=
 =?utf-8?B?L1h1dm5SRU1iREg5V3l1OTAzWVl4Z0lMTHY2bUlKV2FYUlVjc2pBVEdEb0tN?=
 =?utf-8?B?TzJveEJWQ2RHRUlkaEU3U1haeFVVN2RRVys1dzdHOTdhSC9hTFFxNHFyaVV0?=
 =?utf-8?B?L21sc1NodkNvL3NxVnBGN2hNb0g5ZUdMSlhUM2xXWHRNSDMrdG1RVUVRTC9Q?=
 =?utf-8?B?ZC9DOC9BdTJrSEpPbG5iZm1lR1l3QitJVDBMNDdhYlBxS1pkbHFhR0p1SktT?=
 =?utf-8?B?bWxCZ2lBRDhrQ3JVcjYvMWd4bGRIeWQ1MzBJT3dqTG5COVBiczE5anhEWldZ?=
 =?utf-8?B?ODc5bFBaWHZDK3ZuSC9mNk55NU5tK0laQnNWVHZwNEQwTFNOVFNZdFVIbG9w?=
 =?utf-8?B?NUFqQlFqcXBRMnBCc010QTY5WUFUdFI3RlNCTU5EMnlIbnlQbmNzOUYzV0ZH?=
 =?utf-8?B?aS9rREZFbFVxMGNJcStvVHE0TktaUG54b0dLYkxVQmNoU3NmN2RaeUN2ZmVt?=
 =?utf-8?B?OElhTlF4L0t4a0c0ZVBVNGZJdnZDM2RZc1M2am9UR1U0Qk8wUXlTcEFTeW8w?=
 =?utf-8?B?UjhFc05jUEFiREYxOG5hZU4rTVJWTXMrTTVST2ZVZXlKVGZJbk9uSE5oZTJy?=
 =?utf-8?B?UjY3bEVITTRBZzBlakd3OU1RUW9UenNOb1hoRGhSREhSSEJCWVpQbGp4c1RO?=
 =?utf-8?B?Rkx0dkdVaWIyaTFYcHIwR2lvZHZidjA1RUhOU3VRcXROdDhlZWRQVFI2bEZu?=
 =?utf-8?B?R0RzQWpXejBBWUtaamowZ1lNZjdxSDN5YVlnVnZPMENUZHdKT0pLSlNmcGUz?=
 =?utf-8?B?bXpFUTJhUWxIUzhENWpWNkNwOGgwVVRHU1pWejFvTUU0cEtGeVpNaWtUc0hF?=
 =?utf-8?B?ZVJVVm5iS0VhYU5jWE1ibFIxMFZPck5QdGNWREdnM0FoakxCaktwVGltbmNv?=
 =?utf-8?B?KzZrZUhCc2V3YTAzUHp4eXlGb3J2em9IMVp1OWRNV0RFZHJFcUVvbVg4S21a?=
 =?utf-8?B?UVVyaE9idlpXQmtSOGdjWlErdDMvK3BRMjJSaUpqYmVyYlVaTkpOL2c1emtI?=
 =?utf-8?B?bTFSR2xrTDJTU0lDQ1huOU5OYTIwNllydHBaNUZHUXdBc09nZzRnYUR1SzFZ?=
 =?utf-8?B?OHRVVlM1RlhIZzY0RmVpR1JlOEhTcDQ3alQ5MXY2ZVhQb2lTd0ZSTVk1SUJD?=
 =?utf-8?B?N0Q5dTllbUxHQkNrWHE0aWpnMU9ySVNDcWIyVFpRcXZsa3RjRVNSdk5lUkYx?=
 =?utf-8?B?MFphYlYycXhLM01SRWc5MFNZeFNsRjVGT0dLdjlXenpXa0RGWVRuZEdOOEJT?=
 =?utf-8?B?T0cwNWRGWjd4WFBzaVNnSDc4WUdwbjNzSGNEdTdQeVJDNnZCMXVSQkxvTG9h?=
 =?utf-8?B?TThLdm5NUVhvM0RsOTlEakxjL0hQWXV0a21ZMDlPMXAyUkxxUWFySjZZd0Vk?=
 =?utf-8?B?WlZJY3A5eWJpZ0tqZE9sVDM3bmJ6c3ZUWXhxV0REMng0MHlUdjIzRDBpaURX?=
 =?utf-8?Q?PiJ3m9jFtcvlIOndTGCBpAFxBYugRz5J?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VHSXNPL3RSRTUyRjk0QVlpWjdiOTNGakhWSk9FQ2s4Z1ZiVC93ZFNWK2ts?=
 =?utf-8?B?SUZ5UlppanNxRXpETzVYdHhYalZHZlhBUzVCdWtnbXhEYVZKYVY5cWVIWmI4?=
 =?utf-8?B?WnRMNElsUHc1YS9UUGpGcEx2RXp0NkxUaWQyYUZNTm9PQ2xBM05vdm5mUXNV?=
 =?utf-8?B?bTFnd1pwVjZmeVdyK056M2Q2Y040NUtLS1ZZOXBmNTUxSy90b2NzYXo2aVc2?=
 =?utf-8?B?aGM3ZWxETUxGZmtTbWw4OVA1cXRjRXdBc1JpWUVNNUhsV2xiY3RySmxWd0xm?=
 =?utf-8?B?R2xlWC9yYzFoZVcyeXI0MFlUVjN0Vk9kdjdxZDUra2RISUlhZU1YcXpESEM1?=
 =?utf-8?B?NnFQUmZmZDRHaWNtYzgrNS9BSUVNOUhYYWx3TnZyRzNsL2tQdFRVL05xSXJY?=
 =?utf-8?B?YWt3TmZlWXlYZUZrRldsMXhyUEoxdTVUWGQ0eFgySE5FdjZXdWx1bmhCSXdv?=
 =?utf-8?B?clpKdTRrY3dpN0JJV3hHRVVBNzhyc0gzbTEzL2d5SVBMRkE1dnZMMVRjck03?=
 =?utf-8?B?Zkx4ekFVTDJCVWtJL3hxTVRtOTFCL3ljSnM4S0pQbGlVaTByYi9vbUZpMEdp?=
 =?utf-8?B?YTVXUEdXV01wMzBkRFpqckt6RDRhTTUxSHFjbnRVdHlBbnBNTGIzWXBvQWpD?=
 =?utf-8?B?bloxY1FEYi9SQ3ZRQW0vR2VhZjJwcjBxMTA5eDF5Y0liOEVDOHlUOWZ2M2Iv?=
 =?utf-8?B?VzFHN2YzeHdVN0ZuMVRwQ3lYL3BsUHRJaW55TUxGLzZ6WmFWd1lKdzhxeFFs?=
 =?utf-8?B?cVVpZnZoNnpDcWt5MUlTV2dJZUVHL0t4YnVlRzAydjZtaFlBd2FzeFkwU0Fj?=
 =?utf-8?B?ZGplMWRONlFvb2dRVVBrYUwraHl3Z1NGeFRXdGlBbWIxUjV1cW1pSTN2cFlB?=
 =?utf-8?B?UXFvWXNQYVpqMGZ6bFc5djZNSDFzRG1IZXc0akJhMFFGMUV1U2RBbHJzMmgx?=
 =?utf-8?B?RXYrckdGQzA0U0FJdTBsZnFoRWt1RjNCRWxoRGRxYWhKUFhUcW1TZHBDT2Q5?=
 =?utf-8?B?UTM4RmdNUmR5NnJURmRnR1Q3WTVDc2ZMUDhEMHd0dS9KcTlCZExCTEJkdGpN?=
 =?utf-8?B?QXpjSWN3d1JZOS9XaWVNOEtrZmhKUjc0ZStIN1BkU2IybFBONU9IZGhVZlNU?=
 =?utf-8?B?ZG52TkxWVXd6T3QvK3FCZUxJU3NoTTFieE96MXZMR1RtcGt2ZjBlVE4xWjdG?=
 =?utf-8?B?RnRLTzBaMUdzV0dYb2dXQzNzTHlVdG92VmYvUHNCOHpwZWRDRU1kd1hWSU1H?=
 =?utf-8?B?NFpHTXFvdzkrVkFtN3laYjRxc3BYNnA1bGxreDBqR3dnRlo4YXA1SnI3RkNH?=
 =?utf-8?B?V2lUdDd4RjlwM3NBSFpyVlZPSm1EaE1BckhTNHUybDdsbXpCcElDMXkvdURs?=
 =?utf-8?B?QlJNaFpNVnZtNVhoZHZ0MGlOR3cwREdEd1Bja20rNmtXb0Fsd1hBM3JwUGgz?=
 =?utf-8?B?UDRkY2M2YXBDUVlUNlVLRCsyMUdpVXFOSGJ0bzBsTk9oUHp1c0dkRGlpZDUw?=
 =?utf-8?B?T0haUS9QNWpxUVl1cm9CNGxQcGRyM3dIYURmMktNdnY4dVlwTEkzVmdnSjNV?=
 =?utf-8?B?NFgzSkwvcXQ0YnBWdEtTM2YzVHlCa2JHZ0k1eXU1NUpnY1JRbDBsMWRRT0U4?=
 =?utf-8?B?THhYQ1IrVFdackk5UEFhQ3M1cUVhZE5jRXpDbTFhVm0vekdzb3l0Mm44d2th?=
 =?utf-8?B?Q2txUWxweGJXeVIvZjZydUcxL2czcjFLZk1lSHhxZkgxR3ljZ1NObWNUQWNl?=
 =?utf-8?B?YVN1eENuODUxSk5iWlJzZkVRblFiYm5yREdnZUdMTmFXUnNMUnhTbVQwVTdI?=
 =?utf-8?B?TFRoUEljZFJ3TDZ5YTJTWW5hMnZDWHdRUEdsaUVVTTgxWUw0Vk0rRUJ3TEEr?=
 =?utf-8?B?WCtJbi9KTzR5eUV5ei83VkYwdGhwK29pcTlCaUo3aVN2TDAwQlZYZm5vZ3Zt?=
 =?utf-8?B?Q0w1OUVUOWVmRmY3Vm0rYVJrRE9NbDJ2YzFNZXZXZ1gvTlkyQ24rZ3E3dW9q?=
 =?utf-8?B?dHVTanVIWkRuOTVxR05tYkpFQnl0dzJKRHgwaGRJR0hJa3BWYTAyWmx1TzNO?=
 =?utf-8?B?bjh5dUZBRzJqSHZIZnE2NmdwSXpHL2FvRGJQbDYrVjFDeUxzTjdqQlBPbk9Q?=
 =?utf-8?B?N2FvNXpRS0FBUWkwRGdVZWxmajd0SSs4T3NaMTdiaVE5a3Y4ZUh5NWtUSys2?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF0F3651782EA541A9009215F05E5F70@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: defcf1e5-ab3e-4102-96a0-08dda8e404d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 12:32:24.3437 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F98Scdt/2yYXyhnbtMIpwCw47iIItRsdUXPkr28VWMCtKHKEe0pu1cnR/aSCwg0hKnJr2+DdBo7AnUJImrNvnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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

T24gV2VkLCAyMDI1LTA2LTExIGF0IDEzOjA2ICswMjAwLCBBbmRyemVqIEhhamRhIHdyb3RlOg0K
PiBGdXR1cmUgcGF0Y2hlcyB3aWxsIHJlcXVpcmUgbWVzb24gMC41Mi4gTGV0J3Mgc2V0IHRoZSBv
bGRlc3QgdGVzdGVkDQo+IGFuZCByZXF1aXJlZCByZWxlYXNlIHRvIDAuNTIuMS4NCj4gDQo+IHYy
OiB1cGRhdGVkIGRlc2NyaXB0aW9uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyemVqIEhhamRh
IDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4NCj4gQWNrZWQtYnk6IEthbWlsIEtvbmllY3pueSA8
a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBEb2NrZXJmaWxlLmJ1
aWxkLWZlZG9yYSB8IDIgKy0NCj4gIG1lc29uLmJ1aWxkICAgICAgICAgICAgIHwgMiArLQ0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvRG9ja2VyZmlsZS5idWlsZC1mZWRvcmEgYi9Eb2NrZXJmaWxlLmJ1aWxkLWZl
ZG9yYQ0KPiBpbmRleCAwMGY0NTg1N2MyMGY4MjMyMDUwMGU3MjMwZTcyYzk1MjI1MjdlN2E5Li41
ODg3MzhhYzQyM2UwZDI3NGZhNDJkZmE0MDQzYjQ0ZDRjYjFiYWQ3IDEwMDY0NA0KPiAtLS0gYS9E
b2NrZXJmaWxlLmJ1aWxkLWZlZG9yYQ0KPiArKysgYi9Eb2NrZXJmaWxlLmJ1aWxkLWZlZG9yYQ0K
PiBAQCAtNDUsNiArNDUsNiBAQCBSVU4gZG5mIGluc3RhbGwgLXkgZmluZHV0aWxzDQo+ICANCj4g
ICMgTWVzb24gdmVyc2lvbiBzd2l0Y2hpbmcgc2hlbmFuaWdhbnMNCj4gIFJVTiBkbmYgaW5zdGFs
bCAteSBweXRob24zLXBpcA0KPiAtUlVOIGN1cmwgLW8gIi91c3Ivc3JjLyMxIiAiaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzL2U4L2VjLzNlNmE2OGM5ZTBmZDRiNGY0ZmI2
ODc3YTNjY2ZiNmY2ZTZkMDlmMmI0ZmM4NzY3NGU2NzFiZjY0YjdiOC97bWVzb24tMC40Ny4yLnRh
ci5nen0iDQo+ICtSVU4gY3VybCAtbyAiL3Vzci9zcmMvIzEiICJodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvNDMvOWEvZTBiY2VjNzBkMjkwOTg2YzYyNjVkMzJlMGEyZDE2
YWNlN2VmMzhmNThhYTVhNjUzMDg5NjcxMjlkMDk0L3ttZXNvbi0wLjUyLjEudGFyLmd6fSINCj4g
IA0KDQpBZGRlbnVtIHRvIHRoZSBwcmV2aW91cyBtYWlsOiBUaGlzIGJsb2NrIHdpbGwgZ28gYXdh
eSBpZiB5b3Ugc3dpdGNoIHRvDQpBbG1hIG9yIGEgbmV3ZXIgRmVkb3JhIHJlbGVhc2UsIGFuZCBh
bGwgeW91ciBkZXBlbmRlbmNpZXMgd2lsbCBjb21lDQpkaXJlY3RseSBmcm9tIG9mZmljaWFsIGRp
c3RybyByZXBvcy4NCg0KPiAgUlVOIGRuZiBjbGVhbiBhbGwNCj4gZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQNCj4gaW5kZXggYjg4MDk4MjM0ZTZkNzJkZDJlZDRjZjI2OTcy
ZTdhZmVkMWIxYWVkZS4uM2QxODI2N2U2NTI5NDNjNTk4NDU3NTQ5OGRkZWFjZGVjN2UwNzlkYSAx
MDA2NDQNCj4gLS0tIGEvbWVzb24uYnVpbGQNCj4gKysrIGIvbWVzb24uYnVpbGQNCj4gQEAgLTcs
NyArNyw3IEBAIHByb2plY3QoJ2lndC1ncHUtdG9vbHMnLCAnYycsDQo+ICAgICAgICAgICAgJ2J1
aWxkdHlwZT1kZWJ1Z29wdGltaXplZCcsDQo+ICAgICAgICAgIF0sDQo+ICAJbGljZW5zZSA6ICdN
SVQnLA0KPiAtCW1lc29uX3ZlcnNpb24gOiAnPj0wLjQ3LjInKQ0KPiArCW1lc29uX3ZlcnNpb24g
OiAnPj0wLjUyLjEnKQ0KPiAgDQo+ICBpZiBnZXRfb3B0aW9uKCdiX25kZWJ1ZycpICE9ICdmYWxz
ZScNCj4gIAllcnJvcignQnVpbGRpbmcgd2l0aG91dCAtRGJfbmRlYnVnPWZhbHNlIGlzIG5vdCBz
dXBwb3J0ZWQnKQ0K
