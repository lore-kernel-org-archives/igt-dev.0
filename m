Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DC3C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 18:08:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE81310E0CA;
	Thu, 10 Sep 2026 18:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uyPdaS9B";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD6610E0CA
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:07:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZeGBXbjfuK1U/oJJkrPN1/lMutefuIJr7BOPMpJg/CTjX43JfgcD58H6fCboFfmiRpWiCih1832pdcD0xdrdBU3OaCDzvLap2rqSZeUL6J7KM513kEtnV7pTQc7u7NgnxbwtcadiIXBX+iWPIlqIzbuBFpZ1TOq8xPgAzxJN9xz45c76+a4aLx8lBK2AiSpJ6vdVqhjaXXkWJVeNatSt5vv/0A62V5T5XUmxcr8X3QBmulJPQEQVSaGa1E9eyBJiKTvh+oAtVJo4tr9PFv111Q+h61MLYlEhabxIuS6CqhdnRqAHcxAaUS4vILsG9p71HpkwIkRyk473kqBPO/E1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPSpsE94IlWz6a3wcmjQhJL/qc0epKSTPr9f9c7CvRo=;
 b=Rt/D0YWXadNtfGvCsyDlrNcIjxyLjrymwdM5C+LTu4VPwtylVLe6/TEUx/9qqRGTcaFllc28+C5Fskc1svSffFQqm+elSQWRcMMlgNEjufDXpAj+5w9YZwqb2qy3XqaNvXhkZKxCNU9Ufmyb5N3lz3G6Dd08CfIxRjhj7vjCyixyWFqWecRPAqK4SWEs+F6sdJsMpYYOUrgxMzNzb25KgMRtGu9rZQ8sYWg7n9IGZDvbel40e+8UO29HQT/VMG2GAHbB4V0QS0yIvj6hCsusWl2GFt0rL9RPRx6n7CgJ2Lc/Umd9t5s10GjuLQKerwVoVOnWXg7pdZl3nWttUD7d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPSpsE94IlWz6a3wcmjQhJL/qc0epKSTPr9f9c7CvRo=;
 b=uyPdaS9BAKbRZsaeeFW4YPSJHiXBi6J7WkRAKw68jlJcoi+Trgc9XvOaNdZJN/RUtsmH1YwVrfJI/eITBqHJYEXpceziqF/l8+WhDQALOkJshDK7rm6F96sqqwRy8rhVWzW23E/iqQ97yXxO4k4QGMSlYixnLYfKO0FXaSThJmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 18:07:52 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 18:07:50 +0000
Message-ID: <d93a23d9-d399-4ed2-8ba2-445573817f15@amd.com>
Date: Thu, 10 Sep 2026 14:07:47 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_amd: improve link_settings parser for old
 kernel compatibility
