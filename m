Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB09CC54FD2
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 09:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95ACD10EE34;
	Thu, 30 Jul 2026 09:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCEG72Rl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8B010EE34
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785404258; x=1816940258;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=aiCc5KWjWopr1dm2whCApzOLVA4z2eKq/wIlNJ+iQbw=;
 b=RCEG72Rl9ldJV2xkXF0pwbfl/qVjXZuo60gPBndeQIbYuE78QG6KtXq8
 4dE8xKJmaupGAFl679f42cdBrpYz/Gt72ulvvZhNRyDRrlZVEDF8ycUzd
 A+iyL++zBJD4EiTW3iNEpcT0wPiuuZhKDdU94/swSnKDUmcBK6OEIoz+X
 GA0/7kJdrS+ZHwoMf+gBz3bA1RZocvmx3sJ4swtKgCAe9mdJlNSQGxw8l
 MB1pVN7EMLfDUB38RiIIYABmLxGkfNeD+PB+rP5fJ3J5RrZm2LSLw1BOS
 E1exGgKC4Kt4ojKimPuUXkGp31vUS/k+bAhW2w7hMuKhNk0txR/zSepbq g==;
X-CSE-ConnectionGUID: gSsd/Mk+S6inVQjkG1s0HQ==
X-CSE-MsgGUID: xa94DZ/CTm+sanDDz6VNyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96680929"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208,217";a="96680929"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:37:37 -0700
X-CSE-ConnectionGUID: JWV3kFkCSEO2VONzpulW5Q==
X-CSE-MsgGUID: tHgFX0a0T0im5axTJGZW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
 d="scan'208,217";a="284827378"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 02:37:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 02:37:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 02:37:36 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 02:37:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAwVsk6OeWxC/C5caP17YlNkllxvryyw/w1Q6zloYtiiv7EArDFECChGtj55TbRmA04/TDZJEklSlZGOinXWn+UCjGcw2J+e9VDvQv7tJNrlBeJd5vXncqmhL+DTmQlTXGs/687GcvDDCKbLR5eNmaZyaIiGNh/nina4TGYXIADIfoK2uomo/t9PjEELBNcs7MrSEy35TqRVFe0LvyGtWD2BYP44SJhJqUzWJ9Tez9PMTXX2O4xePy9HzbkGHCS46DPgklrH92KxMJkfuguync48P8ciP6NUyu+SErG12syMzLVjTwp5WRwvJn8jfPXeJ/Tyen48vNmCmXqktX02Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfqu5UPCnEHg1DmxuUoYAvpNsb9kqx0uJWY8f6FWzRI=;
 b=JOv8m/rg/TwUSbu7LZy0HewSjummxuAIwZfi++O8/O1F9N1Geyt/r9LLMAGvBl9a9TBdn/0/On+KasQjBv9Xs2yzqFHQ7w4l3tvxMjBdWopVE1xGuXyFQl3jj+hDiMrcowOcaoJxNrHtvBFg+CPwAUE7LVo6PFMur8lQhUtJ/wo8H7LDYbiwdFC4HuFLmClON2heJCI0aBVPT8g25+krUSigKxV0Qgx2iX3fvm1IJRx/Clip0l0WKhGuyXJ3Z3oaHC88A68a0xvF0XaSDw0B3x8Ty9aylFAFZvItyfza07TX7OqEwDxzvcphTBKp6pqEGfCMXKgNlpDhjq+7upo8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 09:37:32 +0000
