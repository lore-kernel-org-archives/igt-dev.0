Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2213C606A330
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n+F+99qN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA91110E7EC;
	Thu, 29 Oct 2026 10:43:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F2B10E7EA
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 10:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793270562; x=1824806562;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=J2CFB4aetJaaK++0pRYquhXZ3xo6idlvQLJkDOoD3NM=;
 b=n+F+99qNX4IFFgdQEGUT76trKf5XoCp22jDkS33aDmuvntoV28gqtvUt
 okohs5krMEi+QO0iyGvXmM4tZhmWiJ0YTy1Grj4yp4sKFyDYaD51N/xQe
 6QxLRi9uqPZLCDpnQyY50UoA1qdGRel7TAVZPoR8boo6v0Y+SZFXTWbkg
 Oycd5CZ94xhoCdRELqoA2j74pzAlpxeRVIXfYxBg/IuKkL9ZoPOtPzXwy
 Krm9jt1wJFb59SmCpjhSNiCKUYvJvN7ESVVC+q8jrhoDigRpIv2hhJdR1
 H3dsSUNPn/HliMnCm5Od1zlRrXke88N54MVVI/OQOCrXChxoK1jQqclzD Q==;
X-CSE-ConnectionGUID: WHmQPDoESrC8+MAnSKQX4w==
X-CSE-MsgGUID: Oc0wuP1gSQe+LicrGTIoUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2021110"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2021110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 03:42:41 -0700
X-CSE-ConnectionGUID: SKCiGtyrSEKQyJCK45xB3w==
X-CSE-MsgGUID: gyR5QyCASYmvScpin9vRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5043264"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 03:42:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 03:42:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 03:42:41 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 03:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfzrlYMWTOivDPX/LSnuzEDu6L3upH9q8Pu/+rccIuGmN0PPtOiaBKfTOkzM2NFYewg/tAmVsSa6cvzsUST4e7BYYzlygc1AMyRrrW/ukYA087Y8k9R62VNi9gHEBdc0dcBydQzEQQpbPxxBZBmxEORNg1dkKz/wWP+gYBzI5/UT0CNn1IHQ8uG2OKEAaBeD3B9R9ffooJpS2UvAvZQRPnmqSLDY/FTRK8mW87M7h7aSaQtWrfUizlfDVqBuj/sHbWJ/YWLqYGPBKqzWB7OT94HeJ1nD8COtCZFvNcdt12GJ21WTuNgCaj36EZnAaPon0F/UVjvSNTVo1MmB6+p9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3e1Oics7up3vKkH/fqQPWhNAZuH4UpHalgNv7/xOhw=;
 b=i3vdyhSKRL1B28LrTrTSMX2gG6FHFPgELzTTKLyakFNFMvK/IJG//WnTiDcbonhNIZv95v1n2Ibh6zw6ZZbAdp80uXOSiGrbAUzOyOyg0Q23MgM/787oWLLtIV38145pIpmnEzHiROFJZqwxUO67KM2vUMPZ373bC6gVINbDKtblMyAghug3L9vTGQ19CiweAHpuzPkIi8o1Kuw6SggmW3QQqg8O22E0bB/pLF7OHBV7ASQUJPJFhhBpwzgXZqpsxQFaM4laIHxZigR/z4RXW5IgKsq/YsKdRiCqkiQ9Nk8UQLmug0yGHCFLYcmoDvyMsr0euGxpKA+cJQLr2JyEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PR11MB134916.namprd11.prod.outlook.com (2603:10b6:8:4f0::21)
 by BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 10:42:33 +0000
Received: from DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4]) by DS4PR11MB134916.namprd11.prod.outlook.com
 ([fe80::87f6:b354:5770:3ad4%5]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 10:42:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Oct 2026 11:42:46 +0100
Message-ID: <DMH9D1GKZHCU.3TINOPEPE1G04@intel.com>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v2] tests/intel: Add edge case and race condition tests
 for GEM_CHANGE_HANDLE
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: David Francis <David.Francis@amd.com>, <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20261015145355.3972674-1-David.Francis@amd.com>
 <20261015145355.3972674-2-David.Francis@amd.com>
