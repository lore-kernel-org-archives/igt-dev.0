Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0839CA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 05:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84B310E2C7;
	Tue, 26 Aug 2025 05:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDxYjl0n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593B010E2C7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756187962; x=1787723962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q/qyLRMVDGg9TEnoJvipUoxXOnUvSBR+7rBvGI/6KK4=;
 b=EDxYjl0neXuFy69JwUKji/1hcfacX82rotyavqf66btTdYaeC0eIy4uG
 1VN85uwjE+FuZrBRKHUwGmVRIIzLAMFNYzFByJoNDxmqjD46ruIqJqv1j
 wce93N1XgeIERnvsZ+zsES/c0Q5x5Ha/mZ8FvtvFrQVzG+XWwcZEqFnep
 g5KO6DHnLbiuNzFQLvc1uF+ohY2M4Y0wjd7JNCyXWfOlZ4Jg8LElo4+m/
 EpeFUFdx8rxxTz4Vy71+7B945W72nlDq7aGGn+zJ8eiqzTu3uCrj4B+ff
 A+Zb1ZVClK+qvOY9JlcPtZc6gQdsNcOmdwgofEOS3IkamT/4I/dILnOIl Q==;
X-CSE-ConnectionGUID: DjHeorzNSQ+UKUmSuY5Htg==
X-CSE-MsgGUID: 03wtjtMbQ/6GIfxlMKDbUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58346786"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58346786"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:59:22 -0700
X-CSE-ConnectionGUID: ZWYW5K8ySEyC6zVXWd2pFw==
X-CSE-MsgGUID: mHwx9nktTGi8ADZGtYCVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173672797"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 22:59:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:59:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 22:59:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 22:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4re8TrxA7M9nrluI0bEDucG8RapgoteUogEp7lQRgFPW2J0nORyTqEEgce6M+vdgKs+RKh3ot6P+Rp0/X8j13Qr3I2E4Urth6wKReQ0/+tVUwWiBOdYEE8pe5Bth8Xsnrrc7KYZ07OSlyAmRVF5jHD3Y06AIFk16EQZAtr7CZzpS9hZqUOm8/q4PgoLC0RcxBYtvIqMp21yCAtF+4Ub3HXuMaDCUOyyLMMDTcm0XhIHNyuffgNoVaYWehYAaPJEQECzRnqpS5CNzh1eOlTQqVg0aQK3CTGWxhgTNmtLEAvvHEhZodUvpcvQcqe3bZfCpZVyqKMSErr9i7Fr2vJtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFXeSfg2OYDUL48Ur/Od1EuzBZyKWWKj3tLIgRoGBm4=;
 b=QJXzpzNMQmTg6uI7SSu6AsteDcetioO58YWtkfh2BCBzdz3j7JXvNPwf3rI2Rl5qpEQjNrGsK6mMIW0p2yQ9aQBCp0JW68Kew4lpsLOMGExdczAS/f+fKXef56+Y08P1IDQGFaAW88qxgru1UnruEa7w9Rly2jJfevK6yaumxpbvY8j1RoVKqn/nF4tuqLi4mIM1qsF2MRZ7qvkWy5OsHh93MgqlTVSJqHWutwVoCxDBYv2aVrmRgtx3t89wiOKwU0S97WtsPxnXD0QZvcV6SejxX9d7KsNmdxUppptNObvjXMlHccwJPLXvnWx11Zmg57QfD2Ad/W3r4+lADQBFkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB5911.namprd11.prod.outlook.com (2603:10b6:303:16b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 05:59:19 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 05:59:19 +0000
Message-ID: <621767da-c6f7-4bb6-964e-8ac69609ba6d@intel.com>
Date: Tue, 26 Aug 2025 11:29:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Optimise crc subtest on
 simulation platforms
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <swati2.sharma@intel.com>
References: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250826025517.1108243-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3d22ab-cf22-4642-604b-08dde465b229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUtjVGc0VXN4Y01oc2Q1SXg5ZEJBRDlDbFNXaGFqck9RbW5iNlRZdktTRlZU?=
 =?utf-8?B?QVhMdUlnQ1pwamdBeU1JWDU0ajBrbG81UllUemF4Ykx4TnRpYUNycHphSDNO?=
 =?utf-8?B?ejd5aUxOV3FHcG8xWC96bWh2YWRheE05WHhEMzJIUE4vcENIYXEzTm1WU3U5?=
 =?utf-8?B?VGd4emVtdWFsa29GRVUrUFBYWFlhcEJUYXRqSkVGKzlCbEVzTVF4REp2ZFNi?=
 =?utf-8?B?ZElTUVl0YWVOV1QrQ3J6dHRJYTFQamJGdG91YUNSdlNhSkt2RThwRC9RNmh1?=
 =?utf-8?B?c1VVblFkcjcyUzg3L1kyNCs0cWQrYTZGTmsySW1IMUsxMFJwVU5rYjFJdzNP?=
 =?utf-8?B?ejR3MWxadStuS0VJU21qUFJUWDJES0cyWWhIV1pTclYwVk80eHhHZTNzdDV3?=
 =?utf-8?B?RVFpSVNJMXZ0T28ybWNiL2lkTnRuTkZlbmJ5YklxdDV6UHB4bWRjbUpmbDhW?=
 =?utf-8?B?TlZBWmRzRXJhdGxSU3hKei92QmhQMUlPb05WazZQVWkrUkFnTEtRYmV1NVNU?=
 =?utf-8?B?Q3kzdnJuVGtTRG5VNHNDTVZxMmdaZ3ZPb1JvTFB0WXNMaXFVRDZZc3NaQTdr?=
 =?utf-8?B?b3RPdFZ6eFUwL2w4TXhYRGFEZXdBRHRKZ0NQL0hoY1ZLNHFUei81RVF1NEJv?=
 =?utf-8?B?Wmd2Nm5GdW5HMHhMTFFtTDBWZmhFSkNjOFpPSElvd2FQcEhNTW9XRXdjSmM3?=
 =?utf-8?B?cDdqRGk4UzJESjZrYTBVaXVmaTliWUp6VityeFY1OXh0Q0VvWld6d2F2VVJD?=
 =?utf-8?B?N3FhU3JNTUhBQUQ1QVRYN2M1b1EwNlNXSG84MUVDcDh1SHpJdVppRUJtR3R1?=
 =?utf-8?B?RHdQMjQvMDlRYkJuemhkdEZacVZQbFhtTE5JenZ0czZDU0RtaGlzUkdTMmxj?=
 =?utf-8?B?eEMvdytNMForWWZsNFQrL3RjdFprZmozNHpoUnBaT0VmWUhiR2RuenppWWJN?=
 =?utf-8?B?NG9lcjdYeWNPenVYZWI1cUZ4Ky9YeWphQkxDUG5TZmt1Nk9zVmJQNlQvODdR?=
 =?utf-8?B?RmZtWHo0RCs3TXRBM0lUUVk0c0pSbjdPYVJFVkhjM29mbzZPQ3ZJWVA3MlRE?=
 =?utf-8?B?ZXp0Y1pzRm4yY2FIcER6VC9EdFZxZzNJbW9XNmtyWkpodmR1amY1RkRJTjlC?=
 =?utf-8?B?dHlEYThYbHdFNllDOTRlQ0psSzFnNktYS1EwRm9pY003MFd4MHlPNG51MVJC?=
 =?utf-8?B?L0ovcE8yZFhqdFVyOFk1M0ZBS2hxeUlFMVJ1YmdtSmJDRUF5WTFYSFNrcEhv?=
 =?utf-8?B?RHgwbmM1eDFqRFl2b25aaFdRRURtRlF1VURJbkR6dFJYaituT1JDaktnM2tq?=
 =?utf-8?B?NkUxdzVRalkranFvTkNEaTR0RldJem9MVW5adHVxaWc1RzBoVVdSQ1pqSTgz?=
 =?utf-8?B?b016YjR1UHBSS1EvcmJvQzlGaDVWTzZvbGJEQWpzWUJ5T3hPOTlnNENpNUpY?=
 =?utf-8?B?VENsa01EQmRvbE5VcXVHUVhLY2FEU05zcHdRSkRWRmNuUTlGUUZOK2pEdTFi?=
 =?utf-8?B?QkxBajhjZ1FFN1pUZVh5ZjBjN3ZTdmUwd2NrM1JJUGJ5L2t2VUlYOEN0ZFVp?=
 =?utf-8?B?OFoxaGI1ZWlNUzBXQmQ1K2F2SWJQY3FmWCtTeW5rQUdsbi9TNThJdThybEJB?=
 =?utf-8?B?UmZMdVVYNVdMaGFjZVdydjlXMFI5K3AwTjQ2SzIvaUJ4cXY5Q25qL1NrN0Yw?=
 =?utf-8?B?REQzcWJqdlhLR1RGNENVVWVZWE5qTkJ3QklUWk81dTBzaXdta1dvMFV4WGgy?=
 =?utf-8?B?SDJ2dXZSTVE1Sng1ZThSOXpvTU1MU09zN2RVdDNtUnlOYjVoQmtIYWdCbVFB?=
 =?utf-8?B?YW50cDJBRk1sNFFCVkRiTFovQ2NhbTdMQThFVSsyRy84SnY0MHNxY0dTcllX?=
 =?utf-8?B?L3BFR044VWphZ29YSlBRK1I2WUlkdWUzblg1WXJrMHY4aXFpcHNEM2orQVZI?=
 =?utf-8?Q?Bbhnqhq8GjE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGJ4OVhYQzRkazFPYjdoSWRMZHFBZW1HOWQ2ZkN6ZGpHL3hyZjRzYWZKakln?=
 =?utf-8?B?b2RmQWRGeFczc0o1VmVLOE1qTEUyemdVYzR6dGk2ZUpYVGdNek9qUE1UQXVB?=
 =?utf-8?B?WCtUblgrZm9DYmg4bDZBbDhTR0Z1N2IvQ1J0clorSUd4TktmOUxJSzNPanBr?=
 =?utf-8?B?aG9hRzdPUGw0OXBzRmdDMEVJVTBnaTk3ZFpia0s1MGVFMVNuWWhaOHBPM3Bu?=
 =?utf-8?B?bW9LaTAzellNMENyeENEZUE2UXVUa053Q0pxYXYva3pEV2NtSit6djk3V2Vo?=
 =?utf-8?B?bysrUm92QTcrUHJYeVczNmtPWTJSTHJPMVBOOUpOdDJHa29oekgvT0dNZ1Zr?=
 =?utf-8?B?SGVaTWZaSStTY3hlcHJHQUg5d25uN0RPMGtubXBqL3l1YS9xd3c2ekZjZ3pZ?=
 =?utf-8?B?dmRJTjZXUVE5V0VGRkNvVmRwV0tYckJTNGUyQjNrWDk5VTIyOXM0VlBhbGNx?=
 =?utf-8?B?Ty9aekZnY3VqekJnU3MzemVkd0xIRUJzdnI5NTV0bTJiTDlJSVZiRm1mbGF1?=
 =?utf-8?B?VW9YZUo2T3B4RDY0cjlNaG9OZVJSMG5HTW0yajdRb0Z0bGFhQ3Irb0g5dDcw?=
 =?utf-8?B?NE1yam9Oc2dKWEVQMHhhVzNJdlQ3U3l0ci9ueXpkdnR3MTVreXlRaEpsWjZJ?=
 =?utf-8?B?YTExWUtZTFp3UDZJMFV3b29CTFZrZmdPc3h6RXVGdTkxY2k0TjE2WU56N0No?=
 =?utf-8?B?NGJQZHo5ZVloSi9JNzFlNFNHMFd6VjlVblFqb2ZiVkZPZkhDTC9WOW5oS1Fy?=
 =?utf-8?B?TGxXRlM1MFlRMG5DNGxsMGoxYVplWGFpRDBIdkxPZHdvdlQ2bTQ5OHUvSGUw?=
 =?utf-8?B?KzlYUDJwaTNxRzVOclIrdUloeGh2d0dhZkhkNnBvM1YzU0EwMVU0TmZnSVlC?=
 =?utf-8?B?MjhzbEc3RjFPQ1ErZ2d4WUhITGwvOGVjV0E3cHpJdEF4NmFHV2hDRzM4ODhr?=
 =?utf-8?B?alFPcnh0SFl4dU1jZzVlZm1JRzZlNUo4amxnbTgvT3Q3L3hmZklURklGdVRs?=
 =?utf-8?B?OW1aUStRZTNRRGlpVlhBWTNYVDZGZnlVMHBxSlY5QUViYkh3U1NRazVLZ09n?=
 =?utf-8?B?V1JJSUczQmVGYVdhVVVVOWx2VGk1blN4OWt5UHNpRUhIUUNjbXo2RGsybHRU?=
 =?utf-8?B?ZXFlUWhJMnNsS3JRRm5HbGpMRldHUi9uVnZHbS9QZ1kxZUJkcTZYSlh1Nktz?=
 =?utf-8?B?aFNJSXhIejhSZ3EvRVAzOWg1NDZQMmtlcnNDbGJLK3BidjVtZ2lOcmdMVFdS?=
 =?utf-8?B?WDZMeDhNczF5VXFjczA4bDNDMU52cXloSnZ5TytrK1RTbW1qWVBjTGZ1aExn?=
 =?utf-8?B?bitwMVJhQStzSmxQM01HTnUrbFUwZVVBLzJnblV6YnpXV2lFMzk3bjViRmpJ?=
 =?utf-8?B?bk5rcmlFemFRSkdXUGltb2V4b3NjYThCU25RQVJ6UFlUZHBWY2hMYUl2OGww?=
 =?utf-8?B?THNyMi93dDhlSkxtclhSZVdGTEtCYjYrZFNBdldyWXVQVkFGMFE2Qyt0bkc2?=
 =?utf-8?B?TDh5cFN5YXZrQ09pTGo0NFI5YzlRd0VrajZYczNiTHhsQk9mL2lxQW9HYVRM?=
 =?utf-8?B?V1JlOHA4OWZwL1JLcDBjdEM0OW5kdGdpREw1UkFIMnJLbnlOM2YxMmp6b2FN?=
 =?utf-8?B?SWMvWmNhKys1azRJTXhQTWlTdjF3YmlURDRVVWRyVXR4NE1nUllBNi9DbkR6?=
 =?utf-8?B?aE1EZmJPZ3ppNEFSLzFYbGNCdlFDN3N4Yk1PT3hzaCt2b003T0U0VzByQ1E1?=
 =?utf-8?B?cFhaVXVZNEE0RnhkRzMwWjVIek5vdGJEK0E3NDRsVGZCNzlVRDhVZVFiSC9B?=
 =?utf-8?B?TVVlWWlaT2dvUGNtRVk0Vk1qMVB3Mjl5UjBFZ2d3OFFPMGFHU3pzM2tmQVJR?=
 =?utf-8?B?TkZiUEgzc1dEaGZ5b1Judk5xdjNSUTA4ZytnSnI5QTcvVFN4MkFLQy9lRGVr?=
 =?utf-8?B?L3RoNDVCTmRNZyt3b3RCeEM4WVg4b0tkbGYzYStKVlUzM0xYbGdFWm5aUmpY?=
 =?utf-8?B?dWNrSzNsSmVyWjY3SzdrQUpEQUVjNzBCUjZzRytjbUZ2RCtidEVQT1JyeFpT?=
 =?utf-8?B?TlRJNVJDRlNWd1YzRmRjNzdlUENWMExxaTc0eUJPTEZNemZZbXkrVzc0Y1pk?=
 =?utf-8?Q?+3hrax4I7k+Rg+Glh1JugODjm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3d22ab-cf22-4642-604b-08dde465b229
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 05:59:19.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdL3UoIoORJPAeVpUSY6Cn2oq4GUHAzVOSj4+IzX8YcIl7K4qglrc4E9c2n99Rgv9BzELNX/6xWZBRZeNNG9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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

Hi Santhosh,

In the subject line its mentioned crc subtest in specific, but we're 
updating the DPMS subtest as well. Could you please update the subject 
line to capture this, may be just keep it generic.

On 8/26/2025 8:25 AM, Santhosh Reddy Guddati wrote:
> Restrict the crc and dpms subtests to execute on a single pipe on
> the simulation platforms as the crc calculations are slow.
> This avoids timeouts on CI during execution while ensuring
> functionality of the test is verified with single pipe.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 733abf417..817de92b9 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -888,6 +888,13 @@ static void require_linear_modifier(data_t *data)
>   static void run_test(data_t *data, void (*test)(data_t *))
>   {
>   	igt_display_t *display = &data->display;
> +	bool single_pipe = false;
> +	const char *subtest_name = igt_subtest_name();
> +
> +	/* Restrict to one pipe for crc/dpms subtests on simulation platform */
> +	if (igt_run_in_simulation() &&
> +	    (strstr(subtest_name, "crc") || strstr(subtest_name, "async-flip-dpms")))
> +		single_pipe = true;
Although this is right logically, this looks a bit messy. Can we set the 
'single_pipe' may be somewhere during the subtest initialization.
>   
>   	if (data->atomic_path)
>   		require_atomic_async_cap(data);
> @@ -916,6 +923,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			test_init_fbs(data);
>   			test(data);
>   		}
> +		if (single_pipe)
> +			break;

Please ensure to reset the variable, so that we're not affecting other 
subtests unintentionally.

Regards,
Karthik.B.S
>   	}
>   }
>   
