Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC148CD8CB9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 15:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D95510EA4D;
	Wed, 10 Jun 2026 15:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZXvhq3rf";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012016.outbound.protection.outlook.com
 [40.93.195.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8134A10EAF8
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 15:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9GQKpDcLIZG+ODFXK8SNq34X/jXqNL1w0bZrYF6X1Oh4+zTs+ztWOeguF7d0xtjyatSHMRXuqutaKXzwMRhoVc27XHHhhtYkUUro3sgG432f0jYr6MeqG9453dtPN+TGZoadvYokWUjC/UdsMYzM0QoynYWf73xGgAlS2E2mTeFIwzB4rv604GVIHvh9mol6TBEp3NVReME8HzgOtmtPtIUYZ8MPT9uzxVUCUGG7xdAu3mwN0VohLyLRdhFkgj6XZZV2fTla766aDIukRpWA1h090RJ6AFqFmFBzyw5AqHmoviroC9QDy1CA4AUp1N9TK3HstcsauASzZ38GktLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KoyS7G6fjyPTDsDt+UgoqxOEdN78+EPdJm/WFnOTDO8=;
 b=xVCxpvRRbz6XAG2r0y++Mop2L2+jU6QPiqKWdWYwAdaCJSnuG8vOulRwV9oKL/S65S+wxEVxsoUjd/HhJktlor0rroYz/GPbdm9w8we0yYQeQS8zKau+V+jTJwZz1LLBEhpUQrvH0mgNTScQunoqeqnSZK0W2qkqPFQDZRRbV92ofNqbdRRn9/htA0BxdaxAv5s/nKMGsDZEHkonPfgfwR0oLptjRDmlibTgfxZR4oneaw4RrXkvZEeacwQH2y25SQxWWS1X5I99k7kM1ceCf75NQGtgB/d1jE2N4knE3fCvohMVHDqoNrfyExAeQtqcYagoah40H3durIwXSMm5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KoyS7G6fjyPTDsDt+UgoqxOEdN78+EPdJm/WFnOTDO8=;
 b=ZXvhq3rfDWIq+BJWgOwi4A8Uznjb/EnrK09STaPTKWhKh/ik3P8S4P/aDsv/KXoWOGLhSuoQ9Jsd0Bes5wjYCGqHGykURjPd8FY7ZYTcumsJJfJwS9pBxlLo+kD5BryfLvDCs+yQJSki1LVKu+QBC7mozoZWfJ+4KLcO4UxzO54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 15:53:28 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:53:28 +0000
Content-Type: multipart/alternative;
 boundary="------------nN5G6llYt4ylDvg1ME0IsnhP"
Message-ID: <d0e9c77a-c9e4-4987-90b1-6ac6e9ede7f3@amd.com>
Date: Wed, 10 Jun 2026 11:53:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_core: Distinguish dynamic subtest in
 finished messages
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org,
 zbigniew.kempczynski@intel.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <20260608193807.2616777-1-swati2.sharma@intel.com>
 <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
Cc: "Hung, Alex" <Alex.Hung@amd.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: YQBPR0101CA0178.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::21) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 97db70b9-5e35-4f61-cfbb-08dec70869a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|13003099007|8096899003|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: RhP8l+b9BBVijOcGkgUqXvFd7u1Us6VZCcl1V3fUcCofBFdcbqRvfbV2VejwTIZxZF4n/i/70CQgljvoIFlcy5m7I4G1npYKINtqWjEaXeOrN3zyD0J3/Zn67VC+wvvhqtpMB+kA1qLwXleO6GxMYk6JOz7zySES9U91qIQy/v1eD43cTcNMsWKr4ffw8oLhOYoPdzypZm1loV3Vzy2z1n0+4gRKxcBwRR0PlbyohR0pXWeLIe+0MoKssuaRLUx8uSXYNkGTWHMvrZWrE3ACZb3ggwNqPwMgpt7C8evrvNcAC+bmLz6zDBMlN7a4b9FF2xX2GD6VS7E/KhUkBh2VVfdgAEha6VBQT2z4wwatyFjdVmQr1j/JZQR6jKG1oBj7ewU5jQemjy6FAGTWDG07yzGsszEv94GZ51sz0hIR/V1hDVn7kZljgfBMad0/ANiIib7NOq2SNCfnoYnUe8oUgRQySJ6n3FedBnuyLIeNdkuhvVYKMtONn1uGOJ0GfpS1eusW1QJ006C85zWGSZQ+8RAF/wIZ0/ALjk9SksUBXGgpChLy/Zmsp26sxEq6AVfkhtBSeWNstfdUpA+GGu4L1QWnV3t2yzd6pkbJR3XWrLOcZUFNSbH5MJ39uNbabCVD65YtbUHeZUeDaG8xTDdmqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(13003099007)(8096899003)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1J6R3NkZUM1TGdnYmtLVlRaZUdOYmtiQzZ3bm1ab2wvYXVtSFhrNFVTQ2FY?=
 =?utf-8?B?YXFscGwzRXp4cENTSkFmK3BGdEMvR3hMcDFwaGtTYjd2ODEwWXhKUjJIWDU4?=
 =?utf-8?B?dnhSTHNxL2dhbTc1TGNGRDBYREdFQWNlWUJvTnZaaFBQeWJGbEZnZEEycjR5?=
 =?utf-8?B?cm9NYkpTMUV5anU5VUloSjFTUmw4RVhsRWpyNXhMd1NabDBRMFRRT2t4bU8z?=
 =?utf-8?B?b2tyVXVTS3dEY0tVN3hUZFRXa0grNTFYZTVPMkQxbHpuT0lPcmtDWHFqZ2xG?=
 =?utf-8?B?SDFNMHpVYmpQbWVjdEZ1VkgwWStSZ0ZITCtxazhOaXB6TjVzZUQ0cjFLQnlD?=
 =?utf-8?B?eEw0ejMxYXZWY0ZON1BtMU9UcHpIcjhxcVJ5V3J5eXFhdjZtcUdSZy92RzJF?=
 =?utf-8?B?NWljSTRlQ1l6eHYzU2FubXAybjc1amE4NWVrTWJteWVJbFpoN3pqRTJTVWUr?=
 =?utf-8?B?WkZQVUg3Wkd5VnV5RjVNMWI4VDhRVXFUSE5qcHpGRk0vanFPaGp5SjBUUklk?=
 =?utf-8?B?UFQ5b1pqcDFHYU1oWWdFckQzZDZLbzBHeGUvMzRkTzcvN0dBZHNiZVdnUllr?=
 =?utf-8?B?Qm5SNlY3bkVkK1RZeHh0MzhrTWtZSXQ5RE9uM2hzT1BvQzlkYzdrVGtvVHJi?=
 =?utf-8?B?REN5WnpGWnk2V0JCckVVSXhKWnBaOE5HWjZDR2ZCQVh3M2N2TEg5bEZwQVpj?=
 =?utf-8?B?YVVRYkFzaW5YTVM5TCt6eFRwUDA0OXYyOGROamZVQTJhdFFrUUFGMUJmeUtW?=
 =?utf-8?B?K1QzUktQZmw5MEhxNHFYZEM0NitSaHlmaUV4dE9weUxmNkFJWHh1cjBMeGsy?=
 =?utf-8?B?RHRnelExR0RrMXlveVpWQmp2WE9YeTF6VlhKM2c1TkNtOVJId3NsM1JzOFdR?=
 =?utf-8?B?WDJsSEpVNm03YU9hL0lMc0JwUUhWUGNRbTJhQ1JTaUdIYXlBNTEwYVhOek9t?=
 =?utf-8?B?bUtFWUhGa2RlbFZlT0NVMTkwaGpwVldKWHJIYlA0elE0N250RkNwOUh0ZVdo?=
 =?utf-8?B?RkR1S1hRZ1lGY2pEQ2pNN2Rzd251RHFJRk1Vd0t4L3VlaHNLSG42NnRoVkVP?=
 =?utf-8?B?MmJWZUdwbkJqR2N6N0NFYnI1ZllFVFhkZS95TVpXdU9VYWVMY2t4Nmhocjlk?=
 =?utf-8?B?S0U1VnZSZStWVFdoYURRWWkvVDhlRUM2cTJTVm5Rc2Jpd1IyTGZnUFhLN0dz?=
 =?utf-8?B?c1BoeTVFcGw1WFE3MnRpOWhNRDlvajdmSXlRRzBPMG9jN0FmckNWY255QUU5?=
 =?utf-8?B?cU1vUVB2Ky9lamlCc2pOVzVwUzFjeG01SUFVQTMyZFgzZ0s2VW1HVlZ4Wlov?=
 =?utf-8?B?SEJYY04veWNWQU9XK3M3T0ZHTXZZVkFnajFhWUg5VEVlL2tPUm5aRzhsRG9h?=
 =?utf-8?B?QlF4b0cxYjJ0QnhwOTBPWUtlUkNyNnFhZE1vT0dycnhocmJQZlEzRmdGbkZx?=
 =?utf-8?B?QWJmblh5MWt5SEZUZ3daVGFZS2JEVlN0emtzU0VWTTJsaFBNNVU4dExwemtE?=
 =?utf-8?B?RE16WklMbkM1YUpYdE1sc1RJZVlvQVFiRTFHQnNjVndHYWRLWUJWdW9VeWo0?=
 =?utf-8?B?QnpHdGtJL1FBTTVRQW53bi9rbzNBRUNOUTQwTWZkTkJwYW8yRnVFYXJueTA5?=
 =?utf-8?B?ekZ5WVBZWVlEL203ZlhOdzJvbDRzQzlaR3B2NTFhNkJmS2xVbTlnZ04xSnZF?=
 =?utf-8?B?akFDQ0x0MERIY3ZLbEtuMWpxbXRoalFjbGlxT0I5NXFMaHZNend6S0wwYk9i?=
 =?utf-8?B?dkZkaVNqbE5aeXlGb1U4R01STmtNNXFtVk5hTEE1UzBhYVRsWjE2R0dCc3ZP?=
 =?utf-8?B?blhwRVhRTjZUS21zOUtUMFlUaTVPU2pvZitWeG92a1JMOEd3UjNkTURHa0lz?=
 =?utf-8?B?Y1VoZVlWSXNyVmE3RmkzZ3NzZ0F5VTRiOUZ0K1RsV0s2Q2J2R0JMd2M0anJY?=
 =?utf-8?B?d1E3OUNKdEQwa0dLanhiMVhWUG51ejdaY3doOVk5Y0JLdy9qTDk0UEo0Q1dO?=
 =?utf-8?B?bUNGWVJDZE9JQllxUk1nSVZ0emVFMEE3RDFLNlJwUmoxSHZENEdtOVptYVVB?=
 =?utf-8?B?a3lFWVNHSnJ6NExpdm5ScjlQZ2J6ekRvVVY2eldYQjNGWG5oU2RGL1plMi9z?=
 =?utf-8?B?OVpiMW01NnUvQWcxdVQ0bzNSTHZWUGRlV3JXKzF2Sm80d1pTemlVVUFTNnhV?=
 =?utf-8?B?TENaUkoxSklsa3BEUlpSRXcxZkNjdGV3cUJiUnZhZERjK2dMbWRxR0Yxek1l?=
 =?utf-8?B?T2h2bjJTcWpHYlZZVEhrWmVGNnhlb0xXdHlMcXJmUWN1dEVJV2ZBWURXdWU2?=
 =?utf-8?B?OXliZDNUc1l5RmlEeDRUbTdPWm9QSUpOa1ltNXNQajQwWkl0TEwxdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97db70b9-5e35-4f61-cfbb-08dec70869a9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:53:28.1717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pYHk9VbzgBY5XNj/Y3+KyqXca7yYTzO0dMjGxbr3ivDdPgQSooMVUCfBXCg7L3WXmk6v3Zg6ACNfVBtU25Zt8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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