To: Roman.Li@amd.com, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com
References: <20260909204408.936021-1-Roman.Li@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260909204408.936021-1-Roman.Li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0469.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::7) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e5eaa15-f664-444e-eb11-08df0f666d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|6133799003|18002099003|11063799006|56012099006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 7c65geTZHPTiJLZ87P8XMJ56BUpPvSqurq+qDo93FfvTVAncUB+/9LP23ae7txI+8J4P0okfBhx48XPdbwVBbFBwnoFxbm4qgvVkJYk6LHbLPXCZH0ceYPiLDwdWEFmh9jnZqdswqKSGFMqklCqU5etqvVhUcdFn7tDyrqxvBv8arWSr2XPFEnOXDkLXqkbn1T9H8jSLZb9SkclbsRPOf1UnjLazJOagmk1jymxR5LEqjn1rrzBpHOPEMwcR4lSjF1vNwfu+V2kNrJWeaJbketli+mkkKAxsbf1U3mLNRRIadaC+eJhiH2aRaMlOmtKwuoW137Ru1JYqn6jkn9zh5zYnjx+Q7M4Yz42UE1SxjjmCm71X8pcLDHEKRwoHRImueJxXwNeEFdyel4iB2PYN5Tdty0xrSIBlF6r3IirlsMikbT9JquiQm65/ytfrYlthfTDfJZaiunJD88itYUXpPCVCrqh9OkD+3lM70eQiLE57pk4pjGvGedG99d84WhVYIl+54yf4KLHh2z0HtFEa7jxjFZOerKFJN7NQMibiFDVrUbHOTDBR+uQ53pQtOQQ8I/kJ8RPTwIp4KESClds/SYRO9E7JDlOfWAUTwcwuKqQd8/cURLsjEt9fkRTeOUGtTa+kowV9mlmP01LfRDNqh/yX4U5+H7fDa81IB4bEaHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(18002099003)(11063799006)(56012099006)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTZTVFovLzNvaksrQURNUDhYNUhVVTZMQjgwUXJEUzlHSE1TWkJ0VUZUbFpR?=
 =?utf-8?B?dm5YS1RLSlowQldvcFY5U1p3VW9zOHpqaXhMZXVpdU5NcEFIRjIyWm9KOE10?=
 =?utf-8?B?cWI3cHJEclRQZEMyQ0hPUVhhaE1aNHZkYWRWdytDOEZFV011Y1hMQWtxNEJl?=
 =?utf-8?B?TjR4cVZiZGtwZ0NEMndvbXhIRnFsaURuSWE3aVM0UnFMcnpYV2pFV1EvSWZ3?=
 =?utf-8?B?UjdoeUdOSWkvZUJreFRwNWlYN2dsSDd0VkxjSDNFbHdtVVEvR2dTV1JoYjhF?=
 =?utf-8?B?dVZzS2ZSYW43K2d6QUNBTnhFOWZjT3BoNkg5SVVZamYwQ1M4YW5tdStINm5y?=
 =?utf-8?B?cThSL0VFTmVyT0psNXVRTlZRZWFMMzhvZ3poK3lpeVpDYktacXZ6cG9MNTNp?=
 =?utf-8?B?R1ljMHlUUFY0c1V3aThwWWdldmtEK25kVFdSMk5IaVpqOVV4b1g3ZHA2VlBy?=
 =?utf-8?B?NUtXQ0kyUW11K1lLRGVLZ05uQ3RZdUswMG0vdnk2YzR6WFJkajduQWF3d3Vs?=
 =?utf-8?B?dEdhQXBkQ0lnbVcwVjhwSjFkcERySXpwOGJnUncwWmIycGZwSThPcEl0Tklo?=
 =?utf-8?B?R3dHaUhJa2FnMHhSRFdRbnN1MlZvWGhPbW9tMHlnMmExeUM3T3czQnpaWm1a?=
 =?utf-8?B?SFJjTTJPZjArNXBBUVloaWxnL3A5Q1Q2RTNvTUxoc1RGZWJoRGVjMHBUYVQ4?=
 =?utf-8?B?aFVKQjFCYXBJTkxtQXd2SlZPbnFUUG9vZWFHOW8vVTNZaW0yQ0xmc1JmWFhw?=
 =?utf-8?B?MTJQVEpTNFJQMW4rb0lrTHorS3pwVDlKdUZnVXdJZnN0cEo0ODlWK0pxNTM2?=
 =?utf-8?B?YThxbGhIQ0pMOXVCbXAwd3dLY294RnlXVzJ2dmorQjdYelF5TWZOL0Jlcm5X?=
 =?utf-8?B?ZDRPN3E2ZU5KeHAvM2NKV3BWUDF4K2oxZm1NRUczZ2MyMlZYUEt6RzhxWUIv?=
 =?utf-8?B?NTAvYW80N1BYa2NqWUptVWIzeWpJWlpNSStuRXVKSC9CVThRalNjK1NBYWNu?=
 =?utf-8?B?WVBxZm1wSGd4Y2k2NkxtcEZaQU00UnF2RDBkeklyQ2M5bXNadm1jY0N1Zyts?=
 =?utf-8?B?VGdZakNFNGdVYjNvVVFCZzZvQmxvdjlZdDh4dmprNUdvWDRUc0p0ZWJxam00?=
 =?utf-8?B?dWJDcEF5UDBCVEttZ2draEhXRmVRTW41N2hoZ1QySGdtTjNZQWREcDNnTTky?=
 =?utf-8?B?b21tdDJJT3NqeElBcEpnNlZTYTJQbSsvVDdoQWRnZ2xEdS9zVG1XYXZCQmVM?=
 =?utf-8?B?Sm1Hb0JNTnZXVlhIb256akpXcU96WStNS200WjY3QjB0dTl6dlk4OTJEV1Ry?=
 =?utf-8?B?ZU9QbWZEMkVmTnRVYWlkVVVJNU5HUlNBT0JNMit4eENMNkgyOGEvTStKSHN5?=
 =?utf-8?B?MDB6VGhDc0I1d3k2MkRXNy9wTTMwWUNvcWEzcnpyaFpKSFozNUsyNmk2aHpN?=
 =?utf-8?B?ckZ4WjFsZUdwd1J0d2QyRmM1UkhDV3ZkVzVubnRCNXNBMFlJODY3YWFuSFRq?=
 =?utf-8?B?Nktna2Zqcitxdi9HcXNFN0VrWklxSDc4dThEaHc2dXg1T21KdmI2ZkxWUDdn?=
 =?utf-8?B?SDBTY3VBQWdXSkVFaC95OWZrdjRkNEZ2eFhKN1BJeUI5SXhsTnlvQlpRbmhw?=
 =?utf-8?B?QXAwNHNMWmh6aHdFKy9Ub2ZUUzlibDRJeUxONTU1WTlwejgvUzJSRll1MWI1?=
 =?utf-8?B?WnlrU1FrbFZub0FEZk1kU0FTOUtkOGRVQTJrUWE5dEVOQ1NUUExTMENCZlZk?=
 =?utf-8?B?L013M3JvSjdpK2N1bzhlOCtXRWZPNUFxUTcyelltL1kxT09QVEMxbnlLaEgy?=
 =?utf-8?B?TXR1dVRqUHY3Qm1TdWJyVDN2RHVvUHYzTi9ZOWNNK1JHNldhWDNOQ1ZxSnhT?=
 =?utf-8?B?QmszamxTNGtxeFNiNzFqUVhxNjlKV3A5R055ZEw2ZGIxb1JUOHIzMzRkT1Bh?=
 =?utf-8?B?TlZ3ZDZlUWc1aldJRC9YNm56YU9RbjdBcVdMYUNFcFpzSjNmSWFVUlJjbVpw?=
 =?utf-8?B?ZmJVVFJIL0VxeTlTRVhBaHFMQlpjVC9xa3dyOWo2Ri9mK3VKZnB4YUdSc2c3?=
 =?utf-8?B?b2xya3oyaldtYURQSUdhN2paNis2THY4aGlFTW03enVOdVJscGc4ZW1Jb3Nw?=
 =?utf-8?B?TjlnbVFhb2E2Tm1GaXM0RGM2cjFJWUlZZHZxRFFOMnZHK1pvRWY4R3picS9i?=
 =?utf-8?B?alAwUGt2bUtRejhxb2k2aU9iMzh2OC95RGNDSzJaVzBySVJ2T1cvdk5xS2xq?=
 =?utf-8?B?dERFZzJuWHVjRVlxTTlNYzhUWGhBQUtTUDdqVklzM05iUWtlOHhzSW01MzhW?=
 =?utf-8?B?SnArdi9ZSnlLcDRtWTBDY3VTbVJoUTZhQVNNMDV4aHlxekZCeEJVZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5eaa15-f664-444e-eb11-08df0f666d4c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 18:07:50.6680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfmLce/wNPo7y996BdprWCLlrh/UwFNVKPhkBwNjRFgdjRRCKUpuZvCp4fO82nMShfI4OHezIJys19MdXYttug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999
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



