Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C85F1061B0F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531910E745;
	Mon, 30 Mar 2026 15:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LjVAqabU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A1E10E745
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774885036; x=1806421036;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=Jr7BP/mdaWvvGX+MbFkePrpMd9FGpGpJxsLt1Wz2AnA=;
 b=LjVAqabUjA06nnCfzTF1/280HEKcjpvqBMnBBxoHh1fU4cvfk28kBkVO
 HZzfHFHBkrUylDMEh7JRMACVJpm2mh6LkNPZTE2CVmd5liOmYhVJrtBBu
 zBqp9gLLRWx7LMLtttGuSGaDs3tXnwE6q6UDf4wymjWJCf0jcUIUUANuN
 jvVNA/EXJhbilhSbAI6i52YAAoTLLYIE7UfwMkv5e4Z6MsYSWtvd/PvXX
 Lhnrq82I4GUV6sdWP7jLuy0OPLCYaRweBQXonHzr+sjdYcB/OoNkr2Vyg
 VJ3EKf4vcykLrVn1xJljKeI0LTQdv8bTGbxdsDg98mblFrLz6giNiJFam Q==;
X-CSE-ConnectionGUID: ieyCXtvgRTu5tfWUg0P5XA==
X-CSE-MsgGUID: MY5liXCBSXmeJNimElAmNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86499781"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="86499781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:37:11 -0700
X-CSE-ConnectionGUID: /Ch4P+lIS06NjsF914G8eQ==
X-CSE-MsgGUID: nppt6MaSQma6Fw36e0FC0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="226342284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:37:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:37:10 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 30 Mar 2026 08:37:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 30 Mar 2026 08:37:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu/nOXb3CVA7n9vKNYGNtamEWVBJ/kk/8A6idFT4CZ/eogt4Et05YgM3RfCKjyZXGG2tud5B4xuybxmf6/JOGJtHycuEFqlZFbZwRrFHFKdTVIrWh4MD53TAIhLqjvO5J5KDSXsW5FjFUfE1n0jdxfU7dGF/1g62CNJQeaqD1yfMPosYcUM5xD+1aNl+KfCyjsLBoHEyuHLcB58YWuYmqzb5BeEFEYeTGm2nGRP9kbypdkJlKMo0pKv9O2aessJNYdAPrE72015KdBC3f3zFjUt2AQu0CRViCVmwZNg/hwSv0dxpFvMVALHSl5ixtx03IwtisXl0alothirxIU3apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ao/iE1CRvLbKClETJEtBP6UaXB5Evq9K5lSFUtt9cY=;
 b=iEVQwF7DQLAqOwk3myxLMvAV3SGf16JQ/s4cVp20E1tq7n5KTiFio2/t0g5u1TpTuFTMn4zNqEgPcO9GkjxMxMFR5QTvy6DBUDOd20zy3dLg8DawDtTrVHnaIwzocjwfYBZf15ySzPDyz6yNi3Rvwz8Uw3OuiEDCoMkThx+yloZlAICG4x8qFUu98qa8FB1zUpNVR4tgOgVOYZkLwAaN1RD7YZgIp0RO8QNc7YN2+ytTMXtXuHjUAos0nf36c7UBbYVCG4pHE/xAvdT88d6vlXoHORTMYZqwscTfSws3mMrCFwMK5XBifEJrzb40PqOPROgNo+1N03NK/x8dG249nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Mon, 30 Mar
 2026 15:37:02 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.006; Mon, 30 Mar 2026
 15:37:02 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] runner: Add attachments directory content
 in subtests results
In-Reply-To: <20260324131235.712916-11-zbigniew.kempczynski@intel.com>
References: <20260324131235.712916-8-zbigniew.kempczynski@intel.com>
 <20260324131235.712916-11-zbigniew.kempczynski@intel.com>
