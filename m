Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FD2F99368
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 10:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4972310E312;
	Thu, 23 Apr 2026 10:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hzMC8ncV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D65610F083
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776939977; x=1808475977;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6DcwmQmU1afcvrHI1JMrUm7P2zWUwb5xmSWClqL2cyA=;
 b=hzMC8ncVXhIttJWPIpS8KtI/weh1ugTRLHLmgwXKhDsqqOuquNkP02s4
 5HHdWhfmqhESoSEN/Njz/1QRKBfVcv/Xyfx61YCiKtVHxKWaEvyj3I7J/
 p/X0kxoPRxUZbj+EXoQEIuXsv6UdyMIZVZQ5WbWev0eQob8PMm8eFirfB
 3zTZv3ycJud09XVLiIymBNlqqS1P5Ztb8+ivi8xAU+A8Vz/5aJvymHAVq
 QlvD2VKQFgoIaQ/G1RFTeJcJoflKrb7KZ2jlygZes9SrmqPrw3jDdYZsY
 k3x7WfRz14rDJGt2aOBnU75tpBMYKSy7LwsyRKddnhA4KMO1sibgq/FRD w==;
X-CSE-ConnectionGUID: ZeWR6aoZSOWQ0c2Bv5J+QQ==
X-CSE-MsgGUID: N6WIgCWUTDmn6VpKKAe7LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="78094969"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="78094969"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:26:17 -0700
X-CSE-ConnectionGUID: TOvP2XrHTqygKNn5QTUoNw==
X-CSE-MsgGUID: yhTO+3DORpWwGdU82jO4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="236990304"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2026 03:26:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:26:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 23 Apr 2026 03:26:16 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Apr 2026 03:26:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMm1XSjD7PZyAur3ohiWOTr6ZmhXUNBGmn1gTnClh+Z0QoGefrvJHZgzo2vsyzCo/tPhcjoNTxX0N+bBOv15qX02igfYOntiBG8i+SjYMg9ZmAWfpzCr7VBZX+8tbMSrBkLoOrwrRSG91Ttsx7KAf46zWKJvkExs3sY+KwaOQhpat8N2MlvRKNuCaFPWPh/+fS/PDx48SFsJoYnFoT7ARcgc0UGzY5a9ytikH815UfwVMPWlngxya0uOUbEhPOgzfgCQYPgzlCBhzqMFUb7il20zvaOsB36wRnPoxq2fXlvkSbSo7y735tlNq9l63C6VyeugP2kw9scwWMAYdUAbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LBagKvdSxOFlSjV2ftJJDJj28lpIZ94Jf6CtuUij1Yk=;
 b=ShF+cC5lloZly8xMXFNsRpduEjQqVYWEnIg7gNKxcRVSMigczsf3xNI+epyMWafx3xl/CGL6sTD8i5YPAQphzFD1s5hQ9+85vyvsNL70M6Ua/8d+iRQN+GK7GPfmh8jDFYlgsDqMGXCzv8SyQQae5UNz/PG2isSdPDqXLgQLknlRmn66rFrNqEdMkds9IYFmsLK8NjLJVpfD6CyBfCgN5B0lwTaRHCPSDYRsMn52YsuIUOBOM/8U+heTMgIub4HftmT1mlQSI3ku933KTkMomEgHzpZo93cwWUz/+pEFgNmaZAP5A5aPaznOL/j3eDI981yYbgir9rskSxh/++iB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 10:26:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:26:03 +0000
