Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0FBC44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E23910F283;
	Thu, 16 Jul 2026 10:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPCy4ImR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2010F286
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 10:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784197465; x=1815733465;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=rRWV9WMO6fqSPNUQdrTTDHnL6GLQJPfopAOT0aEPSM0=;
 b=iPCy4ImRzuW+MThpuWfhUkrJjR94Qhl1tHftuiKT0D0A3woopG5hghBO
 wFYfxaboZHQyqY40WmJEMKGRg6bV8if7DXhubi5l8qMhOU6xsp373UKef
 G9yL1IALp9IuWlyfgv+xJRIwQ+N8XR+cTlDFpeG297SQGarPjk0mnPmxA
 Yj/7cIN0SgvvwJ3LeIM0h5eDhnjUs2/mfYrev7htr5x2EtMgaW/+1SqGA
 SZNLHIVCMNei35ff1jRa7AIpUtCz5wLPAf/wSN8DkNz8dB/LONcAIhP60
 5D7tRJHsJSieRegsaJJklEPIoirV7M1BGBuO3v2/zxJPEJyktygKJSvHY g==;
X-CSE-ConnectionGUID: LxXnC1iETUOxsd5mkIEzhw==
X-CSE-MsgGUID: W2WOMMaTRZyH5mPNY1lbqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96368045"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96368045"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:24:24 -0700
X-CSE-ConnectionGUID: ENExQPoRSkSPqZcvOjhilw==
X-CSE-MsgGUID: 2qeCEu5YQr2SrK8uanUpPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252035519"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 03:24:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:24:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 03:24:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.16) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 03:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6+dNqt2KuIilmsbcIRyhU0Z7y8mBDuIxk9NFiZCMrWqSLrWbkowfgcAsCI6PYsBUtLYWktqpNQ0bppyxuDgvvOjTokdgZsauIrwmCm5H8yyR4rndB2mweTW5DEp+5JxMeVnRik3mMBD+7ysOAe6+0lU0f9QrL2iGYi2I/va8B3QNKf9OSC9JNetPEhpQujJKFtI03F9ykrk5clGlWZbkQnfq1joWCJzgrq7u8pLoHIFWEa6gOZsw/FKGRfCBb7I2nSmPkL3nlh0SBor0NwipwOHoyaf2CQjzy0xZ8IQqh3ti4oMU5ZoF7o4UpjyJKIUCZGReAYCOB+iCetrBRklSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKp4h/KHhtv+/Nw+MQebLIbPQE87Dkb7cCvPk/fGG9g=;
 b=iLFsWvWnmPxmnOw8tETr9uzQJFKJi9sNPHfRrB22caPlpKXZisIZ/HymTQxJ1yICm/bf4Wz49i9JeewE6/PJA5k3h2SqW8bT3QYplYvwab8GAT8TTZMAMpaZg4irz1zyv0BgMkM2w7G98/yt/Rh0NoymeP1w7k5DqGXeAFSA04UBdCT3hDGgE7PTuUfoJfMuEMhkMBX7nm6Sr+dxciwhVL2t+DTrSmmkJz9xaPo+xslJ651ZKn5feqIM2zfQNgudHa6QgW2/+nAZv224d8wy8PtpFOUIpkhCIVa/KehjTIVkDxAgLXvQFeX4mn0fjHg/oablmjYX1v4ypjfLJms2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA1PR11MB9825.namprd11.prod.outlook.com (2603:10b6:806:4d7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 10:24:21 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 10:24:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2026 12:25:17 +0200
Message-ID: <DJZX8GDG33PW.237GU9G5Q8407@intel.com>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 <igt-dev@lists.freedesktop.org>, <krzysztof.niemiec@intel.com>, "Pawel
 Sikora" <pawel.sikora@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 05/31] lib/igt_tools_stub: add stubs needed by
 tools
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>
X-Mailer: aerc 0.21.0
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <7f05cdb527300126c8cd32363f5cb961846bcb42.1784117512.git.sebastian.brzezinka@intel.com>
 <puhkn5xjeoh2ds6f64tfihuenvcze5jvkz2dq6kabsrlqp2ize@uvws2lsm55uk>
 <20260716101312.75mjhktkn4fmcxno@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260716101312.75mjhktkn4fmcxno@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: DB8PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:10:110::19) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA1PR11MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f3b4497-bea3-45c8-37c1-08dee324667f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: o91AzL1nR5LOnCg7pEpu+NSIqyp3dchoBqjLbWQvL7SilUAInHSv7+D3X3aFNV3BlEuoIkXMWw818hOqAm//AAy9BIEgciOH0utgm2cOSR/6C6q11O6gjk9BkkSCnxFCmXWgGeU5pQLaeLViZKOZVHF/sjlEFN+wKZUGLjijBp8i3oTECs/Mj2KVLPQmXQ8X/LnM5FESlNVAcylLj+mljHBfM2i320umBvmQdVnJmA4ZvkAYiQvZYNVODVjxZyU49oL13FEfuE0Gc4bvgJcp+WXseyR6GsHhMeY4/lK4CFw7m84XUDne2co3kqVHJbd0kmCmZiCcjdgSpyAlJ32OZ0ym8YTKa+Fjw5I1r9ModsOrkychMWcfyhwAAh7za0aNE1kjp9XVkqHXZfMSnLpJBJlzubcj9C3vXhhPIiERC2lAUoxIs0aH+GuJrRJnIklnL40lrChPNXV9L5oRPDhCCuhI341I2msX7z6eieBvWOyAvpg7A2c5jd1vCwOkGcXeSkFbNl/QYcUkMHQxku1WAZsbfKME2eLaC9w2dZQCM2hIT6Nl2qTm+GIWzxWqVRV7RA378ZXFCShLxyt7K5LyvlyA6P46lpvH19pEsIVHisAMfI6oGgPm2HfHv7Ok9DWT3kEnh6HaQrVc5A5eXdDw3yRfm94g0BDdLWtdLp2X7Ss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW4yUG5YVDVHdnFCWklJZUZtZEdDVkcrbVlsa0pIY01ESCs2OExMNm8vN3Fw?=
 =?utf-8?B?NHF0OUtPZVdaYy9QSDVVeXFmTSt3eTFWMExlS3U0a1hCcjY2UnNXUGRWNEtq?=
 =?utf-8?B?TzJoYi9vVlBSUFAvb1pkbGQ5SlVMc3NhOGN5a1dqT01VSElMME15YmMxaWhW?=
 =?utf-8?B?aW5WdGdhM2kzOUp4VzRvcmZhSCszTEVBYTdlcmNVWU53SHlKQ2dLc0ZidlFO?=
 =?utf-8?B?VzZpbUkxRU9uUm4rS0d5SE9hTjRrOFVVb1M3TVhtcUQ1NWxaNSsxOS90N1dS?=
 =?utf-8?B?SzluQ3paSHU4dUZLWTNzSFd3QVNWa3FjM2EveCtRalNhWVIvMjhSN3Z1cTRX?=
 =?utf-8?B?bHZKQVk2dW9jUG1aMFNIcHZCRTJKbmsyc0ROc0VFQnZGcm5xK2VPUFBNK2pz?=
 =?utf-8?B?VGVwWDNjcjRTcVl2NEo1YU14cUNnd3d2czJCcW1WMkZ6dzI1K1UyakxhNFJt?=
 =?utf-8?B?U24ySDAxNWRMTTVvclR3dGN6NUhUYjVTSEVUVTQvSTlTZUxISkFsV1ZDTXVr?=
 =?utf-8?B?Skw5b1RxdWw5SytHTGxaME5LZ2F5Vk9QUjVlYkxFRkR4Q25sUWF1dmFNcFdx?=
 =?utf-8?B?ZUp5WEtwdmo2L0RRNHJtb0lMOE9odVVsb2ZvaXZPSWoyUThaV3RwZTR1QTF4?=
 =?utf-8?B?eUVyeHpQNm5LKzN4cWZJQ01pV3V2eGZWZENCU3ZHU09MMUZiU21xc1pmY2s2?=
 =?utf-8?B?Wll3ajZYdGNKVENxUFlGb2Nmd0RwQVNWSTlTTmY0NEVSV0VYVTQxNGN1d3lw?=
 =?utf-8?B?WVdGRVRFUFlXakxjSmtNM3FYeTVYVXZDcHhWaFVYK1BxVmtib3ZBUHlrUWI4?=
 =?utf-8?B?dUpLTWtYWG9aZ0ZKWVNYSGsxY0h5VGh5ZlZTam0yTDJieXNGUXhBaEM1amFK?=
 =?utf-8?B?YzdteWRxdmJseXRlZktud0tmdjdLc3hEZytyRlhLdzFJdk5PbWg2aXNDTzhT?=
 =?utf-8?B?V0lXTkE1L2NzTHBteW8ybDBHenA2WjJ5Y21CTHRxYmFQenFrdDNuUktac2Uv?=
 =?utf-8?B?TC9TQUdGTXNtQS9GVjBoenpGZE9wM0xESjVmdkw5UmllaWlwaHM4ZDM5Wmda?=
 =?utf-8?B?UHdmWlNzaGRyWjFqVXRHcnZ4Q2ZqUzlwV0FvNktvQ3lEdUgwSExaajNQWWt0?=
 =?utf-8?B?ZjZBT1BxWXY0VkxqMGFjNDVQWWcybmlKbUV2cWVnUENaaWVqMGpXb3ZoTXZB?=
 =?utf-8?B?Wm9pQ3RvcnUvejZlWmVnVGUzc1BBQ3pKVkhWZWhMdkdHRkJzOGJrR2VieXJu?=
 =?utf-8?B?MnJDaFdKTzNEYXdtaXR0TTUyN21mKzdYdml6TE92QWlNeGx5YjJDSGdaS3hh?=
 =?utf-8?B?OHFQMDR3aHY1K3c1OEQ0OFZOazBDWHJzZGR1SHMxQVR2RStqWEJub1FjdXVa?=
 =?utf-8?B?R3IvcmUyOGRJT1dCNVg3eFRYN1JxSXpzVlJtVXdjbDgvMlNGN1pBMFNwcjRk?=
 =?utf-8?B?RWNXays2b2MxUFRRY1hIckRKZzhFRC9FeGFIYlhIYldxYkVmdngzNzltVUlw?=
 =?utf-8?B?NXAralhOZTNPdFFjczhrcnNPaFNWeXpZYjlvOERzYlhTNDVYZVVZMWVQZU9p?=
 =?utf-8?B?anZJS3ArWUlLakJMVnpGUlczaDNTWXRzL1oyQWYvYjVrRG9JaDhkQXdFWWN5?=
 =?utf-8?B?SHFUL21kdWMwdGhmd0JyU0Jnc05rMjlIRFFNN0hlOFp1cXkrOUk1N2I4WjVI?=
 =?utf-8?B?YWFlZ2RsdTlZOHdtK1l3dnRUUTV4a3dKTmZSZ1FKUWNyMy93TTAxS2Y0MG5r?=
 =?utf-8?B?YWpkYW1qYy9YR2pOMWE0MDMxVUcrNm81ZjcwRktNWXNCVHk5YmtiVnR2cHFP?=
 =?utf-8?B?cXUvcTBSVzRBZVhVKzZNZVcrUjRLV3RCVFZYanBrQlErRXJVTWVzZGVCNnNj?=
 =?utf-8?B?SlZ3T3QxWmdyQnVBVzVLNndhQSt5SkJXenF6ZDVqZVN2czRoQlpVM1JtTUJj?=
 =?utf-8?B?WjdGbnJiZkJEMUNmNVAyRkp5bzltb2FFdEZuSVhXZWNpa3A4b2pFR01MTFc4?=
 =?utf-8?B?blQxUlVHOWVaUTMrYnI0Y2dMZHEzbVdpK1doKzM2dmhGdldNWkFJRU9SSGtt?=
 =?utf-8?B?TGJnV0FILzVPT2NMS0lrQ2J5OTN0d1E3V2hyT1RHdkhaenh1MDBYNnc2QkJW?=
 =?utf-8?B?dWE2SDZRQjlwZ1JCQkVuSDBRNmsyaDl6MmNnTjl0bTVKSDBFSEl5cnF6VXBM?=
 =?utf-8?B?Uy8rRUhMR3NZVUxvbnFVR2VFUmphRWc0TVhIRXJQUHBFVzJOcjBqYnltcjN4?=
 =?utf-8?B?QkxGNWJwSkx2TUtQZUFxdUxqMHJvc05vQVAvUEEwVXhGRU16d2EreGJFNzFl?=
 =?utf-8?B?UHNjaDl1MzNSajIzVnFvZ01GbzY1ZHB2bHlpS294d2lmb3NHK1FCRnRWMERx?=
 =?utf-8?Q?BXXu3jFKUDLpxIDI=3D?=