Date: Mon, 30 Mar 2026 12:36:58 -0300
Message-ID: <87jyutxrad.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB5783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5c6b03-8676-44df-526d-08de8e723033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 0SrtLSJd3ZNrM3PC91qPDBXqqc1bHyvNv6CKIHwXp+fITjYrPXCG92bERUD+QaTFDy13p2/tGllXjtdSLU1JqYnwDW2ZMyaZ1rqdZ82obh44Z4kj4ueRzDGPjXX/UuLK9XSYazlaMoRARy5/GJcJjkdo5bhekistT+lm+mPd0Pg4MNvxl0HqV3oryq0fsM6jOQbJKIeiBc9/QX/RHJaKEZLmVu3t9qCUgprU6BNk+NfLkDDLOQGpdIKqwsnxjs+97EQMa8uFb5Iu9j1SrZ4vgOXiaP58gizPcr97a9RHJHVi7BU82FgnIWeIdLd8dCyGBMwm7PA6/q1r5Dvb7oo1X9HJYBOZze08n6brFTwhqPgnV0hVYjqZr/1spROj4VIm4QuAqpJNMb5SEuHjzMYueceOrTG0WoTZuVZa0jwvvxQlRAjR0fg+I+sT0NNnjFlEdg4NfzdFzc85rcTH7+YvQi0cNWEJeMs5dafcpxhiTgmIYR3eNL4m47faNaiG3cVtcRDfLzXNqUVIT5s0+aR5d4R1s9SJf1On2MMgVUEcyHb6tEsFd0PaOZVedQvM1me0xri3rnVtai6OBHiSTIfGhi3QyrNcC1Ha4CkLyBMpKlLgU6NB53oR2PQ9z6agOTLNSLZtiGOql8AMg8B0m/yGsjBM0cJmVCbgSsHKKUD5h3wpfxiSt12bB2HzFdW/OTZ2kj2s4tSoHH5H3YLqWwENmr5jUfPq1lWNzIKipPZ1e8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emV4b2xab0JFdmR4VStKZVo5aUxaRlBrZVBzUXFnTGJycExlaXBhSzVwM1cy?=
 =?utf-8?B?UFRiZjNFK2pwY01tY2tJdUV5eVdjWDBuSjZEelBSMnJjWVFJL3BQQ3FvS1ZG?=
 =?utf-8?B?K2VQd3lCdmh2SFoxVllTMzV2R0RmMWlBYUk5T3NQT2VOT2ZYMDI4QnJoR1pB?=
 =?utf-8?B?NDNKNGI0UUJCUXo0N2ZIcC9tbEQzemdrTGhNb1Ric1R4b25uWm1rcTRYdEZB?=
 =?utf-8?B?RzArZUJ4L2pKWlFqckJNVXZ1UTZXSWduaXJaNE9jSDRSQ1EzSGVJejhuZWky?=
 =?utf-8?B?UzRMNE5tR00wZDNWbTV2ZmlKcHlsN1duNUVFRWJkdHhGSW11ZTJpd3dZYytQ?=
 =?utf-8?B?K0NkL0FOcEFpZkFiM2ltdkNEYXRFRG1pUStFUHNuVHVlZzIrN0xxRndlZVY3?=
 =?utf-8?B?cElCTktpeU1rTHRvSjV5d3FaZ0xvMjRMdlJueFJFY3liNGhUTGdDVlpmQks3?=
 =?utf-8?B?QXJZOWtMZVVVcjFYSFdkSEVSVXhybDVUUkpYOUVUd2tHYlZlV0p5NnIrellL?=
 =?utf-8?B?NXdNZTVlNXQ3L1VPd1RieU95cDVpZDZDV0szdGNRQXlVSFdlYlZqOUVvUjdY?=
 =?utf-8?B?eUdEY1lmMHBEZ3FWMFVKeGxLVHUyM1FmcmRSNVJnaU1UdWdQRHBjZE8yaVls?=
 =?utf-8?B?Z2dONFJKVXNjcWpYV0tjUFY3TmlBR0Joc05sa3dxWlVpaTZoTS9IZksveE5y?=
 =?utf-8?B?aEJ1dHpHSnZ0aGFDM1FtTHpLWEpIL0ExZW1mWTRrOVdEcFp6d3dETDJ0bTRI?=
 =?utf-8?B?VHVPbkpXaFJPU3Zyb28rNFp1OVVSWWRiMDBkcDVnVWpSUzB2Y3pEMWZQN1lQ?=
 =?utf-8?B?ZlEzbE11RUZyVHJUZGJ4Zkhvd29PVy9TVkNoRHZ3eGlGTzNEMHZNZnJWemMv?=
 =?utf-8?B?MDVaMzI0NTFhRTZTVHZmalEzTVlTbnBoaWZwK2Jnb1p4cDN5dUVwbnRsTHNO?=
 =?utf-8?B?ai9MU0QyOUdpK2VFV3RTN3dQMHB5VlV0VEw2eFRxOGNJa05vRWhJVWhrYStn?=
 =?utf-8?B?eEFkMmV3MElMVnpxYnNIV0lOVUl5T0I2QXZTcHREa2p1MlBRenBjRHVhcFhF?=
 =?utf-8?B?cUJXc05ySWNiYmQxaW9GR2NlaG9zMGQ0L3dKQTF4VDFNbTU5dUVwWDFiU2Qv?=
 =?utf-8?B?NytBUC9aMHdPRVRYSWxjOWp4WGhReGN5dnBZK3cxRjZCL3ZkbUQ0MXV3cDRZ?=
 =?utf-8?B?OWZIcStaYzJHQ1NyNVQyZ1o5bUhOSXV3QXgwblZYd09VS0o4NUZQZC9iZEtS?=
 =?utf-8?B?ZXdWcXdOZzM4VUtuMzB0cHZsV20vcGNXUTIwOXk5OHpoQ0FrdU05WDV0Y0pN?=
 =?utf-8?B?bkNST29zY3pJcmRVcmUxcFEwYWRoUXpXVS9yTEV1R1gvOHhCWkhBbVk4TlhG?=
 =?utf-8?B?QW9pSGo2VzgvWjlTZmdadTR6eitxK2dvQ3JxbzAyT0V5MlJERnVyUHEzTXh6?=
 =?utf-8?B?TkUwSVN3TE9vL2dCOEtBOTEvdENzNzM5blRPUUNwS2prSXNTcEdGODYzK09G?=
 =?utf-8?B?YzV1RDZhQ0ZOcXNpOXh2NWxZdWduVU4yMEVUZWlWa2xWSHNYc04wWS9IUXdv?=
 =?utf-8?B?R1V5Q1dxcGVsa0xadE0raGJjN29XdndvQXVwZkhodFNVWmtJa0d0NyszbEJr?=
 =?utf-8?B?NkxkWWIra2REeHhKMDA1Y2JldklVdnRmNXV0QzBJYnR2NlFHTytCTThna2tK?=
 =?utf-8?B?bVcrMkRJMGFoNUpheEw3aGd1bm5SY01IaVlPVjVnZThtMHNoR1B4K0xmT05l?=
 =?utf-8?B?RnlPZCtwS0kzVURVUVl2NUJUUVB6cTRwNEdTSlJHeGZPeEF4ejNLVlVmck81?=
 =?utf-8?B?TTZ6SUNCZTFRbUlKbjFyaWVNS21yZUliclRKWGx4ZE5hSkZNeTdrQlZBUDBZ?=
 =?utf-8?B?WXZYZ042TGozSExRNG1TOWJnRVFvaWw0RE9oNXZWUmdHSVlVK1gxb2pkVjlp?=
 =?utf-8?B?Q0JQdkxRbmpWWXFWWFpiY2ZhajhKeWIzWmsvMFhEL1g0T3RFNmR0WkRuMFQr?=
 =?utf-8?B?Y0I4RU5YbUVqSGFWWFkvQXRZUmJMVjhPVXVUZkhJOVFwa0tYcEhxMFZxMy9S?=
 =?utf-8?B?N0RmK25YdzhXTWVZeC9IOHJvY2JtYjB2Q1lLQXl6enNvcDNFVlAvWkZ0MVJJ?=
 =?utf-8?B?cmNVMThsbDZOcmYrOEJjTFVmYnNtcVdTYkRySkpNdU90L3N5amFHNVFkSktU?=
 =?utf-8?B?czZGTnd0L3lYWG5tbDlqSW1CMVdScjA5bjhiL2gxUzZhZVpxZTVPRENUN1da?=
 =?utf-8?B?cStOQTRBaDlJVU1uN0NkNElSSmEzTERaK1hvellIV2xsM1dhbTcxY21KN1VE?=
 =?utf-8?B?V3BNb1hwUExqd2ZXRDFzNTFuRXE3RDk3bWR5U01MaHhDVm1JTHBNUT09?=
