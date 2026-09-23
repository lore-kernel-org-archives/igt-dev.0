Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C2C9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 20:31:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB58F10F1A0;
	Wed, 23 Sep 2026 20:31:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YTyreCHJ";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013042.outbound.protection.outlook.com
 [40.93.196.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3CB10F195
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 20:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGaMmOAJIe4FLc1o5HnDkWIAhXJU3x0UzUnLwLQTl0Mye4nDGaMaJi9Sf9G/MmUVy8yXRXyg5h073CYPuZuGPaIJpx9L0j9Um8pZtxwDcP62jhBcqWbICzBGuCFu5KaRT/OWMMhPuYMLtCc0V6kJPY6EOEI91hDm0WkqAnreHrFxE/WP9KoTjZYamU8MO5mWaKJeLKD3lIVEXQJvSicVDi3KeRb7Z8CtZFgmHKFGL+/leWc3iqbda9qtIJ+UROhrI5YfKQxIGnoMWCjhbg6w152jInXyQQnadYAKamrEdm0H+GVJP2HszVTiJ2P3oly/tlfDllx3eM+aXDc6mWCS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFWPsKcVor+El2xE1TiIkUrAX5LZD+Bjx7mlyYBvJeY=;
 b=FruM68ByOSAcWPvUPCoT4pamGuWzXQowJYZd4AoHM70MbsHGbMUmjaDwKxrJxA8urYkowf3cx+B6qCI3TE5qaCKTv3MtwqQucEmxravnIHeglP6DcCc4rEGrzRZI0vBb68jpjFSwsI9DgioXXk2DVzcTvfGVZzlRBWhtoBHgh2Zw7LLBw/K4VQPg8DcmMtKUHQXXSHA/PlRp1na0SarmK69jepSksLqfziH/0UOEwpNUAOZx0Xk73W/1thgS7sMYsIzkeOnz85Ml0gihMcrxqD2QEGO61OLZOJLYrHdpuL1HdzMJ+VdHZT8QGDuO0s/Z3JHzAgvWsgyNZSItbVOLuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFWPsKcVor+El2xE1TiIkUrAX5LZD+Bjx7mlyYBvJeY=;
 b=YTyreCHJa5/Bk82QxS9YBDizt/EuBH/DzxzkwVqxZGeQzrJYNxLIUbmvHcbYAP8qB0+bqRtbPVUccNzBKE2GMBxTILRsBZlPQ6NaD7Ifc9yZ8s76zcN18aA+BZr77jDprS5MBApp43BsHaaJI74ItE9xn2I3b5kMjgw3eOw59wY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Wed, 23 Sep
 2026 20:30:47 +0000
Received: from IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de]) by IA1PR12MB8190.namprd12.prod.outlook.com
 ([fe80::c581:f5cc:c58f:c5de%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 20:30:47 +0000
Content-Type: multipart/alternative;
 boundary="------------JLtlurolGfFoVnSFLwTzfftq"
Message-ID: <4f874f26-9405-49d0-900b-2f6e75846123@amd.com>
Date: Wed, 23 Sep 2026 16:30:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 0/2] runner: create results incrementally
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260916154740.130190-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: YQZPR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::28) To IA1PR12MB8190.namprd12.prod.outlook.com
 (2603:10b6:208:3f2::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8190:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e6b63c-93a0-4e4b-6e31-08df19b18cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|18002099003|22082099003|11063799006|8096899003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: Abg9y1UFR4UIM83zaaemVNan7H0Gm1wy3p7CBb54yadrkaEO1tfOICYzISN8TkBwNbLrhylqnJUTZYgNjdEY8ubcnSA0DVFMH1TNbYpHhIu/d6CS+gLfX+EL+wPMRwmuyXZakvLZPdMDcCTVdNLmxL0xdxJDGFsX39rVgALzrMcPCodK/JVqoTV4Qombm4sweasi2aEvaYe6FW8H5XOkvGdMDmreWg2Ow+PClkIIMFOXEA50gJ4rt0IHROW+1ry8aPP63zaZzDUMxFd3FPdVrvf8su6opI7Y2vNW15e6M/pzEntJ9Z+eiR5XY5ZATUYdRPfesG4mpTqfJEJ/78ht2prFVMq+QxWaQlabGRf0uRBA4EiN+KTP+lZB4OLgEm2a/B2B1efST40HY6z0Jz6gqF6ssYOvTR+60DxfBlBdjXgg3f4YM2fqJPJh195PjEsWTS9U44L4A3PAozOYTsawpaAPONo7jubhKv++stXVjRSFstkf+ZsuVMEEbAzAGts2LoPJgcyeuKRDMMh/7yF9SCiCtZrPAj7vYyXZVn44jNe/H4hmOD065Wv2b4C3Iwe1OlCE6UMVsoYiGssRw4/say/DXN4oV6yAi7dQY0C04zoZ1I6qjVPkRtbVk7HhAQgw2ynYaR9nJUAN8xjMwt6LL4FO/s4z0x1CAfJzFb+KrU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8190.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(8096899003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVxUTZTS1YyTWZKZ1lwUVJyTjIzVzNlNDR2L2wxb2tRZ2svV21XZHBDcXBx?=
 =?utf-8?B?Z3JScEZXeVk5Q0JzUDdFZ3V0NWhpWElKNFE0c2tRbE1pUDU1RGNsaUZ1Slhl?=
 =?utf-8?B?cWxLTlladGExUXd3TGNUUVVTUklvRzBVVytqOEM5d1ZrYXBjeFNnYXJTei8v?=
 =?utf-8?B?S2VUOUhSbFUxQlZtWmRkOTQ5TitIUlVpZjVidTUrS2x6NTBKcWszK0dVTTNT?=
 =?utf-8?B?bkk3WjlReG1Xb3dLSWJxdUcyQk92L2Y4bU1nem05SFJtbzFoOVh2YjQ1NVZD?=
 =?utf-8?B?c2VlQ1pmaUhGMHRZdkxScFhBZUI2OGNheVdlTGQrWFMrd3dQdlkrWHE1Mk9v?=
 =?utf-8?B?alFrenlBdXN2eDA1WDlkRS9hYjBvMFB5R3UrOVZYc3VrdTV5Q3NNbEgweWV1?=
 =?utf-8?B?NURRdmRkR25QeDBTQzFtYWJPQXE1YUN0QTZNOSt6YXBPajBsazJDVUxLcEJR?=
 =?utf-8?B?Rm5uSEJKaksvY01hM0d5MFdkcVFGZ25LRGQzMjNkWEpDUE1jZ3JHODRrL3Jn?=
 =?utf-8?B?V1d0OUJpMEpGRWx0NFFJV0JMVWJBZHVtMmk1YjVPN25tTXhJME4wQTY1d1Rj?=
 =?utf-8?B?NWpEZ29VTjZkNVJzb3ZVYTFNRS91WWx5V1lRMGk2OGpzSnVsZVdlQkNzZFVp?=
 =?utf-8?B?N3VSS28xRmtVcnIvdDhBQUZCL3pRbytScldTNjVpWi9Zd3B3TTlOclVPVEdQ?=
 =?utf-8?B?V25yL1dKWU5hMm5RMFM5UUI1Y0dBV2FiMkRlWXdCczJTYjdOaG03Y1h2TXRh?=
 =?utf-8?B?VWZLTUUzK3hnQStkakhINk9nTmV2THY0TUlXaW1Hb3MvTlllL3pBMjNEN1lo?=
 =?utf-8?B?WWNFQmpkQko1ZnFFY0dJaERBeWdTU3BFcndFOHl4aUVOaG1QM29uVjRGOVRZ?=
 =?utf-8?B?RTFyRFNsR1dlZjh6cVFFNkpUaUNFNnJYOEFrY2RCU1VWWjNLOFBySCtwbmhC?=
 =?utf-8?B?dy9lcE1zMGY4YUlsRzJwbHU3akJjSGo5c1QwQWhpT3drR2pnNDNoelltNEJF?=
 =?utf-8?B?anNUZm0rTVJ1Y3JSamo5eU9YMkIxdzVGQ0dHR3BLM2VjMnU0aXFUTmJMZDFy?=
 =?utf-8?B?TmNMWmZjRGJiK0s2K2JnaHhrZFZIU1J1K3BZQkYrQWthbE1kV1BHNDlxcHVL?=
 =?utf-8?B?N0JTZUZ1WS9TdEZyN29BQi9kVnAzQmNrSjJVaU80OTNmNnZYcC9rRlVSVW14?=
 =?utf-8?B?UHJKNm5Yb1dDUW1pUWkydFlFNmpQem1tc2hSR2ZlUUR2U01HMjE0dCtqZU0x?=
 =?utf-8?B?VkxLcEhSTlM5S1pxc0J5YTlSTEJKN0RGL3ZFR3VZRFpQN1Q1MFROVHpBMDlu?=
 =?utf-8?B?M3o4VlJ4c25pYlZrYW91NzBUcTUrdW9CemVUeUwyQTBFWkUvM2lvNlBoT1BJ?=
 =?utf-8?B?M0t6ZXpqRnhOSWFJanNkZm4xTHl5RkxOcjlWYTIzd0NLUFE3eDdCaFQ4QXQ0?=
 =?utf-8?B?VEt1eHRvUFZ2VTg3Z2xzRDBVRktpckwyQ1VIeXVUUzRZSzk5ZXJIelhXOUVK?=
 =?utf-8?B?OC9RR0ZVa1AxMGZNcDVST0szRFlGaU9YMWhnRWdIRk85aXMvUm1Ua0RMV3A0?=
 =?utf-8?B?UnlRL3RPTmc2d21QRnZJY2Q0TnBGemRKeEpMa21DcXlDNk94aGlYdTcvU2hh?=
 =?utf-8?B?R3BRanRFMktjUkRGcnhlT2hWUk51N3MzLzU3dWFpUENPNituQ3Q3VGIvVm9D?=
 =?utf-8?B?ZTJiUlhCT0pDbkJhRVZPbHFFWVNnMFlIMkp5YXh4NVl3K08vZXpYVUNYK1Q0?=
 =?utf-8?B?bGJKOFpJQVlRSXV4UUV1am54cFphZmtFN0tEcnJEMkZSc3ZtRUhxQzBtQ1RT?=
 =?utf-8?B?U2J1WGxYQlhlQWdxWEorR3MrZTRzL1NjaFE4VnE0YVMvNGVnUFJCd3FzOWZo?=
 =?utf-8?B?U28wNUJaTzBtT0lmWlUzdE9VMFE0RU5id3FPa1VVb1NHOERWcHJnbjF0SmJl?=
 =?utf-8?B?dkNVK3hJTkNBa2xlTncvSUtNWGVZdDFZejZJNXpiYjBEQmpoRStBZHpMQ0x2?=
 =?utf-8?B?bzhjZTYvWTNSTnZuY0tBeXdmc21RNVpycmswalZWSFpXWktraFF6VzJBTzhu?=
 =?utf-8?B?RjhRdEpzY0lBQk42SUZlWjYzZ1VBNDlxcWJhYkpYUHJGWkM4dU8wN3kzbmNG?=
 =?utf-8?B?RkV5TjNMb2RmdmlGRTJLNjlOL3phM1Q2eVhkSldXajBqSGFuVFJKbjVxV243?=
 =?utf-8?B?Mm8zNitxSXhDOUFWSXlvMkplNXRnUjk3Q3Q2SnRWMHJEaEhOWFkreWpHNE5X?=
 =?utf-8?B?cDFjb1VDQ0MyTHdQRjBFODdqa2VpcDRMVFJZNlhhNVhQU1V4ZnQ2S0trcTF2?=
 =?utf-8?B?UGVNL1Z4U2hHN1dPK3hYenNwWUNaYVZYV0c0cDJvMFc0OUZEaWZtdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e6b63c-93a0-4e4b-6e31-08df19b18cc4
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8190.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:30:47.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDqh+3G+DlYVyOEPEdCEpQpfVC+oI0niBjanT9HCcB+gy69TtSDdQEd7QRQtAOcGbqcnQbY4HiZzuC5Hz+OB6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29
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

--------------JLtlurolGfFoVnSFLwTzfftq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2026-09-16 11:47, Kamil Konieczny wrote:
>       Create results incementally during run, e.g. after each test end
Just a tiny nitpick: typo in the text -> *'incrementally'*.
> its execution create results.json up to last one executed.
>
> One caveat is that it will still not hold last one at which
> sudden reboot happens, for example after a kernel panic.
>
> In such cases there is still a need for calling igt_results to
> collect all data.
>
> v2: rename option to --save-results-after-each-test (Ryszard)
>   renamed function to better describe it saves only partial
>   results (Ryszard)
>   using results.old, not .bak (Kamil)
>   bailing out from saving when endtime cannot be saved (Kamil)
>   reorder patches, first should be introducing new option, then
>   using it (Kamil)
>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Kamil Konieczny (2):
>   runner: Add new option --save-results-after-each-test
>   runner: Create results after each tests end
>
>  runner/executor.c  | 68 +++++++++++++++++++++++++++++++++++++++++++---
>  runner/resultgen.c |  6 +++-
>  runner/settings.c  |  9 ++++++
>  runner/settings.h  |  1 +
>  4 files changed, 79 insertions(+), 5 deletions(-)
>
--------------JLtlurolGfFoVnSFLwTzfftq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Reviewed-by: Vitaly Prosyak&nbsp; <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a></p>
    <div class="moz-cite-prefix">On 2026-09-16 11:47, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260916154740.130190-1-kamil.konieczny@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">      Create results incementally during run, e.g. after each test end</pre>
    </blockquote>
    <span class="iNqyIf" data-sfc-cp="" data-sfc-root="ep" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 400; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">Just
      a tiny nitpick: typo in the text -&gt; <strong class="rQesXe MPyX" data-sfc-cp="" data-sfc-root="ep" data-complete="true" data-copy-service-computed-style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 700; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);" style="font-family: Google Sans, sans-serif; font-size: 16px; font-weight: 700; margin: 0px; text-decoration: none; border-bottom: 0px rgb(10, 10, 10);">'incrementally'</strong>.</span><span></span>
    <blockquote type="cite" cite="mid:20260916154740.130190-1-kamil.konieczny@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
its execution create results.json up to last one executed.

One caveat is that it will still not hold last one at which
sudden reboot happens, for example after a kernel panic.

In such cases there is still a need for calling igt_results to
collect all data.

v2: rename option to --save-results-after-each-test (Ryszard)
  renamed function to better describe it saves only partial
  results (Ryszard)
  using results.old, not .bak (Kamil)
  bailing out from saving when endtime cannot be saved (Kamil)
  reorder patches, first should be introducing new option, then
  using it (Kamil)

Cc: Ewelina Musial <a class="moz-txt-link-rfc2396E" href="mailto:ewelina.musial@intel.com">&lt;ewelina.musial@intel.com&gt;</a>
Cc: Ryszard Knop <a class="moz-txt-link-rfc2396E" href="mailto:ryszard.knop@intel.com">&lt;ryszard.knop@intel.com&gt;</a>
Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>

Kamil Konieczny (2):
  runner: Add new option --save-results-after-each-test
  runner: Create results after each tests end

 runner/executor.c  | 68 +++++++++++++++++++++++++++++++++++++++++++---
 runner/resultgen.c |  6 +++-
 runner/settings.c  |  9 ++++++
 runner/settings.h  |  1 +
 4 files changed, 79 insertions(+), 5 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------JLtlurolGfFoVnSFLwTzfftq--