On 2026-09-09 16:44, Roman.Li@amd.com wrote:
> From: Roman Li <Roman.Li@amd.com>
> 
> The previous fix uses strstr() to locate each record label. However,
> strstr() stops at the first NUL byte (C string semantics), which breaks
> backward compatibility with old kernels that embed NUL bytes between
> records. Only the Current record would parse, leaving Verified, Reported,
> and Preferred unset (0), causing the same failure as the original bug.
> 
> Use memmem() instead to search the raw buffer across NUL boundaries,
> combined with sscanf() for parsing. This works with both:
>   - Old kernels: with embedded NUL separators
>   - New kernels: with contiguous single string
> 
> Also replace hardcoded loop bound '4' with ARRAY_SIZE(labels) for
> better maintainability.
> 
> Tested on eDP with both kernel variants: amd_ilr passes in both cases.
> 
> Fixes: f234bbd294f5 ("lib/igt_amd: don't rely on NUL separators parsing link_settings")
> Cc: Harry Wentland <harry.wentland@amd.com>
> Assisted-by: Claude Haiku 4.5
> Signed-off-by: Roman Li <Roman.Li@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  lib/igt_amd.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 7d33ab658..ba1cfabcf 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -836,10 +836,8 @@ void igt_amd_read_link_settings(
>  	static const char * const labels[] = {
>  		"Current:", "Verified:", "Reported:", "Preferred:"
>  	};
> -	int fd, ret;
> +	int fd, ret, i;
>  	char buf[101];
> -	char *ptr;
> -	int i;
>  
>  	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
>  	if (fd < 0) {
> @@ -853,22 +851,29 @@ void igt_amd_read_link_settings(
>  
>  	close(fd);
>  
> -	/* The debugfs node returns a single NUL-terminated string of the form:
> +	/* The debugfs node returns a string of the form:
>  	 *   "Current:  %d  0x%x  %d  Verified:  %d  0x%x  %d  "
>  	 *   "Reported:  %d  0x%x  %d  Preferred:  %d  0x%x  %d\n"
> -	 * Locate each label and parse the three values that follow it. Do not
> -	 * rely on embedded NUL bytes (or any other delimiter) between records,
> -	 * as the kernel emits a single contiguous string. */
> -	ptr = buf;
> -	for (i = 0; i < 4; i++) {
> -		ptr = strstr(ptr, labels[i]);
> -		if (ptr == NULL)
> +	 * Old kernels embed NUL bytes between records; new kernels emit a
> +	 * contiguous string. Use memmem() to locate each label across NUL
> +	 * boundaries and sscanf() to parse values, so both layouts work.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(labels); i++) {
> +		const char *label = labels[i];
> +		char *rec = memmem(buf, ret, label, strlen(label));
> +		unsigned int rate;
> +		int lanes, spread;
> +
> +		if (!rec)
> +			break;
> +
> +		if (sscanf(rec + strlen(label), "%d %x %d",
> +			   &lanes, &rate, &spread) != 3)
>  			break;
>  
> -		ptr += strlen(labels[i]);
> -		lane_count[i] = strtol(ptr, &ptr, 10);
> -		link_rate[i] = strtol(ptr, &ptr, 16);
> -		link_spread[i] = strtol(ptr, &ptr, 10);
> +		lane_count[i] = lanes;
> +		link_rate[i] = rate;
> +		link_spread[i] = spread;
>  	}
>  }
>  

