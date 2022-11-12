Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EBE10E1D0
 for <igt-dev@lists.freedesktop.org>; Sat, 12 Nov 2022 18:31:06 +0000 (UTC)
Message-ID: <12f8b2ef-0fdb-c7fb-8722-cc5424b71ceb@amd.com>
Date: Sat, 12 Nov 2022 13:30:59 -0500
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
 <608c3fc4-ae1b-c497-6011-2b2a62e6a153@amd.com>
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <608c3fc4-ae1b-c497-6011-2b2a62e6a153@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/9] lib/amdgpu: add SPDX-License-Identifier:
 MIT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thanks a lot Christian!

Vitaly

On 2022-11-12 13:28, Christian König wrote:
> Am 11.11.22 um 22:52 schrieb vitaly.prosyak@amd.com:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Reviewed-by: Pierre-eric Pelloux-prayer 
>> <Pierre-eric.Pelloux-prayer@amd.com>
>
> Acked-by: Christian König <christian.koenig@amd.com> for the entire 
> series.
>
>> ---
>>   lib/amdgpu/amd_PM4.h                | 2 +-
>>   lib/amdgpu/amd_command_submission.c | 2 +-
>>   lib/amdgpu/amd_command_submission.h | 2 +-
>>   lib/amdgpu/amd_compute.c            | 2 +-
>>   lib/amdgpu/amd_compute.h            | 2 +-
>>   lib/amdgpu/amd_dispatch.c           | 2 +-
>>   lib/amdgpu/amd_dispatch.h           | 2 +-
>>   lib/amdgpu/amd_dispatch_helpers.c   | 2 +-
>>   lib/amdgpu/amd_dispatch_helpers.h   | 2 +-
>>   lib/amdgpu/amd_family.h             | 2 +-
>>   lib/amdgpu/amd_gfx.c                | 2 +-
>>   lib/amdgpu/amd_gfx.h                | 2 +-
>>   lib/amdgpu/amd_gfx_v8_0.c           | 2 +-
>>   lib/amdgpu/amd_gfx_v8_0.h           | 2 +-
>>   lib/amdgpu/amd_gfx_v9_0.c           | 2 +-
>>   lib/amdgpu/amd_gfx_v9_0.h           | 2 +-
>>   lib/amdgpu/amd_ip_blocks.c          | 2 +-
>>   lib/amdgpu/amd_ip_blocks.h          | 2 +-
>>   lib/amdgpu/amd_memory.c             | 2 +-
>>   lib/amdgpu/amd_memory.h             | 2 +-
>>   lib/amdgpu/amd_registers.h          | 2 +-
>>   lib/amdgpu/amd_sdma.h               | 2 +-
>>   lib/amdgpu/amd_shaders.c            | 2 +-
>>   lib/amdgpu/amd_shaders.h            | 2 +-
>>   lib/amdgpu/amd_shared_dispatch.h    | 2 +-
>>   lib/amdgpu/amdgpu_asic_addr.h       | 2 +-
>>   tests/amdgpu/amd_basic.c            | 2 +-
>>   tests/amdgpu/amd_deadlock.c         | 2 +-
>>   28 files changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
>> index 0588b4258..ec4de1f62 100644
>> --- a/lib/amdgpu/amd_PM4.h
>> +++ b/lib/amdgpu/amd_PM4.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_command_submission.c 
>> b/lib/amdgpu/amd_command_submission.c
>> index 16939653b..de393209b 100644
>> --- a/lib/amdgpu/amd_command_submission.c
>> +++ b/lib/amdgpu/amd_command_submission.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_command_submission.h 
>> b/lib/amdgpu/amd_command_submission.h
>> index 0df7c2c1c..0c1ba9bb4 100644
>> --- a/lib/amdgpu/amd_command_submission.h
>> +++ b/lib/amdgpu/amd_command_submission.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2012 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
>> index 5a7fa27e4..6e61f1820 100644
>> --- a/lib/amdgpu/amd_compute.c
>> +++ b/lib/amdgpu/amd_compute.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_compute.h b/lib/amdgpu/amd_compute.h
>> index 01eee6063..f27be5f17 100644
>> --- a/lib/amdgpu/amd_compute.h
>> +++ b/lib/amdgpu/amd_compute.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
>> index cf773c309..863786c59 100644
>> --- a/lib/amdgpu/amd_dispatch.c
>> +++ b/lib/amdgpu/amd_dispatch.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
>> index 1905a5562..c500b5b3f 100644
>> --- a/lib/amdgpu/amd_dispatch.h
>> +++ b/lib/amdgpu/amd_dispatch.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_dispatch_helpers.c 
>> b/lib/amdgpu/amd_dispatch_helpers.c
>> index 3eddae968..8f06d841d 100644
>> --- a/lib/amdgpu/amd_dispatch_helpers.c
>> +++ b/lib/amdgpu/amd_dispatch_helpers.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>> diff --git a/lib/amdgpu/amd_dispatch_helpers.h 
>> b/lib/amdgpu/amd_dispatch_helpers.h
>> index bea0c4248..a129e8e07 100644
>> --- a/lib/amdgpu/amd_dispatch_helpers.h
>> +++ b/lib/amdgpu/amd_dispatch_helpers.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
>> index 206824837..25c2c7db9 100644
>> --- a/lib/amdgpu/amd_family.h
>> +++ b/lib/amdgpu/amd_family.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2008 Corbin Simpson <MostAwesomeDude@gmail.com>
>>    * Copyright 2010 Marek Olšák <maraeo@gmail.com>
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>> diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
>> index a89ff7536..f133e2459 100644
>> --- a/lib/amdgpu/amd_gfx.c
>> +++ b/lib/amdgpu/amd_gfx.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>> diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
>> index d9da85943..90addf5bc 100644
>> --- a/lib/amdgpu/amd_gfx.h
>> +++ b/lib/amdgpu/amd_gfx.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_gfx_v8_0.c b/lib/amdgpu/amd_gfx_v8_0.c
>> index 987d7053a..374a923ad 100644
>> --- a/lib/amdgpu/amd_gfx_v8_0.c
>> +++ b/lib/amdgpu/amd_gfx_v8_0.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_gfx_v8_0.h b/lib/amdgpu/amd_gfx_v8_0.h
>> index 52ed418cb..baf2e2e9c 100644
>> --- a/lib/amdgpu/amd_gfx_v8_0.h
>> +++ b/lib/amdgpu/amd_gfx_v8_0.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_gfx_v9_0.c b/lib/amdgpu/amd_gfx_v9_0.c
>> index 175411795..5cb436b7b 100644
>> --- a/lib/amdgpu/amd_gfx_v9_0.c
>> +++ b/lib/amdgpu/amd_gfx_v9_0.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_gfx_v9_0.h b/lib/amdgpu/amd_gfx_v9_0.h
>> index e44a7d944..bcdbf754c 100644
>> --- a/lib/amdgpu/amd_gfx_v9_0.h
>> +++ b/lib/amdgpu/amd_gfx_v9_0.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
>> index 3e11b34d3..3d7c54a11 100644
>> --- a/lib/amdgpu/amd_ip_blocks.c
>> +++ b/lib/amdgpu/amd_ip_blocks.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
>> index 9c24eba2a..908aacde0 100644
>> --- a/lib/amdgpu/amd_ip_blocks.h
>> +++ b/lib/amdgpu/amd_ip_blocks.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
>> index 344551fcc..101dbaf13 100644
>> --- a/lib/amdgpu/amd_memory.c
>> +++ b/lib/amdgpu/amd_memory.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
>> index 80bf979f4..bc3652e8e 100644
>> --- a/lib/amdgpu/amd_memory.h
>> +++ b/lib/amdgpu/amd_memory.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_registers.h b/lib/amdgpu/amd_registers.h
>> index a01c9a84f..ff62b8931 100644
>> --- a/lib/amdgpu/amd_registers.h
>> +++ b/lib/amdgpu/amd_registers.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
>> index b8ed93aa6..630535bb1 100644
>> --- a/lib/amdgpu/amd_sdma.h
>> +++ b/lib/amdgpu/amd_sdma.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
>> index 5505e504e..7672f67c0 100644
>> --- a/lib/amdgpu/amd_shaders.c
>> +++ b/lib/amdgpu/amd_shaders.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *  *
>> diff --git a/lib/amdgpu/amd_shaders.h b/lib/amdgpu/amd_shaders.h
>> index 22fc474fc..80a319a3a 100644
>> --- a/lib/amdgpu/amd_shaders.h
>> +++ b/lib/amdgpu/amd_shaders.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/lib/amdgpu/amd_shared_dispatch.h 
>> b/lib/amdgpu/amd_shared_dispatch.h
>> index 0dc5792f9..4ab31b8f8 100644
>> --- a/lib/amdgpu/amd_shared_dispatch.h
>> +++ b/lib/amdgpu/amd_shared_dispatch.h
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> diff --git a/lib/amdgpu/amdgpu_asic_addr.h 
>> b/lib/amdgpu/amdgpu_asic_addr.h
>> index d147efb86..dfae4935b 100644
>> --- a/lib/amdgpu/amdgpu_asic_addr.h
>> +++ b/lib/amdgpu/amdgpu_asic_addr.h
>> @@ -1,6 +1,6 @@
>>   /**
>> ***********************************************************************************************************************
>> -*
>> +* SPDX-License-Identifier: MIT
>>   * Copyright © 2007-2021 Advanced Micro Devices, Inc.
>>   * Copyright 2022 Advanced Micro Devices, Inc.
>>   * All Rights Reserved.
>> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
>> index 9be034975..1d5c1f3fb 100644
>> --- a/tests/amdgpu/amd_basic.c
>> +++ b/tests/amdgpu/amd_basic.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>> diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
>> index e1b508fcf..109aaac18 100644
>> --- a/tests/amdgpu/amd_deadlock.c
>> +++ b/tests/amdgpu/amd_deadlock.c
>> @@ -1,4 +1,4 @@
>> -/*
>> +/* SPDX-License-Identifier: MIT
>>    * Copyright 2014 Advanced Micro Devices, Inc.
>>    * Copyright 2022 Advanced Micro Devices, Inc.
>>    *
>