X-Exchange-RoutingPolicyChecked: Ub5DDNQGiuKoRjOxw1m2B9dQCsbEmiz3FvruRqpaJAovjNsPafnDrO9kvedtAJyXP2t0Wsem8/3OxdXbGhOfw7rdbCiNWYbKwFNC7O6L5UDS4AxAP5CJtPV+UyzSx7pA84YjqP5HuAaaWrPBnmgCVfhKxzqrPT+d47pJHcHj2P7Baj12PJvkUFm6IVJxV6z8YFVyeUzRU+jGn3gPfkNF1YwsvkjyMYZwrUd+iS+KM3zFv0LouLbmbbB8Lx2L58qzp7hx25y99xrQ6u7FJh/FbCjbLhJLWh6XhEJdzjFM9C1lbMeAzdGIZT1qLBC3ihjeEAHeOXD0cgzYJEPv6COlvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3b4497-bea3-45c8-37c1-08dee324667f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:24:21.2040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7G6LJ7K+KuKyDlhHmgPGvtDC1Hno437MXBvzlNR0amGIE7nNGatrPGw4XMTdBdSXf69ba92kMRwSs3RG0TjSgfzJbinq7deQFP1B5/VC2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9825
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

Hi Kamil,

On Thu Jul 16, 2026 at 12:13 PM CEST, Kamil Konieczny wrote:
> Hi all,
> On 2026-07-16 at 06:09:42 +0000, Krzysztof Karas wrote:
>> Hi Sebastian,
>>=20
>> On 2026-07-15 at 14:15:15 +0200, Sebastian Brzezinka wrote:
>> > Add stubs for functions used by tools when linking without the
>> > full libigt.so: __igt_skip_check, igt_exit, igt_debugfs_open and
>> > igt_open_forcewake_handle_for_pcidev.
>> This patch does more than that: it unifies the comment style in
>> the file. This is a nit though, so consider it only if you would
>> prepare another version.
>>=20
>> >=20
>> > Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> > Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> >  lib/igt_tools_stub.c | 83 ++++++++++++++++++++++++++++++++++++++++---=
-
>> >  1 file changed, 76 insertions(+), 7 deletions(-)
>> >=20
>> > diff --git a/lib/igt_tools_stub.c b/lib/igt_tools_stub.c
>> > index 9a0ec6217..21dc53f3f 100644
>> > --- a/lib/igt_tools_stub.c
>> > +++ b/lib/igt_tools_stub.c
>> > @@ -21,12 +21,27 @@
>> >   * IN THE SOFTWARE.
>> >   *
>> >   */
>> > +#include <fcntl.h>
>> > +#include <limits.h>
>> > +#include <stdarg.h>
>> > +#include <stdio.h>
>> > +#include <stdlib.h>
>> > +#include <sys/stat.h>
>> > +#include <sys/sysmacros.h>
>> > +#include <unistd.h>
>> > +
>> >  #include "igt_core.h"
>> > +#include "igt_debugfs.h"
>> > =20
>> > -/* Stub for igt_log, this stub will simply print the msg on stderr de=
vice.
>> > - * Domain and log level are ignored.
>> > +/*
>> > + * Forward declaration only - avoids pulling in the heavy igt_gt.h he=
ader.
>> > + * The type is used as an opaque pointer; this stub always returns -1=
.
>> >   */
>> This is a nit, so consider it only if you would prepare another
>> version of this series:
>> The comment should be moved right before the function declaration.
>> > +struct pci_device;
>> > =20
>> > +int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci=
_dev);
>> > +
>> > +/* Stub for igt_log: print message to stderr; domain and log level ar=
e ignored. */
>> >  void igt_log(const char *domain, enum igt_log_level level, const char=
 *format, ...)
>
> This will be a second documentation for a function.
> Question for Pawel: could it be a problem for our documentation generatio=
n?
> Do we need an exclusion for stub functions?
For what it's worth, this documentation style was already there. It's
not my invention, so it should be ok, as long as the previous comments
don't break the docs build.

--=20
Best regards,
Sebastian