X-Exchange-RoutingPolicyChecked: PJ9k4ToSlXRmhYqpNyjqgHevqwQs2uhxohBfl3Z1ctcQAM1rltQBbPko/XI/HrYb3ac9rplgcQnUhzUMvz5Gc8dMerqJnk605qdzTeb2WiK6fDzvtuD6GC5xZz7ssq27OTRncQjBbbRzU6RacfFaPK+3fUskbd/4Jo47gKfY6esYaX2ByDsAGjdWMaTCpqbS2CC9M8H/NG2ly2xYlIJKfjnoaXKMw/qMjd8cKsY6zAGTtU68qxDDDxoIYh2WqNntzdw4cR492yaTIPNwG2xhGsicPoi0mxKo4uHlr7Y1nVSDDbSPyPBWb/6Q6xazWx9bduHtQ7spRlsREyo4fqkaPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5c6b03-8676-44df-526d-08de8e723033
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:37:02.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sztw/Rn8Q35VHSPpkakx7hTBD4sHK/2MMXi4CGOnzB7BExIODq3pn+D0C9/JJWJfNTHxUtzDVoo80yGpGzAPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Files produced by hooks which lands in attachments directory should
> be called in piglit style, what means they should be in form:
>
> igt@test@subtest@@unique-filename-from-hook
> igt@test@subtest@dynsubtest@@unique-filename-from-hook
>
> depending is it normal subtest or dynamic subtest.
>
> Hooks introduced IGT_HOOK_TEST_FULLNAME env variable, which contains
>
> igt@test@subtest
> igt@test@subtest@dynsubtest
>
> and it should be used as prefix part (before '@@') of attachment
> filename when hook script writes some content to it.
>
> Such defined contract between hook script and resultgen allows to
> distinguish subtest/dynsubtest attachments structure in results.json.
> So string before '@@' is a subtest/dynsubtest name in results file,
> and string after it is a unique key of a base64 file content added
> to results.

