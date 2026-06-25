Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382AFCDE006
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D107410E1CE;
	Thu, 25 Jun 2026 09:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZeKjsU8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE1810E1C6
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jun 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782378119; x=1813914119;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=Zodikdbi4+c+TDkx64gyddzRzL7e+kPjrBrxGrwEtzI=;
 b=ZeKjsU8eTH6iKKH/ZskVEge8FMDosEjno9y82Yy8Crh1nUW6ZTESDJGD
 zskqPGMrmvGDAo+ZdvvN43i11dzJ/VCd7DS/hByrkE0Hid3pK76DP4lgD
 JCI5k9Vtlwk0yTGzo/kydP04GaS0oyAWAAxsEFrb52zybhCFSjC8FkGvh
 d0oOgXORmY/6kJTffvcLzgciDT2tT8NIokupa7hHrfV2oZlLqM1FKUloa
 n330Jda8kuRSymEEFiJFgU7lm7j2WbttyLpYNBVv2IrvWb7MxSidamyJW
 BeqtXhs513DWdbOtLbycvnlFv8hN2MuDqrjf3aLBK293rxE9u/0R7wNM3 g==;
X-CSE-ConnectionGUID: dZawNzQdS72KgZzYvQq+jw==
X-CSE-MsgGUID: dzTYe9vuRHGK7I8tkiNWog==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83153641"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83153641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:01:59 -0700
X-CSE-ConnectionGUID: d0fc4Qu8Q8qPDnncn8i6Jg==
X-CSE-MsgGUID: 00+5sl1MR0ioW5hvqhywnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="250909471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 02:01:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 02:01:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 02:01:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 02:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMK6qn0gMb4yuxxuTmhAeXieOfbbaxRL6pck6SnqVMf8qPcHwbDdory8Q6PdoTbOGfItGi1KC9bbD0/ggzTX/sAyF7GwdKHBRRzZzXic5iA50hm2fwnQrFJvGhpw027zSLyABNn8YW05RbEYK1KqS0+lvEEzG7D2UlK3M5L+/RxqR1uh4zZ0TJkU49RAJN3wPD29zDzg1S7Tp337kXdGCCHTZcgMZNtPoqh0onGXeltrR6VTLc05sDcRloY5X83QfAxmby1W/4QmHoHPWIjtQv1l1PkWrZ/C3lTZgtXNRDcemgCWWKPw6NpWg3KHttHxhyTb2RHwNt/Xr5V5m80fjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEz5ekJjAjDXiKC3iyqL4CRvLV2wtBV/wPHmXl0oOFo=;
 b=K+J3tx1UyD/iDqeF2kGF/e0owrjzauqXcG1Jz5+BOWabtUNvy72yx1g2TDKqRWAFH2LkUAiLhQiQoxwSqrHKH1rREvjvx8IFSBgN2cE7ctDYTDKjT6lZHsSXakbVziSPQqhtjJpKa6O+X6yBiUjajYdJqbKk+7iTSLxQl3whP/t9wX4ss2YnbA81tYE+XrygD9qLBhRCtTvt5pvYnq1bvCNnKbDQYUyuQGdtZvysmqxjrAFy5jV/+ooCZCOs6pac+BNw6UwK69L4YnzD4T8vPWOBqJIj+blkJCXn0WJwOCxPbiFGsrlfdBeVTzZ+obYG368qIz7x72dFERq2aVbtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4SPRMB0067.namprd11.prod.outlook.com (2603:10b6:303:221::22)
 by PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 09:01:55 +0000
Received: from MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a]) by MW4SPRMB0067.namprd11.prod.outlook.com
 ([fe80::3605:4f97:fbe7:2c4a%3]) with mapi id 15.21.0113.020; Thu, 25 Jun 2026
 09:01:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Jun 2026 11:02:25 +0200
Message-ID: <DJI0BK153N4X.3PXQOSBXU39C9@intel.com>
Subject: Re: [PATCH i-g-t 01/25] tools: igt_stats: drop libigt.so, link
 against minimal sub-libraries
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
X-Mailer: aerc 0.21.0
References: <cover.1782288071.git.sebastian.brzezinka@intel.com>
 <52667b0eb09ef029258fc33124a4faf74af21f90.1782288071.git.sebastian.brzezinka@intel.com>
 <h6ce4epe7nlp4h7o4ymgc3pacsmtqgb767cqz57j4uby6f2mdc@t2ntumzcf4pp>