In-Reply-To: <20261015145355.3972674-2-David.Francis@amd.com>
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To DS4PR11MB134916.namprd11.prod.outlook.com
 (2603:10b6:8:4f0::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR11MB134916:EE_|BL3PR11MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: f26a26f4-0f04-43e7-0055-08df35a9568c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|10067099003|261026121527099003|261009223027099003|261022075727099003|261022105027099003|261009221227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: AbrqE4FyxUzKgws0+OnK7IKM9nJ8j6gyf9qmb+d51daE0S6/7RTTCrok/aAxcwfUHTQU/F1hZGK2T0i0R8Cy29kNoHUX++9kZTa4AwXOAtOJFfM71jP5tauR17eojGrYyW6sQGDR12LzhgZBJtppvJKXZCns5oh8MxafEquNu5IvZ7hzgzLp8zUto8fJaoO/Md2/SX9CB7XSrKcB1PEfk3phoA6HH1me+9f+EXo9bwszgOpUusmwDsx8gwfAWtX52fOIn8KoxyAb+cGZt6Si6Zx4SSLUwPsiL8kt7ZQEFof22Ks2qNGHrm8izL88/UQbOFIVDpW2TFmL3lT42UtbxXEyZsqRE8sH0qb098zdREHKWk0af+89cIBA3ZIwv36KBXjruqyN8TXwBxZd8/jukl806nUDRv6zyN07/X+4wNDrl5bhLi/1VR0EP7XNOoN+Le2GiYH73zx4DPZSaVYduZjwUhJps8mBW8vG2+Alnu25gzmvXEaftC6ylkOxOQ5AtiHbp9s7zC0nu+aOCsH5ODCVl9tRUnidL/OAK7+7qkH3Z99t8N7a9YwUwN09TTNscdb2jQRJ5MWds0AVZcIZUbPAXg+Vka6pq3t5Bwf6Tl0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB134916.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(10067099003)(261026121527099003)(261009223027099003)(261022075727099003)(261022105027099003)(261009221227099003)(261028144727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVNHTmhlczZoZlhyZWVFUVRNbzU1VXlmdDNhcTZqb1hyMjIwMlg1NklvV0RC?=
 =?utf-8?B?TnM3bGgvekExM1pvR1hXUG9OWERKR3Z3a1JsM1JLL3lDUGpxZW1pUkhhcUo4?=
 =?utf-8?B?VDVBaGkybTd1NVZTWEJ4M0UwMllWQzZoWkR5L0V5Yk5PeEhpWTd1WmtGNDlK?=
 =?utf-8?B?V3Nja3FNNVBqS0NpTFVFYjRGL3lqWExIMzZRR1NPMW4xc1RsaFRiVjlObEtY?=
 =?utf-8?B?bEVXcml2K0xkdDBZVEYxbWJxRXRKSU9oYk5TaCtNclZRd1ZKbTQraHUvbmZB?=
 =?utf-8?B?alJwaDNPVm5aWXVRTDJHRWhyY1c5ZW0yRmVaU2k5ei9rdCs5c0pmMUpuRUND?=
 =?utf-8?B?WWFBYlhzWk1XdjlXUUlDNXpOQzBmeU5XL1F2bWF3K2I2Q0VDVFlJQmJFSU5W?=
 =?utf-8?B?ZFA0djNSZi9uUVArZnhJYTU5UkhKVGZWRTNnaERTNG5HNmYxZnM3em1kZGV5?=
 =?utf-8?B?VThrOCswN2JXYU5ySVB1KzBGcjZiWU9qV0kxdlk4eW1wcDdReTZUM1htbVZt?=
 =?utf-8?B?RUxDcDd6UEp5cS9hTnBOSE02eXJnQys4UjdESVpkWStoNUZ1eEV1Y2kxTk5s?=
 =?utf-8?B?aGNiZVNsVDkvZVB4LzcxR1NlMHZDS1JrcGErV25NYklSbDcvWVhuNFp4SkZZ?=
 =?utf-8?B?SHQxRDQvWU9veWhtUEgxVDZMbUdrWGlsQi8vQXBlREdLOFc4aWZrWjJhUzRt?=
 =?utf-8?B?V0hIQnh5bERQdXlyYVo5dTFrUzFObllSK2tSV3lQZm1lckZEeU8wVzJDNG9p?=
 =?utf-8?B?VGhEM1dEbTNZaWlxWlNSUGptS1dsYTJ5ZitXdXZzNzltdjExVkJPRXBPUzN1?=
 =?utf-8?B?WFNzb3JadEkySUtrWkUyNHhNMmdFc2R1eXU4ZkxOb2l1Z0h4Mm1CMmNTUVZ4?=
 =?utf-8?B?MVdzNmVHVUExZmJQZzIzdjZUaEZONm5LSHFzdy9lbnprVnhHV0t6SWgwdEFz?=
 =?utf-8?B?ZmtiK01JOUxMWjMyMCtrOGcrQ2VSQTFINm9uK3AyYk9SbGhSY3RaVUpORGxJ?=
 =?utf-8?B?czJSS1lqc1RTQzQrb3JBK1lyZzRmMGhMdE1ZSC9zZlJlQWtEcU05Zno0WDJ1?=
 =?utf-8?B?cWxnc1FOVWxRTlZveTJwakNQa0pFOWtPSnNKS2FIdXo2R1FlYUlCYjdLcWdN?=
 =?utf-8?B?aFVPZ1YwMXd5VThwcTQ4RDV4SmtOV2RpNGp0YmNLRHhGOEl1d2MwSnBDQlhO?=
 =?utf-8?B?Vm9sa3FuOW90QXozeW41WUxxZ3RJd0VhZFRPRFZ0ZEREcDkzdU5SQ0gwYUhE?=
 =?utf-8?B?MzBpWXIzSzlScTZqeHlIdkd3Y085ZEZKRkNRMk9pRkZFUGpEdXJWczBrNi8x?=
 =?utf-8?B?WTArVVdLYlYxWDV1eWdlSStmaStDS1daRk5FQ0hDSENJUjBYUUI2Y1ducHI4?=
 =?utf-8?B?NENHcDRBOGpYSHFabGowT1lNWHY5R2ZJd1BHZ2h4bzY0ZkFUNEkwUXpZL24y?=
 =?utf-8?B?MmRzRDlwbEZSczhxUGZyaVI3aVdLYTdaZjdzQUZtdEMwOUNKZjhrQS9jU0lG?=
 =?utf-8?B?cVlBMGsvdE1hVHRUWjBPaHFVT1lYblNlUGtsRTRkZHk1Tjc4eWx6aG9HS1JY?=
 =?utf-8?B?dGRIbzJLQlljT3h1YWRRZVd4ajJGMkRsWEhiTjd2WmZWOFdlRlA3RmZ1bmJQ?=
 =?utf-8?B?UCtWSk9hazdjQ3E2N3hzU3JHVVRHdmF0eS9xQnY4Q1hLSHhlTzdTQXVUbHZZ?=
 =?utf-8?B?VTZTdkRPZFlKUGhJdjBUN2I1MityQU0vRmhkWEtXZlZKRWZYR3FXanlneGNR?=
 =?utf-8?B?NjdBcGU5RWx1QXdyUnRKQnNWMjR6ZDJVWnhWb2tjRHM1ZUVaT2lWWWdSLzh3?=
 =?utf-8?B?bjJoY3oyOW9qVFZuclJmcXRSWTRnQVBTY1RkYldGT1BxWk5scUpKaXROZkVQ?=
 =?utf-8?B?UFU4QlpIOFltcm5DSUhCYllGdTZWNmV0NDdSbVRhdVh4OUpzNVF2SE94aVJl?=
 =?utf-8?B?VXFBaHozZjltaU93blB6UXNEOWNTT0lGbS83WW8xaFVZYVlJbEI4azhlTFpk?=
 =?utf-8?B?dnFaVVA0bVQ4VERkbFFjMVVHL1NPbWVhc2hwaWJHWnBVeStKbGFtNTQ1VzZt?=
 =?utf-8?B?R1JucUVEd0ZzemVmc2NnYUhlQTVUWjhwZExuamVjM0hsZlhnN214eWhhWHNC?=
 =?utf-8?B?VUNKMjJGV0FWb1N3WDJCQ2Y0SWhZYVA5enF2dmliQU4vZlpHMFphYTlXakVh?=
 =?utf-8?B?a0FDK0d5WTFuZzhnZTNibHZBTVZhNmcwWjlmL29HZlMvU0V2UHBWRUV3eE1X?=
 =?utf-8?B?UGN1NmJoa2ZmY1V5RkhQcGU3OG14VFpuSXFrM0lqWVJhTnFEWTl2ZVBsN2Zl?=
 =?utf-8?B?MmxiaXN2ZDdHQ1hFOTZRM0FySFBlSmdEZWl5OXJjbzBKUFBFYklzd28yRXlj?=
 =?utf-8?Q?HyDz33mjR7V9TAGA=3D?=
X-Exchange-RoutingPolicyChecked: tK0/+zEs424ywzcY/mzhTRkEw2dp+Rzca0lT8cIaLHPKsfhKMA6HajSEE1pRZdln5gEEQXBIWzoitonNBpekq6rssrMSNSxO26YWA7LxejC8+DlynXh9YQMVM/e7ygYWkYwtH5oXPeRweySDLPXHn+B+XmsCaquBHh2zMZbWyX2YzKEgNX7z7XYA6lZpI2vSFJLyFL1SaxDo+D0jTSCwV/Iu1IQfJnRI53eAUTdG4iBKq1Nt395jQD5Ifhxza63MNH4YZ51ELx5tQjno0VLBmmrhjOkAmivjMCB2VoBHvbP7tZUrp551DYkoPobncoRBt32HaV/+u5p2Q8uiaIsJ7Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f26a26f4-0f04-43e7-0055-08df35a9568c
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB134916.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:42:32.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnAzQOutoqlnRHVWU1IRHqWQyi93d9NIz6SiCHTbnqp6JeZhNZLMjtUwFA5/dw3ir7K+r322Xj1BYnDm7FYzi1rp0XpkD/aa2l+mpHWKEiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6435
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

On Thu Oct 15, 2026 at 4:53 PM CEST, David Francis wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> functionality, edge cases, and race conditions of this ioctl against
> itself, gem close, gem create, and prime import and export.
>
> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This =
IGT
> coverage is a prerequisite for validating the eventual kernel-side ioctl
> implementation and makes fixing its security bugs safer.
>
> v2: Small cleanups, including cutting some includes and no assert in thre=
ads
>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Cc: Christian Konig <christian.koenig@amd.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
All of these tests passed on trybot.
https://patchwork.freedesktop.org/series/177021/#rev1

New tests have been introduced between CI_DRM_19403_full and Trybot_177021v=
1_full:
New IGT tests (11)

    igt@gem_change_handle@change_prime:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@invalid_handle:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.05] s

    igt@gem_change_handle@new_handle_equals_old_handle:
        Statuses : 4 pass(s)
        Exec time: [0.01, 0.03] s

    igt@gem_change_handle@new_handle_exceeds_int_max:
        Statuses : 7 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@new_handle_taken:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.03] s

    igt@gem_change_handle@new_handle_zero:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.04] s

    igt@gem_change_handle@race_change_change:
        Statuses : 6 pass(s)
        Exec time: [1.01, 1.04] s

    igt@gem_change_handle@race_change_create_close:
        Statuses : 7 pass(s)
        Exec time: [1.01, 1.04] s

    igt@gem_change_handle@race_change_export_import:
        Statuses : 6 pass(s)
        Exec time: [1.01, 1.03] s

    igt@gem_change_handle@sanity:
        Statuses : 6 pass(s)
        Exec time: [0.01, 0.03] s

    igt@kms_cursor_crc@cursor-onscreen-64x64@pipe-c-hdmi-a-2:
        Statuses : 1 pass(s)
        Exec time: [2.23] s


Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

