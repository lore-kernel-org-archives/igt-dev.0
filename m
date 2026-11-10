Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBD5606A332
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MBx9WiYR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21410E949;
	Tue, 10 Nov 2026 15:30:19 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB1710E947
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 15:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paghUtwGbMKcJ0jJLtHYrlLy3nyRpsfHlN6I36Wur4Elq33qBnnXiQHH4RoDZRBrKnY7/Z6gJCR1pUgg2FMGBYIFvE+d+NnwSm6tRZXtIQCkq2MTBcDOCMVmVMRD7v8TBnYuLuzo7hbGAy3eGRsVNDIw9sZdJ6iAONayGME66tMP2UAHKI2ijtFH6OLHDh7gxaax610A5oqEpPPWE92ldpTQVImsRFr/EyMtyKtYfTi/ALOsq9bSOdaID71mlvAwTvwbL6ki/+VaZVQx2P0j2Jp6Y914IZQk3FFhXrlwxZaS8seUTkF4BXOkU74rM4HDSyhiMeKgkGJVlpktOxdx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWV8hKqOJQt2+fovF9UOumE/8aHV/KYj0kDxkq4LTrU=;
 b=SIdYdkmOrH9pGIImt4qH3WZuZsHbf/kX7UrEGVMA8MkfdWK0ji/dRpiuTDxqqsd88YgR2gRkRLeId1X8P6Q2rqGjhqlOiUhykaNk5H1xhvvW2TWTEXvS5v3ORjVp/aTHNF8JPWrS0/00fLHSsgl2A7l9OGKcO39OvES99fMGw4AIlgH4vPa+88xbcaULiDG7ln0nJJUmmnKLB48TK35MF3JEMGRUimZJwO2CFUPDeq3T5NK41Oq68I62kGQlXNWkhao1pVYR1vqRJX5o2ZEMqJJarU/FMzmYJQ2woHuBqGhuYeQ62/sWY6Zux8iJsnxJ3mHU0cEXqsIukCRqNkfDxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yWV8hKqOJQt2+fovF9UOumE/8aHV/KYj0kDxkq4LTrU=;
 b=MBx9WiYRkdT8tl40FJAy45Lt0NBb683jYKXPjM4yjh2ltNynxHdZcB3ds4Ep6Zsq/fBtx31m581rfuIYknYqx36qAVyi7ppfBp3aJ22s2hki0rdnugUNJxke+S7c0/eirrWLtiX1XkJ4EGex/XIQLzXDwWVObMJyhMlRd2ueRW0=
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 (2603:10b6:610:2ff::7) by PH7PR12MB5854.namprd12.prod.outlook.com
 (2603:10b6:510:1d5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:29:11 +0000
Received: from CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74]) by CHAPR12MB999247.namprd12.prod.outlook.com
 ([fe80::d727:e84d:1883:b74%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:29:11 +0000
From: "Francis, David" <David.Francis@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Simona Vetter <simona@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Topic: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Thread-Index: AQHdVmXmMW9uqLKDx0S/oDHXh66Ci7cfedmAgAACG4CAAALTAIAIJN29
Date: Tue, 10 Nov 2026 15:29:11 +0000
Message-ID: <CHAPR12MB999247E175D3C316F052F38778EF722@CHAPR12MB999247.namprd12.prod.outlook.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <b9ffe1b9-1a65-45bd-858b-74f6ddd40a3b@igalia.com>
 <DMN81PMG934A.3W1P5EQFBJ9XU@intel.com>
 <72d94198-4678-4641-bbfb-e140c982b059@igalia.com>
In-Reply-To: <72d94198-4678-4641-bbfb-e140c982b059@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-11-10T15:29:10.944Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard; 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHAPR12MB999247:EE_|PH7PR12MB5854:EE_
x-ms-office365-filtering-correlation-id: ed235db9-0d7b-48e7-2c83-08df3f3f5ece
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|5023799004|261022105027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261021123027099003|261021135927099003|261021121427099003|261009223027099003|261102130727099003|10067099003;
x-microsoft-antispam-message-info: PoIDyjwiRpRDk59hijoqmpKTlEFtpPGgVv3fVfl8UfIYCGxj8rnwCB/RF4lOfeaLbBR33UXfjiTRBIvVt2Qv0PsZjAu8MDwVCeKPhUgI1lJ7FohQVCumGY6wUUJjPsUsPmdlH/Jrkxa+Hdqd6XAtKZPVWMhFhgqv1hbAiRbnMnJHsdKxO0C2n3NUw9f9+1glIr653/6+aI58lBxUucqszhQClaLAa/ksPhFqhhK3v02uDnJj7YxkiA+abpqyKeci6+FoVamBuKQSO1Pm7GeZ445unvxrT1Vz1vwfplFEo8BBZfypu9SMIBqespW94cI3aZrlhElDEGN/37uZzE2aCFvqbkp6RoGy1sUT4qn17DIsioYfWqz/BNf+Ja6FhFc6urN66VGbQXDU1CjbhoQkw4lvCkdGo476N+PklkOHpcPfdfBuUTL92XZu2MxSbtvDJRqq6Gz8sxYisIcN+qkDnRpDnTCHGq0oprYErWAQtTESHbdkr4mILZSgluFqZO/kR36vBZ9oSmR8eJBpbpSLMFrT0P3AwMcd87Q4NMxkIPo6uvZ9JR/pXjK401wjcg83XnB8fMTaDY3Itqde5XVt2+pU5YiEltpHB7X2VbXQgV9UZLVHH7Kx7T3x7kvzbp+ov7m4atZH9Jg8VL2SNp1ab8WQzi8f+4M7WQWnZT2+HIa0sJ69FvkinsfkRg1+KSqxjJe1D6FAm+0NrKlJYF5w6ryi6fqUYeSsxNDLAIGDNAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHAPR12MB999247.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(5023799004)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003)(261102130727099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UICWvX4N9A/pXjqdOjgjlTgX/58nx+8Got9HYIYJvEO2u5iH7AVbzY3WPzY7?=
 =?us-ascii?Q?qhu/KZwlKalhuES6crTaDYQc/Jz4/tfHd6B0Xx7TMqxV4jCHtXNl+j0aRx+D?=
 =?us-ascii?Q?RYkJgRADXj24q6bS9e6CvRxR3F28BTbaBjVOHA+nWgAPk2u1QI1NJ6fmMG+d?=
 =?us-ascii?Q?FmrXQP8esfK4FbBhPaD7Eh4vLNG+T9GPJOtVz9YP4P4DnbJNvxhBk/oJGijd?=
 =?us-ascii?Q?LQr6EfMrqKVH2d7yFaMvZ70UjOii9s1hz5dZIpvuJt0O+KPsjZLJK/baTyZ1?=
 =?us-ascii?Q?iX0i1iNF1XJMlF8dqqth3kEYne7IeJvXzHmbaYBP4XrQ3SVQqhoxM5+/1API?=
 =?us-ascii?Q?C6IrIoi4yKaVcyUPdDqsmPcDw6w3RoVMoMZ/jP/CfzPzVgWrXBh+qhPZmBAt?=
 =?us-ascii?Q?nzSlUg+1KAeTSs91Q5+qpH0NITuzZ7C9JwRKqnGwmjBep0SC0koIApawzFUf?=
 =?us-ascii?Q?0Xr+jT4VXiAm5vyougHA7cMXl9V3kWQ22jghi2yCPZcTxcXnhRAdVGsj1k/Y?=
 =?us-ascii?Q?hCHu+CyM8zKVBzBGHPfNPH8I61HkKctVGX3aPyCbL885NjC0oExrGFIubMns?=
 =?us-ascii?Q?5ZDq6pU4Tuh5Dan94naMSom6tiDJqZpPfSSnfp23M58xESz8BiR9IITgJGbQ?=
 =?us-ascii?Q?elUoWL0QEd1C7k61ZcfQsWGpQo5xabSXxwecZ1e2aFH4qUDfQPCexNRzagjM?=
 =?us-ascii?Q?nvZfzhk/kyippNilOwClWL3R5UqPCDD2lNvn7q4Uo2pyyFQjTvVN0pZBnWB4?=
 =?us-ascii?Q?oQ5t7Q83WbF4QHI+Ep6tPRemvIJS8yL++6Kk/mcd9VOWy9JhF+PeNfRg/2sv?=
 =?us-ascii?Q?c8bymOL07/+ztjgFthh1ZoP7UmpDn0kMUJlegkNXwNo3hcn1ihavLsvgjXv6?=
 =?us-ascii?Q?QgYnU1nPKtHRQ1mkkpomZhgBAFPSzDeIEaBuz7Fv4B4LYj99zF6ZSNWcphT8?=
 =?us-ascii?Q?eCLjw2dSBcySmFCbSKaTWXIzNWWmB5jb9kSNWQkfjLEAyERufNofYSvws+sP?=
 =?us-ascii?Q?cERBbrCW5uG3iKaVTHC2YvYeZuB/0VwcSBC/O7y8+sjD08/Imu8Zcd5aNaGD?=
 =?us-ascii?Q?4Bkgqf9qE7Q+lg6j5uf44/sQz6R5UT0yUDhvnJbHZSsLsawDVYJEOScpGS1a?=
 =?us-ascii?Q?oJVYL2tWyxSNyg1dzM8L6Hrn13xSGt8qpVI/3m8afBIUUWAttiAvlxsKfdow?=
 =?us-ascii?Q?KNqhab2bydtoSJNlFt1dS7/RB29jalCAwuj6cbUCq6/d4/kvtI5GGm1E2sw0?=
 =?us-ascii?Q?6gjfDk5lMLemWGQsfrN+vZ97bA2aUqtSzJyKQzFh0uLAERDfZ61ad2amrRyn?=
 =?us-ascii?Q?vug5V9KemWauzce5w30VgI4ALCD008tB5mLyegRlm+qsrFXxUyMuzty5LYmS?=
 =?us-ascii?Q?7DyTvecXeKIEQCw9PyPlSUDBv5XU0IpqIcJ/GgXIoVoQJdj1gS0cORo7wsXC?=
 =?us-ascii?Q?5Tlcy6dvK0pba+VNyN9WLFE4hjSTHfO8t3esbqahvhEJtQI9ZmiWD1LPRq3N?=
 =?us-ascii?Q?YUdauD2ANGlWuSSwegE/N0LHEEwIWkih1MWmaG045wqHq7rrsLbHDlxDu9rM?=
 =?us-ascii?Q?RHH7aqIr+IiOMn3AFQ2q9LWCUOipAylBn907SCOpRuLFbeQFVRfXjNUyxEdk?=
 =?us-ascii?Q?hmUCmJs19kI5dObvSWWcEhva+9QtpEE5+N/pm9HIJADeOVzxIVtJqKhQVgbL?=
 =?us-ascii?Q?E3QuhMrLT3A7UzY6s3txPXNwSUSMYSU0ISwMrhA16aQwH52o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHAPR12MB999247.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed235db9-0d7b-48e7-2c83-08df3f3f5ece
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 15:29:11.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kLoN7/+dv935+Uvf3SUPR2vl3QKR5kU4V4LHRIO5d865UGTWzFEeDKgcqV2XIufw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854
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

>> +     /* New handle must be valid */
>> +     ret =3D gem_close_bo(ctx, new_h);
>
>FWIW for all success checks you could use gem_close() from
>ioctl_wrappers which has the built in assert. You lose the custom error
>message, but is that really interesting.
>
>For me it's more readable to be more compact so one can focus better on
>test logic versus the noise. I'd then rename gem_close_bo to __gem_close
>so end result is gem_close for success tests and ret =3D __gem_close for
>negative. That follows the existing helper naming pattern from
>ioctl_wrappers, where double underscore helpers return a negative errno,
>while normal ones assert success.
>
>If you decide to go this route probably also have __gem_change_handle
>and gem_change_handle with the same pattern.
>
>If we convert one of the below subtests to this we would have:
>
>static void test_new_handle_zero(struct gpu_ctx *ctx)
>{
>        uint32_t handle;
>        int ret;
>
>        handle =3D gpu_create_bo(ctx, 4096);
>
>        /* new_handle =3D 0 must fail with -EINVAL */
>        ret =3D __gem_change_handle(ctx, handle, 0);
>        igt_assert_eq(ret, -EINVAL);
>
>        /* Original handle should still be valid */
>        gem_close(ctx, handle);
>}
>
>Is it a bit nicer to read? I leave it to you.

Nothing wrong with either approach - to me, the complexity of having
gem_close and __gem_close outweighs the complexity of extra characters
in the tests. I'll probably keep things as is if that's okay.

>> +     /* new_handle > INT_MAX must fail with -EINVAL */
>> +     ret =3D gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
>> +     igt_assert(ret < 0);
>> +     igt_assert_eq(errno, EINVAL);
>
>About this one I am not sure. Is it not implementation details as long
>as the uapi for handle is u32? Let say someone converts to XArray one
>day and then we have to artificially limit that to s32 just so
>gem_change_handle can keep working.

My understanding of this kind of interface is that it's okay if a scenario
goes from being an error to a kind of useful case in a later update -
like when a padding element that was previously required to be 0 becomes
a new field in the input struct. So good to test these, at least for now.

>> +     __atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
>
>Potentially simpler to flip the semantices to data->stop which only
>needs to be written before the join. Because threads are not running yet
>despite true being written so it is slightly confusing.

To me having a swtch be on for test is running makes more sense than on
for test is swap? In any case it would save exactly this one line.

>> +                     if (!__atomic_load_n(&data->running, __ATOMIC_ACQU=
IRE))
>> +                             return NULL;
>
>Stop condition can go instead of while (true).

In this case, this needs to be an immediate return. If it isn't a return,
the test can try to gpu_create_bo even though the driver has been closed.
Could do that with a check in the while and then another check right below
but I think this is simpler.

>> +                     while (true) {
>> +                             ret =3D gem_change_handle(data->ctx, handl=
e, h[i]);
>> +                             if (ret =3D=3D 0) {
>> +                                     if (verbose_logging) {
>> +                                             igt_info("[CLOSE-TID:%lu] =
Change handle %u to %u\n",
>> +                                                      (unsigned long)ti=
d, handle, h[i]);
>> +                                     }
>> +                                     break;
>> +                             }
>
>As in the other review I am not convinced this loop is guranteed to
>break out. The change handle thread can keep taking the target this loop
>wants by moving other handles around. Not sure how to solve it though
>apart from adding some coordination between the threads.

At this point there should be only 1 valid bo being shuffled around
between the 4 handle (we just closed the other one) so at most
there should be 2 handles unavailable (change_handle locks down both the
old and new handles for a bit). With the other 2 available, it shouldn't
take long (and in my testing this does proceed)

>> +     /* Exactly two gem objects should still exist */
>> +     num_handles =3D 0;
>> +     for (int i =3D 0; i < 4; i++) {
>
>ARRAY_SIZE

I could parameterize this as shuffling K bos over N handles but I don't
see a great reason to do any numbers other than 2 and 4.

All other feedback makes sense

I also am having trouble keeping track of the igt tests for the multiple
different change_* ioctls and ioctl options and their different versions
and feedback

Changes in v4

Thanks,
David Francis

________________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Sent: Thursday, November 5, 2026 6:07 AM
To: Sebastian Brzezinka; Francis, David; igt-dev@lists.freedesktop.org
Cc: Prosyak, Vitaly; Kamil Konieczny; Koenig, Christian; Simona Vetter; Deu=
cher, Alexander
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests fo=
r GEM_CHANGE_HANDLE


On 05/11/2026 10:56, Sebastian Brzezinka wrote:
> Hi Tvrtko,
>
> On Thu Nov 5, 2026 at 11:49 AM CET, Tvrtko Ursulin wrote:
>>
>> Sorry for the delay, a combination of things..
>>
>> On 07/10/2026 15:12, David Francis wrote:
>>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
>>> functionality, edge cases, and race conditions of this ioctl against
>>> itself, gem close, gem create, and prime import and export.
>>>
>>> GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. Thi=
s IGT
>>> coverage is a prerequisite for validating the eventual kernel-side ioct=
l
>>> implementation and makes fixing its security bugs safer.
>>>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
>>> Cc: Christian Konig <christian.koenig@amd.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>> Signed-off-by: David Francis <David.Francis@amd.com>
>>> ---
> There's already a v2. I commented here by accident, sorry for not
> correcting it sooner.

Ah right, thank you. I wasn't copied on v2. Anyway, I think some of my
comments still stand so I will let David sort through them first and
maybe agree on v3 before I re-read it.

Regards,

Tvrtko