--------------nN5G6llYt4ylDvg1ME0IsnhP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kamil,
Thanks for adding me to the thread. I don't see any issues for us with these changes, since we do not parse either 'dynamic subtest:' or 'subtest' strings in CI.
I’ve added Alex to the thread just to be sure, as display tests probably don't use this either.
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Vitaly
On 2026-06-10 11:29, Kamil Konieczny wrote:
> Hi Swati,
> On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
>> The exit_subtest() function always printed 'finished subtest' in kmsg
>> and trace output regardless of whether it was a regular subtest or a
>> dynamic subtest finishing. The 'starting' messages already correctly
>> distinguish between the two ('starting subtest' vs 'starting dynamic
>> subtest').
>>
>> Fix the 'finished' messages to print 'finished dynamic subtest' for
>> dynamic subtests, matching the starting message convention. This makes
>> syslog parsing and test hang detection more accurate.
> Should you add Closes tag here? See
> https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198
> Fix multiple results from one (dynamic) subtest reported
>
> +cc Janusz
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>
>> Assisted-by: GitHub Copilot:Claude Opus 4.6
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>  lib/igt_core.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
> This could potentailly affect other CI pipelines, so
> +cc Vitaly.
>
> Regards,
> Kamil
>
>> diff --git a/lib/igt_core.c b/lib/igt_core.c
>> index dc3ac5304..a0d9c9d7d 100644
>> --- a/lib/igt_core.c
>> +++ b/lib/igt_core.c
>> @@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
>>  				*subtest_name,
>>  				result,
>>  				igt_time_elapsed(thentime, &now));
>> -	igt_kmsg(KMSG_INFO "%s: finished subtest %s, %s\n",
>> -		 command_str, *subtest_name, result);
>> -	igt_trace("%s: finished subtest %s, %s\n",
>> -		  command_str, *subtest_name, result);
>> +	igt_kmsg(KMSG_INFO "%s: finished %s %s, %s\n",
>> +		 command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
>> +		 *subtest_name, result);
>> +	igt_trace("%s: finished %s %s, %s\n",
>> +		  command_str, in_dynamic_subtest ? "dynamic subtest" : "subtest",
>> +		  *subtest_name, result);
>>  
>>  	igt_terminate_spins();
>>  
>> -- 
>> 2.25.1
>>
--------------nN5G6llYt4ylDvg1ME0IsnhP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBRAB" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Hi
      Kamil,<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBRAE" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Thanks
      for adding me to the thread. I don't see any issues for us with
      these changes, since we do not parse either 'dynamic subtest:' or
      'subtest' strings in CI.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBRAH" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">I’ve
      added Alex to the thread just to be sure, as display tests
      probably don't use this either.<span></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBRAK" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 16px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Reviewed-by:
      Vitaly Prosyak <span class="T286Pc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);"><a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a></span></div>
    <div class="n6owBd awi2gc" data-sfc-cp="" data-sfc-root="c" data-sfc-cb="" data-hveid="CAAIBRAN" data-complete="true" aria-owns="action-menu-parent-container" data-copy-service-computed-style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, Arial, sans-serif; font-size: 16px; font-weight: 400; margin: 12px 0px 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Vitaly</div>
    <div class="moz-cite-prefix">On 2026-06-10 11:29, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260610152928.yauflzchk2uf7szw@kamilkon-DESK.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Swati,