Message-ID: <c5578fc4-f8ae-4260-a884-2264252d6e8c@intel.com>
Date: Thu, 23 Apr 2026 15:55:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/5] tests/prime_udl: Create subtests
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260422154423.141908-1-kamil.konieczny@linux.intel.com>
 <20260422154423.141908-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260422154423.141908-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0255.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::8) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 93467502-f73c-4b14-a76a-08dea122b85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|42112799006|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UL+mKTo3Vv/kV//WUYhQIfGaGKuG1znyaQG+khL37bg776QbeHFCCAu0IpNetw7s5O22by3H2DRN/KdGQDJole60lQVGwQHb2fG12tdwxQ9/uzYy+o/F7fubmmdZIaq4goYhxP+/rx9ScoXUWzJiUcsi27GCquEqm2MSJvNr1DlgNDJyh6uk1sjZPEs4enC8D9kYNXTAracEqRB6yM9Ec0VHmWsoxBPNJlJbNw7amDxVYvU+jjHtOzdeiYVZqF6pMzUGmGfXXKmxtEdWD8VfUydmGkQdDsN/VsqK4TkJoOC2h+Zg2wqUJ1axHfQVDQ9i8GtfzlV+UOR7hgUBrz2Ni5uW7q9tXY5dlxUcvZvhsSPO0qWKrEK9Jh7aqOO2WmqS/NlAJyG8iiqjiFC0niohw9fBSHAWkphO2ZQo/kYoAflNxcz+u+BWa6/XYe7nfLeXTxG8Z9DUaElsZlJaEjO1c63YThmH4KXqm4HylQASPmkH6yCrA6tF6dQCL4a38ZwcnM/ZjRar0smIWMXxSnBWbEySRjrUlMHS6K+pu7OHPsONgu+YhY9Vl1dzzF0BVGk0sGNRyprO59ytkwrcdJnrPqhDAFTe7th/R1ItjZjOuiTj+yPS5+lVu6vTCre9k/JHg4Vq7cGvAVxUpLNcNqiLB2E7PJuE2gh9liIu2FwZMFD+4nn9WKLrpbn4zffzwsecjUKyeSIOs/5JM5aa6H0bziElkkG9yvEzn3v1sYnmnTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(42112799006)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU0zOGxVbUkrS1BkaDVYbXRubDdSYnNEM3loME1oWERwVGRSTmFBSW55YXRn?=
 =?utf-8?B?NXhxV3g0YjFxeG1BNDhESkx6RE03bCtObGJKRzJEbWNtY0RBS3hnOGExL1Rz?=
 =?utf-8?B?TXNMUUtYcXY0dHIzNzlnSTVIUkdNSWVBTVIzYjRidVdyZ0lmRVB3eS9mRkNT?=
 =?utf-8?B?SjQvRlUvNVJMK1Z2bjJPM3h5cFpNbStUZFFzUkZBUGJ0VDNFS3hpNkVWa2p3?=
 =?utf-8?B?TlJVZitIdmdLMFNhSnJvNHAzQW1xcENNVy9MUWJCSmdsR1p2UWpTVUxOOGM5?=
 =?utf-8?B?Yi93bTB0SHBIUUxVaFdTamtpbmtsNmR6T2ZHbTJhZ2hGbHgvSzJYR0gzL0xn?=
 =?utf-8?B?MFJ4UkRBeFQrWnpzdEdnQ2ZOOXNNMjA2MDUwRW9BaGJaOXZ4YlFLZ1JIZi9B?=
 =?utf-8?B?WDBvY29Qelg3cU94UURNYVFsQU9aYnpDY1JaeGR0UitHUHRPMm0vOGFGOURy?=
 =?utf-8?B?Ylk5MkNFY1B5dWNLUEVOUUZCdk8ycUtsR09wdzRHMUNTcnFPbDZ5SUt2QVFV?=
 =?utf-8?B?NnR2Z1Yrb1V6VndKV0Nla3RrUHlTbXRiTHdETXJVQVpDNkQ5U2tOYUJ3TWZ5?=
 =?utf-8?B?Z1JjWktQVVh5cW9wVThvSzFqZmFPZXZqVWNra3VoNHdvV2NKNWdiQkxYT3Y4?=
 =?utf-8?B?akIvSWU5OVoxQzBwUHhjTjdYbllXbWdRRUd2VHNiejZyYVhEelpwQmRQTDhh?=
 =?utf-8?B?NUFWWmg5bE92eloyMVlidk9BSktSWE0rd2x0REI3NWVzd3lBMkhSa1ZEYm5J?=
 =?utf-8?B?R2NWbVNka1Z0NEpOTDNpN3NETTR3dkhkcWFqUzFiaHdSdWlWQ2N4ckJJNHNM?=
 =?utf-8?B?UUU4b0JJNmtLeFdCalRwYVBxWlNLUWt3WnUzZDNVNUdnYnZrUlRMR1JxVGtH?=
 =?utf-8?B?Yk43ZXpRR0VidzZPZDVPZit5TXQ1Qm5od3NmU2grblJtZGkxeUdkeit2ejN0?=
 =?utf-8?B?K3g4SjIyaDcwdkxFVFBoSjRZY2JZV3o2WHFEZzNCOEdGZ0FZWFY3bHNuTEsv?=
 =?utf-8?B?UjVyYzZtdUE0ZEpyTEpndW1CSDVPQXh0a0lJcXNPaVF4QUhKeGVXNXhlam5Y?=
 =?utf-8?B?dHZkU1o4Y0R0MlA4N0c2Z1FVbHUwVWMxSnFrTXdhR0J2amFDQk9PSDlnL3Rh?=
 =?utf-8?B?ZUpQZ2ZtYXpwZGxBZlBQQ01OMmxJOUFNcVFaUHRQSXp0SkJXVFQrd3FodTAv?=
 =?utf-8?B?eFVPeklIMDh5Z3RyVzFWZmVVTzBGeUp0OFo1dmdWWkpWOWFIRmtjRzRtRVN1?=
 =?utf-8?B?L2hJZ1pnYklNVml4MjFobUZya2p1V1JHV2FnaStZS1NBRjdOaWpGUkZ5S1d0?=
 =?utf-8?B?TS9FZjZMcEpPYitwTURYZ1J3R0krTW5jZlMzNFZJZWhjUkxrWkFtY3YxT2h2?=
 =?utf-8?B?bFBCQ3h0M2NTMFY5dmhZS29xSXJUYnJvdEk3c0l5VW94MXovUWV1M0F2SVJw?=
 =?utf-8?B?VExKNW5MTE5ReWZFUlFkUWcwZ2djbkRkNWJnaTNSMU9EMWV6akZrN20yTDQ5?=
 =?utf-8?B?NUJzaDFCbXNwVDhiTTZEZDJXQW4wNWZrUWtWMUFwTTc0NzFSUlFzRDdTa2g1?=
 =?utf-8?B?UENXWmdkQjA3Z0NNc0NVYkUzVkorOTV4bjg2VHlsdyt4Zmd4WDduV29qVWtL?=
 =?utf-8?B?Rys0OG5qVm0xK3VacVZ2WXl3di9Rb2x3OXhCMnBUR1JmYlAvKzBrN05sVjky?=
 =?utf-8?B?M0ZnNDQ3L214ZjJGc1VuajhoSkpXSlBWWWF4QnhSelB4MTQ1L2NWZk1vdDZr?=
 =?utf-8?B?TUVPamxDa0tSeEFyRk1sQnlhbjZleVRDVWVMUm52VXgrR3J5OVB6czJlakNW?=
 =?utf-8?B?RXpGM1VqeURvQ0puMVZ0a0JHWEtESVRFWEkvalU2QzB4aVhCVFhzd3BHd2d4?=
 =?utf-8?B?eSs0emxaYXhGZllWbGd6dzM1VUZjbmRnbkh5eWg3RWt6OGw0aHk3TlFRL2w0?=
 =?utf-8?B?dllFRFpjRW1YS1JCWjkvQndOd2lSY1RBc1c4ZGc3UXZOakFKMW9rWGVIYy9r?=
 =?utf-8?B?Tk5paUFLZGhkT1lHL3orQlk2RzN6THdnVm5aK2FqUzJwVlhZQkhnRndPTU90?=
 =?utf-8?B?aGUyUUNEeEZsZzFYU1BBK2hqNXI3blhTNzBYMmJ3ZU91eXYrT0ptU2RMeTli?=
 =?utf-8?B?amxFS3I5Y3VSTlhVdHBKaGJqSG4vb3JHcmEySkVpSVhUSEgrTWgxb2syUGFv?=
 =?utf-8?B?UUd6QloxTVdNY2lHRnA5U2FZbFFFQklmdzdUUndYU0k1RXFLWkV5bHU0dDJR?=
 =?utf-8?B?Uzc1V3ErdW5rc21nbDRCbnJKMU1NNTNFZjJFUzYvQzFZdG55aDdPQ0ZrMFBH?=
 =?utf-8?B?S2hHM0VWcTFpRldqcXVMbGttLzZidkQ4ZHluMXoxU1dCWDdjRmRXUT09?=