Received: from SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611]) by SJ0PR11MB4926.namprd11.prod.outlook.com
 ([fe80::50b8:e73:5783:b611%5]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 09:37:32 +0000
Content-Type: multipart/alternative;
 boundary="------------CvZwitXTqKvHKa9etl0PxSXI"
Message-ID: <ee9ffee3-8eb4-44d6-bddc-a53f351634a1@intel.com>
Date: Thu, 30 Jul 2026 15:07:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 09/16] tests/kms_vblank: split outer test loop
 into two
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
 <20260713085515.463575-10-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260713085515.463575-10-michal.grzelak@intel.com>
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To SJ0PR11MB4926.namprd11.prod.outlook.com
 (2603:10b6:a03:2d7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4926:EE_|IA1PR11MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: 570cbb66-2076-4f5a-f62a-08deee1e2db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|3023799007|8096899003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: scKw3pRBtDn5Mk8KCIOcLu4MNGAzzce21bn8/j2kJFLUV8EAugXYkjCqegxoisE8qb++/8ys8jcX0eOtyhDS/PYX0+edi4URf3dHDXnLK/PqxYCXAGREsbjejuiseU0N0+DpbWqfJffA35MpgCGcSyHTqQQcAXOtHHaabRcF56x+EaCkGv1fm6FrM5X8Edp7xndGLc0AImfxI8I/pRYJt5KnXTKiWDcqGZXl0Xiyx6kKqZX5tAVMSxyz+4JWGrhHpaswWtxUdkYOpW5YhOHGCyX2mASjO0QGOxxGZAad5x0v3IwKoPV1zI0/mmt1jHsuA/Dbtfc6vE0//btUBUvwMJo4WWPAN+sk+exzUUNOf0xoORM5GDBL/Vg46SJNU+GO1yuQT5lMINWOLseaaR7X+FbzrRnxi9POvghqecH6Hi7oWkJnDUCUXeEEsYwnRsLPv5fnUfh1HvRJVZpUVGbqJoTFqnHW5jaBDD8KRsMvblXm2LQvZNvJ5/CbaN8rRhs5/IPEwC3Y18fiImtBfoBb7olVM8FeVhIlsRVBQrgaGIF4kSF4jm38QW21cAv1fA9Vl1Oimts9pGAaTzTdalFuE8MO2mUM+ucfTiVOuTBiDG+sogbF/V+WMeVebpuO7iCs8bOKr6iIcyxZ8ymYANFcBAIh90fqiTxhHJ5w9AtoVtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4926.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(3023799007)(8096899003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzM5bzNqQnp6Z0wwaFhNenpMVnkwWkpLTzBQN2JFQkR3NHpXZ3Ezc2pwclE4?=
 =?utf-8?B?MlJlTnZ2dktObnVLckVzQ3JOeE1FSFNmR2dKZWhrdEI0RVNwcGxnaVZGRi9I?=
 =?utf-8?B?S3E2RjV4c0t4OER3NzVNVlRuVXRtTzZtU1IzWXhEbVV6MWZ4M21YMkswcmVU?=
 =?utf-8?B?UXBmMFg4TnhVcDBqMkpncStXQ2ZiQ25rVUF3WE95WHhvVFpRSGx4MzY5WjR2?=
 =?utf-8?B?RXg5VnFUdFErb3dKT1dOc0VScUtJNHozd1RtcldyaWhFTml0dks3aWN3TmNP?=
 =?utf-8?B?OWsvcyt0UEJYc05RWk9SS0JaSHA5U1ZuTFNLcDhlL3BYVU9Ba2R3N1ZoSk93?=
 =?utf-8?B?ZE9FbFRXR1NqNWFMb2ZZY3FtMTRqTkQ0aml5YU16OHBZTjdIVE5JRzhmZGZR?=
 =?utf-8?B?Y2NsZnJseHdPL21WRHJGVUxuOXd4alY3UytoOFZSdjVNR0hoc2prNUU4bDhF?=
 =?utf-8?B?YkRhVUFyZ1pCSmJ2V0tsRnF6T0Q5NW1EQk5oOXBoZXMwTHpKK0VSN1oxWU9v?=
 =?utf-8?B?bEdMcE9yYXNMSlB4Z0dXMVYrVGt3eUlQd0N5cFF6MDR2VE9Ja2RkSks3Wm1j?=
 =?utf-8?B?RGRwaFpsbW05WWVPRVU5UFFidTNWY2lJK2lvNnBSWUx6ZVArL1c3ZWVlS0Jq?=
 =?utf-8?B?RHdiZ0cyRHpyTUJ4VTI4M0wyNVZiaThEeWlmeExEaDFLdGR2ajNrUFd1Q3Nh?=
 =?utf-8?B?OWRZU28xcHloWTJJaHRReHJBMU1FLzdRZTF4VExaemxsOW8waC82WVJkRlRx?=
 =?utf-8?B?a0JBSHBLZ09HQWppeUthNVZxSlh2NU5jdTdxMkI4TGdFb0x6TERTakFVZGpp?=
 =?utf-8?B?Ui93VkU5TlU1a2tiR3QxVU5pSVphVjNSVHgrOW93QWduRGxPcXphTWxwQ05r?=
 =?utf-8?B?WG4wTGxHaEVaeHBwWUdpakpYZnBsNkNtQldzM0ZiWkRKdXJOSndqRk8rSUIy?=
 =?utf-8?B?cFhMeGVGWExvQjhGMEFEY3oweW5zWnVtSFFBMThGb2ZRaktoWTA5VFUxa1gx?=
 =?utf-8?B?MVlZdkdmbnA1ODZlaWoxQUk3amtYSEVRK21QT0FFN1JKVmZQa3ZrVm9QRDNH?=
 =?utf-8?B?dm04elBlTjBpS2VlZzBWUGhxSnVPU0ZycjRVNmxyakJlRHp6UktCenh4K1F6?=
 =?utf-8?B?U2laakYyRzRHTVpkVkVQOStDWG1FbWdTTmFSR1hJbnpjeU85Y0xvalpKbkpE?=
 =?utf-8?B?dXc3aDJkY2orTlg5NmN4M2VaSThzNDBDRUNaSFh0NmZZZmdBVk40Vk8yaFo0?=
 =?utf-8?B?bVpGRmpkS2FXMloycGlKRCtqOFJ5QXEwZXlLZjdBYk02WDJtbXd1T09iQVFv?=
 =?utf-8?B?SFJ1QmZubHpQdGtDNWF2N1J5cWRWYk1TaFc4Nk9zWERwcHNaVURCak4xRks1?=
 =?utf-8?B?bWV4WEg5aXNDZEw3Rk9Mcms0MjFUZGwxU2pqTWlwOXlxb2NIV1VpZzdrQkFQ?=
 =?utf-8?B?dzFpQlpZWkNXWC9jcnpQVy9uVGhsUHRzTVRrRGhHdUtJc1E3NmlYVUlTU2FJ?=
 =?utf-8?B?ZnlnZEloMi91Tmt6bmpmM1JxeGV0SlAxdEtybmc0YWlzUnVXM1dBRHhGc0Nm?=
 =?utf-8?B?VXIwb1FMaW9HcldXOEZpSUh1YXdmWHpzMzlHRFB5YWJxL0h0S3RocnhlV1hY?=
 =?utf-8?B?SThBUlg4a3dkOHBhbjl2NWxMd1NrS2wrSVNBRk0xQ05CV3NGcnNaSW9Id09j?=
 =?utf-8?B?Ynh5NG9VVWZXRGtvZWJHcEpPYkZuZ2xxcFVRZ2dieWpacFFWVVZzdlBSNWVO?=
 =?utf-8?B?WmgvNkxXbjNlNzlMcUZRMTA5SXlaWk9uNWJXRzNYRVlIYUFsKzc5d1AzdVMy?=
 =?utf-8?B?OWh3dE9TWUp3bFp3YUtjUVJpSzl1bFRSbFNoRWRpRnFRdnRUZFZFMWx3Snp3?=
 =?utf-8?B?N2F3NTBJTjU0cUNjNDdmUWdJbXMyMy82K0tqT3dldzBsaW5naktmTU8zSXU0?=
 =?utf-8?B?Y3U2dFoyUk1OeDdSUFQ5cG5vSEphQ1R1cGUraFk4MjhKZFl0dXdGazVXZlhu?=
 =?utf-8?B?VzNiL0ZnR2M5eUk2YkY0SzNtR2I3NG1zZ2RvcFBMZnd2eVBFRmZ2RjhadGRy?=
 =?utf-8?B?ZFo0cjhhS2loM3JWSDFYaU5YdTFSQy9aczdUUXFUYU5xZTROS1JkZkFQOFdD?=
 =?utf-8?B?M3dUZFFvNkJPa3lMMUFzV1VIckZ2STRDSjhlNDU2Wm53SjRrQlBZQXlSVTVN?=
 =?utf-8?B?VlZpb3I0bTBPVEp4REkzbGlaS1NYRmFOUGxjUnFhcVlQTzFnM3hjTllkOTgr?=
 =?utf-8?B?MzJhRzEyeUpiV1RNRFZRUTE4dXdoVThmcVZ3QzBRUTlCQWNxWjNoeFBKSEpB?=
 =?utf-8?B?bEkyYlZiUzFOa0lvam5HR09FajJVSUxqcHFpWTlhQ0lybmhsRVA4NVpBeHMv?=
 =?utf-8?Q?Csaz6zwUpqq1CFps=3D?=
X-Exchange-RoutingPolicyChecked: OmgjXo7H2xEYWxsvzwM7Ct/etEoWHJgqe93Et/6ipXf3nsVhDf0p2HF1HqxljcGizcBQV8b2NM3ignHhfnxjpQiCxf6chtn2YiboUbN+/8+Cr5kw+3G2Dc2qlPdXcolsTm6VMA8zArynmnrIswCahV7vaFB+4HnJ/joscfcVIYMDE4jKBEVfruNHH44aDVlVoz3B8cR0dgafCsHxT1/UIPN7ybbaagrFpmvSGeWxkXJDaMOBZb7jnD1ustfSvap6iwkYiRRq09v42+BgATszaT54WMwwArwr7303kDNv1RQJHhJZ4vBu0jOxvH3LCTpbJFsKfUF7TxCVwjvZHgcKPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 570cbb66-2076-4f5a-f62a-08deee1e2db5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4926.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 09:37:31.9950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8nkLv4SgZxPFqHbJD4HiLmFKmrAjEQZ6VHCiDjh3xpa7z2xgHfdehRhL0Hn7VN7pBcoiOAu2DDNJ72NncFG4c43NAKpDawf6Ox5OxXEXME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
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

--------------CvZwitXTqKvHKa9etl0PxSXI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 13-07-2026 02:25 pm, Michał Grzelak wrote:
> for_each_crtc_with_valid_output() iterates over every crtc with
> connected output. Split it into two loops. This is needed to handle
> cases per output.
>
> Signed-off-by: Michał Grzelak<michal.grzelak@intel.com>

LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> ---
>   tests/kms_vblank.c | 41 ++++++++++++++++++++++-------------------
>   1 file changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 7fb7de0a70..47b733af15 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -515,25 +515,28 @@ static void run_subtests(data_t *data)
>   
>   			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
>   			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
> -				for_each_crtc_with_valid_output(&data->display,
> -								crtc,
> -								data->output) {
> -					data->crtc = crtc;
> -					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
> -						continue;
> -
> -					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
> -					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
> -						igt_info("Skipping pipe %s\n",
> -							 igt_crtc_name(crtc));
> -						continue;
> -					}
> -
> -					igt_dynamic_f("pipe-%s-%s",
> -						      igt_crtc_name(crtc),
> -						      data->output->name) {
> -						data->flags = m->flags | NOHANG;
> -						run_test(data, f->func);
> +				for_each_connected_output(&data->display, data->output) {
> +					for_each_crtc(&data->display, crtc) {
> +						if(!igt_crtc_connector_valid(crtc, data->output))
> +							continue;
> +
> +						data->crtc = crtc;
> +						if (!crtc_output_combo_valid(&data->display, crtc, data->output))
> +							continue;
> +
> +						if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
> +						    crtc->crtc_index != active_crtcs[last_crtc_index]) {
> +							igt_info("Skipping pipe %s\n",
> +								 igt_crtc_name(crtc));
> +							continue;
> +						}
> +
> +						igt_dynamic_f("pipe-%s-%s",
> +							      igt_crtc_name(crtc),
> +							      data->output->name) {
> +							data->flags = m->flags | NOHANG;
> +							run_test(data, f->func);
> +						}
>   					}
>   				}
>   			}
--------------CvZwitXTqKvHKa9etl0PxSXI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 13-07-2026 02:25 pm, Michał Grzelak
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260713085515.463575-10-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">for_each_crtc_with_valid_output() iterates over every crtc with
connected output. Split it into two loops. This is needed to handle
cases per output.