In-Reply-To: <h6ce4epe7nlp4h7o4ymgc3pacsmtqgb767cqz57j4uby6f2mdc@t2ntumzcf4pp>
X-ClientProxiedBy: DU2P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::23) To MW4SPRMB0067.namprd11.prod.outlook.com
 (2603:10b6:303:221::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4SPRMB0067:EE_|PH7PR11MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6894a2fb-330d-426f-380f-08ded29867df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nPPE/hcZeO9kBw7r12hUVl7LYszz5o0WnVZPHRKS6+HQbueT5026vEf/reZJRUnb53Ab0SyeWX9bBjWDKydsLPQyb4X1V+/2CDCeSt6VB99XIzJ3owybSTtSTfol6n8rIfjq7Y8okJS0fNWaW1lvi+/LZOjxhA7I6kmfxehF7D9kyAmsPs6kAlYXCPM7vKzOoecR/hsPkpj6UXlMbYPcuZ3ZAH5RpwQVFUpeQHZ0MmCKgnQJxxs1x6CyjWL74JgdWBAVAVS87sfAIN8JbSTvGuNjBcDa8T6fpS7XdU3xRW7GGmVLGGISzsNqvX1O8bml1M9lzYY2jYaLCoHjmTzgsPcZ7HvhRWBzSLt5okGRfE/FJmbwBGlK93bEeBGz3wCleu9xOFtLlWGZ21aK7gi2NI80gD3wElRkUVjNNCx8DtRXZPyE5U2ferm8gfKIuTrHiFRBqlzlWFaRvrMJKxFh610ql6TBE3YEGT1Q08ypHpw8w/5EBQu2In4C1rVLBX5QFaAUDIxqjbS1BQeuhEkJxFMhP0wgO7neXeXbB8neSb2B/HfEdzXRCuQxzzZceiwpmbvDunNivvvl01LG9mQK7aeiB+RAgctH14fMB6HViDMxKk26+VXi+iVpiltSpb4sC78yxeLaSJZX9S7NFLe6EtIwdRMnMJsaZF2ly7arrG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4SPRMB0067.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0REZVNCcUpUNUx1WS8yVGZFRFBOdjExVDZxL3UwWXlXVFlVaDByL25iYm5B?=
 =?utf-8?B?WnRYVDlaSzBqNXRHNkpMY1dRcDlXSE5rcWxPNEp2cDc5YWFEUzlpa1AvVnVG?=
 =?utf-8?B?NUVWZlhoRFdYRnV3MW9ycTVPQk9ieHJ4VUI0RXNNK2JYUXBHYU9MSXRTenJN?=
 =?utf-8?B?UURNb05mbWszRWpaVDhGV1FFOEhjaENWbWRiTVEzNW82NEhneFJwYXlsRXlS?=
 =?utf-8?B?alhxcjI2WHhZcFdtZWI2dmtEU1RvTkNyb2FOZ291aWluV0VzT0NERnhsYnBi?=
 =?utf-8?B?ODFra1Bja2JtY1doZ0ZlVGNFbGNxb0F5Y0xVZ3luMFJQZjBRWDNoeWFzaUlB?=
 =?utf-8?B?V3oxS2szejBvL2l2NDg0cXliMTd4UHN1SFVPUmJUZElzNmtpdkY1Ry9tMlZU?=
 =?utf-8?B?b2xxeWYvSFYyREFwb0RTTVJEa3FzR0llUUY5L0NaWjY0NVlsSyt2TDJoM2Vu?=
 =?utf-8?B?R2RVUVM1dVhJaExCeDVHdFplVk8zejZYeUtNK3R2NUpyZ2huNVFKQTNUSFEy?=
 =?utf-8?B?T2pXQjJoR2V0TFBIZExRWnpEeFFRSCt0bGlzdmhCa3JJSGpiNTlQWnBpcStT?=
 =?utf-8?B?QjEyMXJoajI2T0J4eDMrZVpMaitJWHkxR2xiZUZpNkpKNjErcHRXcTBYU1JC?=
 =?utf-8?B?YjNRK0RkVEllREdHRytyKzI4SDBFNHEzQmtoTTNqWDQrQTlwYVp6MGVVbEVX?=
 =?utf-8?B?c0dnajdjOXRDTGdjWnB1NWVvVGFaWVBRN3d0ZXI0Nzdka0lyK3ZxcTZpbktz?=
 =?utf-8?B?N29iczlaQnptbGIwOHRGRkU4VFl6eW04ZmgrWnYxeCtJYUNFN0V6SzlrWi80?=
 =?utf-8?B?MEVrcDY1UElXQmJybDhQc0l4UWJsVW1OeGJFRlRmaE00VEFNSGJ3eE5ROWtY?=
 =?utf-8?B?UGtJZmpYZVNkcjJFaHFpRzBMVWZ1UFhFSnNZVExHbnlXUHRPWmZHcDFQd2pk?=
 =?utf-8?B?RXRFNWpFVkZ0WFk1dUdhdUFOZkdmZDBXVzJrN3JVU1hmTGpJc3VsSmJSbU1W?=
 =?utf-8?B?aGJxMnFEZmRUVEFhSnhNc3pTam80MVF5SWZhU1hDR1pTSGZhc051TUdySDRI?=
 =?utf-8?B?NnZxNFhXNEMvWDc5bzVBUk0rUE9XeW16QUxlMmNlNTd4QkMrTXN6ODJmaVYv?=
 =?utf-8?B?ZmsyeGxkL0JZN2lydUhlcXpsWUJGWWo4S1pVSjExSjlKRGJlbzEyc2ZBdnY3?=
 =?utf-8?B?WEtoMTZDTDRoRFhtQlpWNGpVdmkzOXFjdzN3NXJyOURoUEw5eVFPelJMOU04?=
 =?utf-8?B?QXF6enVZdUFQanIyNkpaRGx6Z1NKcUo2WFpLbjlsdkZ6eTZyckVkZGZ6dEhE?=
 =?utf-8?B?K0Q5NlhMSXhBVWNEcmNsM3cyVDVadU5xSDVrbUE1ZXVlL1hWZnFMbmRHU1FN?=
 =?utf-8?B?cFZGRnhtQzRzd1ViYmJYVkxjU01NVDFaRXViMnV4SmFabEtnNXZnQkdObmZa?=
 =?utf-8?B?VTRqUERIVDJyQVZpOHFMVTNjYlgweWM4ODBKREZYYituMitaZkRseW5odDZQ?=
 =?utf-8?B?OUgrM2ZGUGFyV3F1NDNGQ1hnMi9pUWdNSGN6c1ZpK0ZRQVpMQUVWUGRRelV4?=
 =?utf-8?B?cjFiaVhOdTdyT2ZtOEZrZmJKTTVMTnhaTDBZOStFSVR0WDAveXBhbWErSGFZ?=
 =?utf-8?B?UTVwRkJGQ09OYUw2K1VaUlZoTEFxSG1iR2xKNmRXb0o5MUlvMUhmRHlic1JU?=
 =?utf-8?B?RFVqVVhpekVEcHBoYWtHVnlkT21ZZ1h3V1JZa2ZvMFppU28vSUdxQ2w2OG5M?=
 =?utf-8?B?cXE3UUkxVXFiSjdSQnlybzh1MDlkT0tUdXl0dXFSUUxpaEpyLy9mekY1OE1F?=
 =?utf-8?B?ZHBwM0M3ems1ZUIwMi9KcGF2WkVaYlhzY1J2ak5va1JNeXpBTFdTWlp3RkJw?=
 =?utf-8?B?OU5OdG1OQkNXMVU4RDRqRnBhVnlHcXNrUmJwMmgwMlR5Y1hCTWx5aE83Q2Vk?=
 =?utf-8?B?c2srREdDYnNhZ05zMTZ4QTZ1cFkxQldEeGxoek8yd3NobEFrUFdid0Q1cGN5?=
 =?utf-8?B?U2tTeURyTTNzY1ZJaUxTeWpWT1Byci91SjBRNmJ4ZlNqOFQzOFcyay8wUGV3?=
 =?utf-8?B?QUtjNkVJMEl3d3drSUZWWEJDdXY1Z3ZTdyt2alBhdkwyd05RQXhkZWdCakFm?=
 =?utf-8?B?dXJSb1V2SlQ5MU1IbHpkSXNTRWR4bnJKdDlmM210Zi9RMTZnUHNzak4vRWxS?=
 =?utf-8?B?ajR5QWN4N3M2MnNJT1ZGSnhqK2tucDZzNGV1eC9qRGtRbVJOaFNtclp5cTVI?=
 =?utf-8?B?UkhCQTB4SmtrdXZyZVN1cTFWcWlIM29QNzZKUHZGbDNIL2Ywa20wU2g1NXFS?=
 =?utf-8?B?TTQzLzhINVdyTnBZSis4b2hvaFdYaFB4dGxuWXBGMVdZYXJqT2VmcUVjM0Iy?=
 =?utf-8?Q?CwtaLJviwhmi9xBQ=3D?=
X-Exchange-RoutingPolicyChecked: izJGQ6gtbXiXqFxJZqcWD+kfd7+GUyHchtJpJ2gTVFZOiehYj6BcprINFuVwDHY2cJcC5Zy9usipoQSsrJ+zdfngEeR6J67NuFpKxOmJ+XPZ0mfiqQKPRxHjucvOiD2Zeak7VFY8PLtQ2sA0c/XlQ2oUNmbWKlNBoa/bNTkRcNZTzxUBPz+pUk/pMFrsynRwsnznSk9qi2gV+eXfSRATZX9H7CJom2gWYXijhe7/NYQChR+kibEf6nYPKM9ZLAm3bWs3vtuEvWIRP3kvjIsHKVS2ltE65cpLQf7wsiE5L7wTL147Or2NtUxAx4ZI8MOAHPlEgOxRF+emmxlmOSeazA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6894a2fb-330d-426f-380f-08ded29867df
X-MS-Exchange-CrossTenant-AuthSource: MW4SPRMB0067.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:01:55.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EUuZlLImTwSTGFzxz94ecrIu5/MxMQywy4HUHNWjuklCaMRrxPe2joWXpx703zWQbca+cMMq4eWNyZDDgiOTFCipCmBDxDHk705ipmxMq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
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

Hi Krzysztof,

On Thu Jun 25, 2026 at 8:11 AM CEST, Krzysztof Karas wrote:
> Hi Sebastian,
>
> The patch works as advertised, but Ashutosh had some qualms
> about the series, so I'll refrain from giving my r-bs for now.
> I too have some suggestions down below.
>
> On 2026-06-24 at 10:47:08 +0200, Sebastian Brzezinka wrote:
>> igt_stats only needs the statistics helpers and a small assert stub.
>> Link it against lib_igt_stats and lib_igt_tools_stub instead of the
>> full libigt.so stack.
>>=20
>> ldd before: 35  (ldd | wc -l)
>> ldd after:   4   (ldd | wc -l)
>>=20
>> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>> ---
>>  lib/meson.build   | 14 ++++++++++++++
>>  tools/meson.build |  6 +++++-
>>  2 files changed, 19 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/lib/meson.build b/lib/meson.build
>> index f25ecd8b2..96903d06f 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -389,6 +389,20 @@ lib_igt_profiling_build =3D static_library('igt_pro=
filing',
>>  lib_igt_profiling =3D declare_dependency(link_with : lib_igt_profiling_=
build,
>>  				        include_directories : inc)
>> =20
>> +lib_igt_tools_stub_build =3D static_library('igt_tools_stub',
>> +	['igt_tools_stub.c'],
>> +	include_directories : inc)
>> +
>> +lib_igt_tools_stub =3D declare_dependency(link_with : lib_igt_tools_stu=
b_build,
>> +					include_directories : inc)
>> +
> I think this change deserves its own patch. Stub dependency is
> used accross this series, so pleade do not obscure it here, as
> a part of igt_stats dedicated change.
>
You may be right here.

> Another thing: I'd find reading this series easier if you
> bunched together all the patches using stub dependency.
The per-tool split is intentional for two reasons: each patch shows
the ldd improvement for that specific tool, and if any tool turns out
to have a backward compatibility issue it can be reverted individually
without touching the rest of the series.


--=20
Best regards,
Sebastian