X-Exchange-RoutingPolicyChecked: QxTrBoepV6klvSXp0rUDe1cSf5oMcOTU/BXrbpD0XfJHCBzwjeQUMe7kgSiXi6Rohvhn/RnW6E2fDnsJGlxAQKpumnYd7vyAWTmz8H3J8vVPMp1SgsDnsIs4gaPoc7qw1DvwWTUHtcVP5BuawLHi1wwLWp+0hSaOVQfj+/nCPZpFoG7VyDWN7R3rViVSmEr63ZAdlargazIWL1C6Dx7gQm6tRlRfHYqUKmECzxhcHI3pXRgqtWCklz9JhCr9bWXKwHH3TvzS0OyKxN+t/4dHoDeclmaZAvJ1pQO1MjPFoVCfnwc7fXK55Crhs7QQGIofYYYL46QYYzhQEAeavwNQxw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93467502-f73c-4b14-a76a-08dea122b85e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:26:03.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7TqOUJw5zYHIszCF/Vk5vUBIHDGl9L4xthEqEgNLQ9kPTba/gQyQvFK9TXAFchd0mACTYKXWTOaS4+omSnwYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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


On 4/22/2026 9:14 PM, Kamil Konieczny wrote:
> Refactor code and create opening fixture, subtests and cleanup
> fixture.
>
> v2: use igt_main() with igt_fixture() (Kamil)
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/prime_udl.c | 23 ++++++++++++++---------
>   1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/tests/prime_udl.c b/tests/prime_udl.c
> index c3e92be1e..b1524e6de 100644
> --- a/tests/prime_udl.c
> +++ b/tests/prime_udl.c
> @@ -121,18 +121,23 @@ static void test2(void)
>   	gem_close(intel_fd, intel_handle);
>   }
>   
> -int igt_simple_main()
> +int igt_main()
>   {
> -	igt_assert(find_and_open_devices() >= 0);
> -
> -	igt_skip_on(udl_fd == -1);
> -	igt_skip_on(intel_fd == -1);
> +	igt_fixture() {
> +		igt_assert(find_and_open_devices() >= 0);
> +		igt_skip_on(udl_fd == -1);
> +		igt_skip_on(intel_fd == -1);
> +	}
>   
>   	/* create an object on the i915 */
> -	test1();
> +	igt_subtest("share-import")
> +		test1();
>   
> -	test2();
> +	igt_subtest("share-import-addfb")
> +		test2();
>   
> -	close(intel_fd);
> -	close(udl_fd);
> +	igt_fixture() {
> +		close(intel_fd);
> +		close(udl_fd);
> +	}
>   }
