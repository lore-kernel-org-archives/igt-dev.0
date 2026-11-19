Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040D6606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NGd1fINx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D3811208C;
	Thu, 19 Nov 2026 08:24:30 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010058.outbound.protection.outlook.com [52.101.46.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CFB10E222
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 08:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7YQFIHYKQncF2lhLtgKoQYb9nLliwdir5Ec/NNZGJr1PgDk+/ErlgaLIuEHUubuOx+43MF0lZ8KJylrNjZaHTPiFGNcHy0ewlCIirEE6l/UYr6PLASbyiCMgGX2T4UYtyspHf2jLB4uLbESytWAjEA37U7ZVZxlyIBAJbTgQ0MO1HnVATXsXdmAQK7HEnJ7ahaCwA6nQki2uCGN6XuH50wVXPdfU7d35xLP03OXCMYGylzLAPL07KgU839abmhlfWZHy3g2nfheJtFWe5U/LavxXZ4oGdnpJGg+xZFEuiuFrATrOtSCNswLI1eJjhWNxX2YHNZW6pBItVpdo3+WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJBLqj9KBdpIXEflw+BFhwv65fkn1zVytU4NlfY1CTI=;
 b=yRl1EPvsi2YPs8QENpU19MuR6mtslpj707MnCNIOeh6pYH0cGrhZLn/UZlx6j6SVpcYftXeGJMMvZ4n/demt4XG+1AGethim2cj3bpQwWsSCy41oGp/vDSmE5+mg7B4pwFPX6Qhq0tDcw0v3cUK9KcsyIQdQ1W8fYcMfnMk8smFkGTtG54CZk+9sOFYaazV9UGixRX4gwld4X7kN6ey0DqIkp09ubFedYB9bu3hs3hHifSN3sxEcBHuMJnGyOhEV4Io7aYi0UNs2DnVSbSLXiKXwFWJINEdAu2cGrcmsGS9hU5SBij2+28xZYp24HrJrxwvG1ZMKyR+gX1DHOK6xPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJBLqj9KBdpIXEflw+BFhwv65fkn1zVytU4NlfY1CTI=;
 b=NGd1fINxHU/xT5C+Kq68HzIo9XPGPjDoh1G18qfCDqGbgiIR9a2am3hYIjFgyWPYIgzE39BdKmxna0C0dK3aJGGPwwDRM6So0Ye37Ci7HJnWh5WlmqvVav3Nnf14NOeLdTR5820H0s+IrrvRmegYSefViMlPfPFXWKKZHCVdffg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CYYPR12MB8701.namprd12.prod.outlook.com (2603:10b6:930:bf::6)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 08:23:26 +0000
Received: from CYYPR12MB8701.namprd12.prod.outlook.com
 ([fe80::2d1d:d718:e022:2e18]) by CYYPR12MB8701.namprd12.prod.outlook.com
 ([fe80::2d1d:d718:e022:2e18%5]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 08:23:26 +0000
Message-ID: <f7cedb17-3ccb-489b-9b92-1d3d59e056ba@amd.com>
Date: Thu, 19 Nov 2026 16:23:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 0/5] tests/amdgpu/amd_replay: Fix state checks
To: Ray Wu <ray.wu@amd.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, kamil.konieczny@linux.intel.com,
 alex.hung@amd.com, sunpeng.li@amd.com
References: <20261116070248.4103604-1-ray.wu@amd.com>
Content-Language: en-US
From: "Chung, ChiaHsuan (Tom)" <chiahsuan.chung@amd.com>
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::20) To CYYPR12MB8701.namprd12.prod.outlook.com
 (2603:10b6:930:bf::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR12MB8701:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: c2086bca-c131-45ab-de62-08df46166221
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|261009223027099003|18002099003|22082099003|261026140227099003|261021121427099003|261102123227099003|261028144727099003|261021123027099003|261022105027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5382r/HGga71htoGYQ75h0nnQHI9mcdve4EKMKPE3IGAgFmYZFlMs96BbYO96rkkdwlb8TP7WIQP9j7LBxh5Zga0oivx805kLQCxYNcEqWrwnESVz4NuM8srRSqpDt4IuWYGFkBwEdsDcK7GuBB8RaKM4F4yDFUslgDwoAqJsklrWLSp8nX1XeqSqWTTq017aDEVlZx/cmPI4NdCD+OeAWV/0XDx9WZvWWGN+DdfbcYxqZCD+7PiCeEooDQiDHIL0CAO/N9vZ5Tke5SNxbVxcLGfDjXK9usk6AUhAwymrR0Hi3EmoyEqkomvPrSOjXsnGwXx1dueC99216tP6Kl5UbfTLSQ5YuemmL5qqIba2Ks/S+1Pa5HUkOc0rbnRFpgf6SqrFh3TN3WWQlRL12hV5GLN+EdUHXHsZJ9Y0S5iv6Oq1amHGdHq147WAXL9X6/G2ckkAklsVhkv/E66ykcaQrYqHqG03ojprFl1SS5M6asWI92jITJAbMcZvZ+8KBmi8ELnP3NMwRpXjPlWM603nYuHEdMzyBQu3bDj/GnWm/G4herfYScv+vJFfPCrIVthrnP62uaHwjscRtaIdSJFgAKO/QqxmL4GrlpulP1YEr3CdP24uKYriRmv3xhBmP1LcL4nI7suoZHVLldEQ4YahtOiBpKSrLJiyx5dK88n0RI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR12MB8701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261009223027099003)(18002099003)(22082099003)(261026140227099003)(261021121427099003)(261102123227099003)(261028144727099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xRS0RTZzlXcnFXeHcyZmNIS1F2K0EwaTRrSG5SdFNMZUs5Z21ZeUxwQmVP?=
 =?utf-8?B?S0hoVVBhTEVGSTdiaTlrdnkvRENpdXpEOXhuU0drN1NkYk5yRnJpeFg3bDFj?=
 =?utf-8?B?WnQ2SHJZMGR4dkdOd09QQXpwTkxic3hiclFuVHE3dWw5U09SRkNSYmVSTUgz?=
 =?utf-8?B?MlZlcHVGTXBLV3NUbFJqY2svOHl4MXVIcTgvSGh4ZE51Z3RsblV0OXZuK1lM?=
 =?utf-8?B?ZE0xTUJWVUhoN2VkYTU3RFdsdkdtNUtGV243MlozaExsQUkrTUpOcy8xbDVu?=
 =?utf-8?B?cnJlaVU0aXhDcXp5c1Y3SEpLeDhXN3E3RVV4dEtSUGdocUVpUlQxMUNtZmR3?=
 =?utf-8?B?SE5CYnh1MnJTOWQ5OFR1NEVic1ArR0FMSmR1Q0I2YlhVQlZ0UHo1SFo0QnJ1?=
 =?utf-8?B?VGIrWm4vT0xydmFrU2lHc2Q2WTlQb0t4M3N1KzA5anVkQUJ5SXNwdWRQWUJu?=
 =?utf-8?B?WTlyM3IreURVQVJHY2hyM0hPT1lTdkZHbzF0T2tUZHBXcFQ2cFZJeUFxZ016?=
 =?utf-8?B?dzdjMGI4VU1RS3BlUlViTzNuYWEzQ3pvRm82UXlGMDd0Mm43dFNscE44c1VP?=
 =?utf-8?B?a3d3R3F1ak9pMldxSFByelM1WkZ2S29kbTIyc3Y1dWdZY0JFd3lKRkUzL2ZR?=
 =?utf-8?B?QzRIUXVranFDZkZjSHp6QWpCUGJMQzB0c0orYktLM05pTVczQnA3T3FmNEhv?=
 =?utf-8?B?RmQ5bm9hT0VLNHE1aDhSa1V2S0VmMTlneXJKSEJUVkRmWG5CR3Q2NE1jTGJH?=
 =?utf-8?B?NE9uY2lmN0J3Z0RxWVhuVEtDeTFIQm1jMkhyTDhQMnZwTG02TlZ0bGpEVlZS?=
 =?utf-8?B?R2tCMGo0eTNJV2hQU0diR1Nhd25mdytnbC9Mb2VsR3BDcVJONm02Sm9QNi9t?=
 =?utf-8?B?OWVCRjVPNTlnU1FtYnd4bXRhNnV6bFZiekZtV2JJdUtGdVpzOTR0bVgxOVpP?=
 =?utf-8?B?KzRYbGlTV1FEd0p6WkNWZjF4MDZnY3U0NUlxakVibFhMUXp2M1FGNmlCcVJE?=
 =?utf-8?B?bDV1cjJXZi9XRWt0SjhCWVRZRC95d29DT1Z0T3J1Zk4wTXVVRjJsSjJ3MGNu?=
 =?utf-8?B?eVJxQmdMR1FGRDBnMFFhdnQyUDdGVlA4QWJNRVlOcWI0dDQrazhvZ3VaTm5L?=
 =?utf-8?B?R0R6Z2dGVzFyc3JaaFdMYjdXY1pnbVpKbHVSL01mNVI1bzFPdERzZkM5c0Rq?=
 =?utf-8?B?d3pFbEFQQm9qVEE4Q1BFaFQ3UGRsSzFEZFJBa3RYOGY3ZUk3UE00T0JuTjI4?=
 =?utf-8?B?OFIwaE9KRUNEMERqTlFtV2xiV0thZkJzQWFyLzlpbHQxeFFrQnhDYXZ5OGQr?=
 =?utf-8?B?Wm41VlJnazRNYUt6b3RPYVZoMzUxcEpENTV0NHpGZFR1dk1yTnhrMjRISHNi?=
 =?utf-8?B?SUNSQ2ZzT093Rll6enZjN3lhUGJrRVJLWWVNaS9Kc28wVCtsZ2haLzM3eFFR?=
 =?utf-8?B?QWNtRThxZ2tabTlkbHJxWmRydTNybXp1d3h4Y1B0ODVpTDhyMlg3ZGVlQ2cw?=
 =?utf-8?B?OVhtRTRnRnp6VHhpTlBGM2NmbzNKOTl6OWVEQ1dyeWY0MFJCalJRTnlReVRR?=
 =?utf-8?B?ck42QlFuSUM2RGFadTNPUkJUOVJ4YmcwYkRiRTcxeFpsN1g2T21rclpRck1N?=
 =?utf-8?B?d0Z1STc1aVJHSm1mdEZoNkpBSW5aUzdJbWNzc0FkaG9BbjFZWUJFL2dHZkFJ?=
 =?utf-8?B?cm1mREkvalFmVG1IVzdXOXBKMVAzUlBTaFhsS2xzMWczRWswSUJML2kvdkVl?=
 =?utf-8?B?R29oSFo3UFk1bVFITWVIWjZWMXBVK2RTU2dnWXgxV3lxaWM4azMxY1RhdUts?=
 =?utf-8?B?aVlXRGZUT2l4Y2dtelMwc3RzZkt3V1JOeHZ6Tk9SZ3REYlRzMktibVNGNEZP?=
 =?utf-8?B?WUVwMXp2NTBxRXRaRUczcktDR3FBMThja0VCdFhCbmlSbWZjbmRCVVYvRFRp?=
 =?utf-8?B?M3U3T0h2TEwxZWdKY0lHazZYa1dSQ29aUGo1SkYrNXJjWnExZFNKbndjM3Zt?=
 =?utf-8?B?cmt1TFh2NGhSRys4dXp6bm9HSmd6YTRnRHVkTUpxSXo3OG1kZnZzWmpsMk9L?=
 =?utf-8?B?YVdmMnNUdGI1emtIbmVXVmtyVnRkMHdIUUNJQURwNllVZnBuakkyOUR3b2tW?=
 =?utf-8?B?MnZCUHBES3V6LzNsZXdUemNVWVFNS3hVai8xUURpZHNFdHBtQjVzbi9Dekwv?=
 =?utf-8?B?ZlVYODRKMjkzbUZneFdtSUZsSEsrZVc4YkV6dWpJbGQ0Sk8wbnhmVWgranMw?=
 =?utf-8?B?b2ptQ2lBQU9YTWN3L1locHMrYXdqNC9RRXo3S1VVeTlzZmhleUN4SjNSWEp6?=
 =?utf-8?B?clhaczdmbTBoVG1OcWhKOGNJQTk1ZkpoUGFOTHptMms0VVZGekJrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2086bca-c131-45ab-de62-08df46166221
X-MS-Exchange-CrossTenant-AuthSource: CYYPR12MB8701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 08:23:26.3300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JAyFYUIGi3FdeL4rRIN61mfmvoHjFXYuuu1Bfw6jqwrLQHp8VpsevghUoBhiLjGVQHnTyKmubzqv6RyX4f9EIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/16/2026 4:12 PM, Ray Wu wrote:
> Most checks in amd_replay can never fail. Fix them one per patch.
> Tested on an eDP panel with FreeSync Replay: all four subtests pass.

Series is

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

Tom


>
> v3:
> - Drop the DPCD 0x378 error status check
>
> v2:
> - Split into separate patches, one fix per patch (Jani)
>
> Ray Wu (5):
>    tests/amdgpu/amd_replay: Read DPCD at the target offset
>    tests/amdgpu/amd_replay: Fix test_mode checks
>    tests/amdgpu/amd_replay: Fix inverted Replay state range checks
>    tests/amdgpu/amd_replay: Require REPLAY_STATE_3 after settle
>    tests/amdgpu/amd_replay: Fail on page flip errors
>
>   tests/amdgpu/amd_replay.c | 39 ++++++++++++---------------------------
>   1 file changed, 12 insertions(+), 27 deletions(-)
>