I'm not sure we want to go this path based on the current feedback.
However, *if* we end up embedding this stuff into results.json, I think I
would prefer that the test object itself would contain an "attachments"
key containing the same tree structure of the attachments directory.

--
Gustavo Sousa

>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  runner/resultgen.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 29fc5cbb15..c4ebbd7b6e 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1142,6 +1142,100 @@ static bool fill_from_dmesg(int fd,
>  	return true;
>  }
> =20
> +static char *get_base64(int dirfd, const char *filename)
> +{
> +	struct stat st;
> +	int fd;
> +	unsigned char *data;
> +	char *base64 =3D NULL;
> +
> +	if (fstatat(dirfd, filename, &st, 0)) {
> +		fprintf(stderr, "Can't stat %s\n", filename);
> +		return NULL;
> +	}
> +
> +	fd =3D openat(dirfd, filename, O_RDONLY);
> +	if (fd < 0) {
> +		fprintf(stderr, "Can't open %s\n", filename);
> +		return NULL;
> +	}
> +
> +	data =3D malloc(st.st_size);
> +	if (!data) {
> +		fprintf(stderr, "Cannot allocate %zu bytes for data buffer\n",
> +			st.st_size);
> +		goto err_alloc;
> +	}
> +
> +	if (read(fd, data, st.st_size) !=3D st.st_size) {
> +		fprintf(stderr, "Cannot read %zu bytes from data buffer\n",
> +			st.st_size);
> +		goto err_read;
> +	}
> +
> +	base64 =3D g_base64_encode(data, st.st_size);
> +
> +err_read:
> +	free(data);
> +err_alloc:
> +	close(fd);
> +
> +	return base64;
> +}
> +
> +static bool fill_from_attachments(int dirfd, struct json_t *tests)
> +{
> +	struct json_t *obj =3D NULL, *attobj =3D NULL;
> +	char attname[32];
> +	int atdir;
> +	struct dirent *entry;
> +	DIR *dir;
> +
> +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
> +	if ((atdir =3D openat(dirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXE=
C)) < 0) {
> +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
> +		return false;
> +	}
> +
> +	dir =3D fdopendir(atdir);
> +	if (!dir) {
> +		close(atdir);
> +		return false;
> +	}
> +
> +	while ((entry =3D readdir(dir))) {
> +		char *base64_data, *piglit_name, *p;
> +
> +		if (strcmp(entry->d_name, ".") =3D=3D 0 ||
> +		    strcmp(entry->d_name, "..") =3D=3D 0)
> +			continue;
> +
> +		piglit_name =3D strdup(entry->d_name);
> +		p =3D strstr(piglit_name, "@@");
> +		if (!p) {
> +			free(piglit_name);
> +			continue;
> +		}
> +		*p =3D '\0';
> +		p +=3D 2;
> +
> +		obj =3D get_or_create_json_object(tests, piglit_name);
> +		attobj =3D get_or_create_json_object(obj, "attachments");
> +
> +		base64_data =3D get_base64(atdir, entry->d_name);
> +		if (base64_data) {
> +			json_object_set_new(attobj, p,
> +					    escaped_json_stringn(base64_data, strlen(base64_data)));
> +			free(base64_data);
> +		}
> +		free(piglit_name);
> +	}
> +
> +	closedir(dir);
> +
> +	return true;
> +}
> +
>  static const char *result_from_exitcode(int exitcode)
>  {
>  	switch (exitcode) {
> @@ -2230,6 +2324,9 @@ static bool parse_test_directory(int dirfd,
>  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>  	}
> =20
> +	if (!fill_from_attachments(dirfd, results->tests))
> +		fprintf(stderr, "Error parsing attachments directory\n");
> +
>  	override_results(entry->binary, &subtests, results->tests);
>  	prune_subtests(settings, entry, &subtests, results->tests);
> =20
> --=20
> 2.43.0
