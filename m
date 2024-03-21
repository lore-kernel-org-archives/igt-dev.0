Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB52DC54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 13:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A97810E94D;
	Thu, 21 Mar 2024 13:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KPZQj12a";
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C7710E94D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 13:56:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5EJ3pf0RfY+BjjfNZySjaAEVAEZPLpv+R0542Z0ggnywE6u/+H7PTbXimViobCDYOQdfYpZwOEEE9RnnbhNTTiiAHxSsRMlBLxECq00PPeolHd0JEHayXD5JreOTjycQRF+2Jo4RGUnU5htzxWaLEw4NX+V0ak7k7iQim1AdbZ0pDyhzKiuQUmVKNfHANLD/09mu6uVyCi4GJ1leimTHaeEPCRxD5T+mQXy+D0db1iNWrpv5FM7rVajhD+gqC8mgzIzQ8OH9Yfyap3xR5hQtEINIP+m+kNTFeHxew2t2EoLmSPY+vreA8VoEGvE9bLs8Xn8zAgMczHWdctLTQ6f+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWA3x+LRi9wpBqgZDgy3Yeyiw+qrOw9Q1BB+99m4jf4=;
 b=OZRZdPMUY9ux8qHYSarrAaAp7rMc8l6x2/TSI0nUHCejGs+apSa6lboXCJQNXcmZtYpj+snaeJUBeqUmdQet8o0XEZ6YJB6zAqqfXN8WfEjC+M7fUubwKtHuRVHWug1MJP3C8JWJXvzt6XpGD+eHer17ROYcgxMFn7sbKzMEcmDcDADDdpFiqPdjqTtBIMJ+ul2vhXxsXic8OFFKNy4Hs8AZX9LZMVVyBqauPs2M+ZMcLucwWIwyvu60c4D3n9ez/eecyI/Z8nOggltY6n13CcT2ygFMHBQSDpR21MKhzKrfiqSxnruMkFp9lsto1iGB5e5DYXrGB/pd9HCuXpfT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWA3x+LRi9wpBqgZDgy3Yeyiw+qrOw9Q1BB+99m4jf4=;
 b=KPZQj12aVswcm7yXSlhZF9rCLemVpGON9nfCeqV3OzB/0i6/G3iHU4msdmv9TGplr2v8mK2uOwtuwAhXB0++6UTtJUQhWQ+E5x9YW4jtvZXxR17K7WwhuXixPqJG/dAEF7FsDHfxPgore/pOIF4ZAAb1V3bd5lakP03aqyICmWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Thu, 21 Mar
 2024 13:56:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 13:56:18 +0000