On 2026-06-09 at 01:08:07 +0530, Swati Sharma wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">The exit_subtest() function always printed 'finished subtest' in kmsg
and trace output regardless of whether it was a regular subtest or a
dynamic subtest finishing. The 'starting' messages already correctly
distinguish between the two ('starting subtest' vs 'starting dynamic
subtest').

Fix the 'finished' messages to print 'finished dynamic subtest' for
dynamic subtests, matching the starting message convention. This makes
syslog parsing and test hang detection more accurate.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Should you add Closes tag here? See
<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198">https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/work_items/198</a>
Fix multiple results from one (dynamic) subtest reported

+cc Janusz
Cc: Janusz Krzysztofik <a class="moz-txt-link-rfc2396E" href="mailto:janusz.krzysztofik@linux.intel.com">&lt;janusz.krzysztofik@linux.intel.com&gt;</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 lib/igt_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This could potentailly affect other CI pipelines, so
+cc Vitaly.

Regards,
Kamil

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
diff --git a/lib/igt_core.c b/lib/igt_core.c
index dc3ac5304..a0d9c9d7d 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1733,10 +1733,12 @@ __noreturn static void exit_subtest(const char *result)
 				*subtest_name,
 				result,
 				igt_time_elapsed(thentime, &amp;now));
-	igt_kmsg(KMSG_INFO &quot;%s: finished subtest %s, %s\n&quot;,
-		 command_str, *subtest_name, result);
-	igt_trace(&quot;%s: finished subtest %s, %s\n&quot;,
-		  command_str, *subtest_name, result);
+	igt_kmsg(KMSG_INFO &quot;%s: finished %s %s, %s\n&quot;,
+		 command_str, in_dynamic_subtest ? &quot;dynamic subtest&quot; : &quot;subtest&quot;,
+		 *subtest_name, result);
+	igt_trace(&quot;%s: finished %s %s, %s\n&quot;,
+		  command_str, in_dynamic_subtest ? &quot;dynamic subtest&quot; : &quot;subtest&quot;,
+		  *subtest_name, result);
 
 	igt_terminate_spins();
 
-- 
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------nN5G6llYt4ylDvg1ME0IsnhP--