Signed-off-by: Michał Grzelak <a class="moz-txt-link-rfc2396E" href="mailto:michal.grzelak@intel.com">&lt;michal.grzelak@intel.com&gt;</a></pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre"><span style="white-space: normal">LGTM:</span></pre>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:20260713085515.463575-10-michal.grzelak@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 tests/kms_vblank.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 7fb7de0a70..47b733af15 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -515,25 +515,28 @@ static void run_subtests(data_t *data)
 
 			igt_describe(&quot;Check if test run while hanging by introducing NOHANG flag.&quot;);
 			igt_subtest_with_dynamic_f(&quot;%s-%s&quot;, f-&gt;name, m-&gt;name) {
-				for_each_crtc_with_valid_output(&amp;data-&gt;display,
-								crtc,
-								data-&gt;output) {
-					data-&gt;crtc = crtc;
-					if (!crtc_output_combo_valid(&amp;data-&gt;display, crtc, data-&gt;output))
-						continue;
-
-					if (!all_pipes &amp;&amp; crtc-&gt;crtc_index != active_crtcs[0] &amp;&amp;
-					    crtc-&gt;crtc_index != active_crtcs[last_crtc_index]) {
-						igt_info(&quot;Skipping pipe %s\n&quot;,
-							 igt_crtc_name(crtc));
-						continue;
-					}
-
-					igt_dynamic_f(&quot;pipe-%s-%s&quot;,
-						      igt_crtc_name(crtc),
-						      data-&gt;output-&gt;name) {
-						data-&gt;flags = m-&gt;flags | NOHANG;
-						run_test(data, f-&gt;func);
+				for_each_connected_output(&amp;data-&gt;display, data-&gt;output) {
+					for_each_crtc(&amp;data-&gt;display, crtc) {
+						if(!igt_crtc_connector_valid(crtc, data-&gt;output))
+							continue;
+
+						data-&gt;crtc = crtc;
+						if (!crtc_output_combo_valid(&amp;data-&gt;display, crtc, data-&gt;output))
+							continue;
+
+						if (!all_pipes &amp;&amp; crtc-&gt;crtc_index != active_crtcs[0] &amp;&amp;
+						    crtc-&gt;crtc_index != active_crtcs[last_crtc_index]) {
+							igt_info(&quot;Skipping pipe %s\n&quot;,
+								 igt_crtc_name(crtc));
+							continue;
+						}
+
+						igt_dynamic_f(&quot;pipe-%s-%s&quot;,
+							      igt_crtc_name(crtc),
+							      data-&gt;output-&gt;name) {
+							data-&gt;flags = m-&gt;flags | NOHANG;
+							run_test(data, f-&gt;func);
+						}
 					}
 				}
 			}
</pre>
    </blockquote>
  </body>
</html>

--------------CvZwitXTqKvHKa9etl0PxSXI--