Message-ID: <bbf73dfe-5043-4486-8e81-158f7204a9b7@amd.com>
Date: Thu, 21 Mar 2024 09:56:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] lib/amd: check output has hpd before trigger hotplug
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: rodrigo.siqueira@amd.com, hersenxs.wu@amd.com
References: <20240321020354.843729-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20240321020354.843729-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0430.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::13) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 659a302c-e1d4-4583-c5bf-08dc49aeae6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGrruFkBupa53TDN2zsoQeWWKskwiRkFyJKRRpOd1EknEFwSvgHQ1594X6dtA3e5Zz04l9ylbn7kDjsr7la+m1ynTcOdBFOz9sZUWtiTknQJxtHf/L0z8iEt0GaJ3VGwhAZpZixCsIAtjyZfuGh8zk70JYuymBAdtoA1z8YbIpZW22JLxtHMi0g85js84KY3fjSOiED2XUR9srdkjbG0rDWFaw8YhYAdZj5apzociD9C5odtNBixUdbmeukRGQY0rzvqC1LpRfjdWOG12PhACdF+Ub0FDtxDtZ8wabiBN14FXisb3LxglGpjC1tvCTN8fLvZ3+7uEx3udtwcuSLYRYQ+W//Rbo9QE619bs47oFDudQuzf1+Nyesxcfrobo4LEKlKRqoLKbDOqkG0bdfewu6sG0gjAPVDy5uCWMRvN9ZEFcTuW9cAPiVPhqK6iENvNF4OnTF0qhn/5DsYhH6LkTWBEFPeli613p+ZCz6vbmXImHbljTqNLei3wMbI7MNOQNRvIPwVwIAaWTd0zUB+KrNAh3E9rGKIjs5B4tL2XvFRKzRdrVV2B43pkZciFJibUu5vm8CZay1qG1DMZUu2HqRgPpKWUugrFxX5ObWLYVX7W3qw+z8FqS4T8qGigpXyvNi4WHgZcZOjxquqzwxdbW8+37TlD7KzR2pIEV8magM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE5QeWY0TmJ3Mm1wQ0NrZzdnOGVCYVZoSjZGcU5TMnZJbTkrVk4xeDFYYkxt?=
 =?utf-8?B?YlNwa2dPQWtXZFlaWVhNbDdSVE95R1FwTDduUHJsVVA1NEdFMU43blJLS2ti?=
 =?utf-8?B?S3ZaN2MwRXdNQXJkcXBiY1ZITkcyUTFQS1BBTndyVXF1OTMxTExGMTc0eDZO?=
 =?utf-8?B?eDZTb243Uk9uZkhsMFYwUytTbnJsblNkWUIzNUZSaHlCOGkwdWZpM2E4M0NM?=
 =?utf-8?B?M2pTQnFPWkpFcTlpTHRCNEZMbFhCU2N1eHRjK0lEeFRKU2VPdUY0OGd1aFVM?=
 =?utf-8?B?ajRlKzM0OU13QSs4LzRPZHdsdE9BZlBoNTNyT00weVFaM2d0VHdYSG95SWlV?=
 =?utf-8?B?enIxbkRMMngzNldkWVBIKzR2bVZXc3JYd2tBV01idG84ZnhzRlp6VjdGNWdv?=
 =?utf-8?B?T0s4SjRxVUc0eEZ0cnBSUm84ZXpoYnVOZnNWcnI4UEx4RHoxVDI1OE96Skoy?=
 =?utf-8?B?Q1V5QVFxenVjSHVseUNub20vUm0rSktOUGEycHI0RE10V0pPNGt4QnlsSkJX?=
 =?utf-8?B?aHdjMkI5NW0ySU0rWWo0LzREek50UldSOWpSUTh6RGVtQ1pqdVlGcFcxeDc1?=
 =?utf-8?B?NlQ4cjZMY3pMU3ZzaWxyQVloOVc1ZmxHVmk5dFBZcUEwM1BWeFRTaDgyVU10?=
 =?utf-8?B?U1hEU1h2dURwaXVGMUtIajlybHBaejhLMk83RzJ0bWpBd1dGUzdod1g2emJ2?=
 =?utf-8?B?QXk1d2dwK2I1MWlLemtiRFY2RU9hMUwycE5EdmZyZG41U3Q0azVpZUNaamZ3?=
 =?utf-8?B?dUVFY055Vm1NQTFCbUNNdGJmeXRSd2ZzNVFIL3dwdW9pTUZzd2xWWXJpOU52?=
 =?utf-8?B?dzdBSFZDMXZrTUg3RTVJRXdqMjFpRmhkb3JOQ0RXR2NmYWdKRGp1eHFLa3FE?=
 =?utf-8?B?cFMyWjEvdzJnTnlOU2NKNHhGVURGZ3REZkt6YVM4bW9Ia0xndFFDNkV2cUZy?=
 =?utf-8?B?OEUzZm9EUlZoTFR5a0dRMlplSm9UREFPK3AwVHhpT1lKS0o0TkYzL2xKeUVu?=
 =?utf-8?B?RFBCMTRJMlZMMGlGL1JLVHRhNC90bzU1TlVjRk0wS2NCZUpWZWFaZndRSkx0?=
 =?utf-8?B?U0xTMnIzK1BDN0w5bTlpalNObFB6a1ArUW1QNVNUVjZtdFVGTjZMa3IxWE1R?=
 =?utf-8?B?dXlBVTdXdGRjMGgrWFRHaTFsNFhSZXVCTXdTem0vOUZSOS9BZzNQczBxckpi?=
 =?utf-8?B?cWdPWks0SzF0cG85S0Z3NHBrb1NqNytJT3B5aGpXRHVpL1BPRTZKWWV3ZTFw?=
 =?utf-8?B?Umk4WVFUL1BTTlV1d01PVzdmYXB0UXRFaUpIeHU4MEladlJ4cWYrMnJNZUJD?=
 =?utf-8?B?K2NGYjg5aXZKeFBlNFZPNXhzVWxyeVZBUS9tY3FaR25wR3JrOVk1OGlKeEp5?=
 =?utf-8?B?RmhGQnNuaHlxV0t3M2VSZ3Z5NGNUbFArNGJtZG1Fa0M4WHR4a0ZMOWxCSTBI?=
 =?utf-8?B?VW9CZzc3L2wzUHYxVVhydWVmSnhBWk1IYVRUNDlLWnJvaHVSNmtSNk1qSHJZ?=
 =?utf-8?B?MjhWTWgvZlNIZ1VVQUFqaWg1dy9iRFJmOThUVGZRaE1qazRhNEZTMWg4bW9G?=
 =?utf-8?B?bHplcC9vN0hKR0JMZUQwRnBiQThxNlNKOHpsZjZ1b3E4ZU03c25peXZzZStU?=
 =?utf-8?B?bzJOZnlPRGkvaVUrTUF0QzlBaWtPK0p0TlY3eWlHdm1ERzdjWmxhaDdVcVFy?=
 =?utf-8?B?anZadE1tTGNJbDhxTGdaMG1UZlZLQVFOaERkWGlNdWZqa0NiTDFNdTNsT0dt?=
 =?utf-8?B?V0hGMWo2SnBoVTdSTkd6NVA3bE14MEVVa042dmZUQVVRV1VzK1BYRStoT1hj?=
 =?utf-8?B?R0gvcmdMN3I5T1FqYStjSXZtWVRHUExKekFZQjQ5TDFYVmY5WExRNEJlZHUv?=
 =?utf-8?B?dmZ6aTcvTmc0NVRoZ2k2TnhkVHpCNnc0eHdEQVkrRXVhNzREVFVnK0R1bGVx?=
 =?utf-8?B?UEZxLzVvSkFtV3RzYnRoMUJrRjBZcHRwUmdIalU2bjhFYUs5bHAvdVpOS0RV?=
 =?utf-8?B?OVg2d1NhS1AyK2ljWnpoelNuTFpYTGJFV2VCY1I0MWlvWGVYdTV3MEFUam5a?=
 =?utf-8?B?MWxYRzcyZ1BNUk84RExqS1dIdUpWKzRkVHpweWE1T1ArR3J3cjlnZjN5TnNP?=
 =?utf-8?Q?HiAZ07xF8nx6iIgrRGZFXrAg5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659a302c-e1d4-4583-c5bf-08dc49aeae6a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 13:56:18.1436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tknjv29ay/B+0rZvX68RSsIdrju7a3w0b46xeB6cgIwyT6oEg6hZFQ8eZYZxQ4+R1JeqlYGEEsGlv/TMA1AjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609
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

On 2024-03-20 22:03, Alex Hung wrote:
> With commit ff1d9a601 writeback connector will be enabled and it has no
> hotplug capability. As a result, this function always fails for such
> cases. This is fixed by checking HDP in advance.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  lib/igt_amd.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index d0b53c08a..623883dbc 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -799,6 +799,9 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
>          int wr_len;
>          const char *enable_hpd = "1";
>  
> +	if (!igt_amd_output_has_hpd(drm_fd, connector_name))
> +		return 0;
> +
>          fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>          igt_assert(fd >= 0);
>          hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);

