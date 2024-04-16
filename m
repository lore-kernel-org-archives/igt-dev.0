Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FE6C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 08:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F31110EF31;
	Tue, 16 Apr 2024 08:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="uuefSne+";
	dkim-atps=neutral
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B3C10EF32
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 08:07:59 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-346406a5fb9so3120321f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1713254877; x=1713859677;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oYRwjmHaaFv9rvSnc938qa+T2JCzTKTUR+HksdGEc7Q=;
 b=uuefSne+hwCtpP7u1kcyL8gWF2lEJ0aSqjocalYW8b3GoQ13V7Wv8YXF3Jnn+1EqDf
 JVdKs9eUputNg6ERBvYnSCrmHb/00NusfePjVgLTBD+0AOt2HpINVT4lflGX+LztUrYD
 0KeAsuyiKW+naIgeyakRCcLqnCCVfvQkqTUv7SNv9nI+DGZugW3FBQlhX/+ZIJFJIR/f
 ct7dGJLDiXag18xTKrwlf4CnrqDxn6zG/vAL2Fdx3/dFbYj7JYbD2uemvh5lpZC5h9gw
 ituDK5J5N75FfjjsaVlbDPP8piOyLJbML6qX/BLr9I7Jfpu6JelqND2teql7HGcMSdf6
 exLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713254877; x=1713859677;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oYRwjmHaaFv9rvSnc938qa+T2JCzTKTUR+HksdGEc7Q=;
 b=mBZeI79KP33LSkVR+UhmqDI83SXgi4VhkVLsVUXdfvO7hwhxE6gvylrmy6yExDUvmL
 uLDE3J+v0yERmAbzJ/AvRd7HLW8ZoZdtcU5x/d9iJmCdFoXouj6JuSE8IUYPG/x9FLqz
 bsVc8FtwbgqERy8s2Se9pYEQ9jf/90b+jcdGZYw/bT8sOYB7J0YNoYI8IsQDqEnaaHEN
 xGw/6/9fG+GuQMGnXC5zlpwoaapGZ8IT09Jo78qMt8U8ub9a+ectyS1XbCsOxttLOdWI
 wM96fLmZIoW1wW6pZaHs2bp3MnHDKoHQGeAVZEYF9A91Lkfg5RC/woED3OCLpl/LOtZ6
 Fk/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyOe9lKloFDSB4iwBPt3yT70Uqx63wQpJIqGsK787ussQndQdqxWha55A8GLS5rCHS408BewVCt2D1HOOnkxHGLzG1r+FjuBlkDtHvOw==
X-Gm-Message-State: AOJu0YwrdtVwDg8KzJ6E04ClFuTudE2ZZMteWrrtUamCy8kK7vLvwwVD
 znP94v8KNcGdgjDUYHPsFevVdf2hZOS8vSSfnsQSfG9u0ky7YLVgDSzCn7NpLSc=
X-Google-Smtp-Source: AGHT+IGRam/mH6VJr+WO3KPGRK8CK7x3LD73RNH1wTXqqF/lZ1vZDP9ylSVHu+jVGxoBg1nIV0hgIA==
X-Received: by 2002:a5d:4851:0:b0:33d:a944:54c0 with SMTP id
 n17-20020a5d4851000000b0033da94454c0mr8140986wrs.22.1713254876873; 
 Tue, 16 Apr 2024 01:07:56 -0700 (PDT)
Received: from [192.168.0.101] ([84.65.0.132])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a056000137900b003455d32e944sm13988473wrz.96.2024.04.16.01.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 01:07:56 -0700 (PDT)
Message-ID: <cf1ed943-1daf-4f8d-a130-b900de233432@ursulin.net>
Date: Tue, 16 Apr 2024 09:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tools/gputop: toggle sysfs profiling knob if
 available for device
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: daniel@ffwll.ch, boris.brezillon@collabora.com,
 kamil.konieczny@linux.intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org, healych@amazon.com, kernel@collabora.com
References: <20240402222813.277470-1-adrian.larumbe@collabora.com>
 <20240402222813.277470-3-adrian.larumbe@collabora.com>
 <xc4vz6uq4llsexgwurudl3jtv6bke3b4vsqnqgvvhs3gtkd6ay@5glimn77s3dq>
 <42eaigc7oogdzi4km5ytjph5ejzej65pgzygck24apdt2io4wr@v72l4hu47vic>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <42eaigc7oogdzi4km5ytjph5ejzej65pgzygck24apdt2io4wr@v72l4hu47vic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 15/04/2024 20:31, Adrián Larumbe wrote:
> On 03.04.2024 15:46, Lucas De Marchi wrote:
>> On Tue, Apr 02, 2024 at 11:27:45PM +0100, Adrián Larumbe wrote:
>>> For every DRM device that enables its job accounting HW from user space,
>>> toggle it right before obtaining per-client fdinfo numbers.
>>>
>>> Make sure profiling status is returned to its original state before
>>> exiting, by handling the SIGINT signal just like in intel_gpu_top.
>>
>> isn't this something that should be rather tracked on the kernel side
>> rather than relying on the userspace to behave?
> 
> This would simplify handling of the sysfs knob state from user space, but I'm
> not sure normal sysfs device attributes are allowed to keep an internal state
> between _show() calls.
> 
>> 1) call gputop
>> 2) call gputop, because you forgot you had it open in another ssh
>>     session
>> 3) stop (1), because ssh session dies
> 
> I feel tempted to brush this off as legitimate behaviour, albeit 'undefined'.
> If we cannot handle the scenario in which multiple profilers tweak the profiling
> state at the same time from kernel space, then I would prefer to expect users to
> readjust the sysfs attribute value manually.

I agree with Lucas that would be a pretty bad user experience. We have 
to consider if more users for fdinfo appear there could be more fighting 
over this control going on. And I don't see any reasonable solution 
within the sysfs framework. It is not possible to have own fops in 
there, is it?

Would it be of any use if gputop would be checking the state of the knob 
from the main loop so it can at least give explicit notification someone 
toggled it to off? (Instead of suddenly and silently showing no GPU 
utilisation.) Maybe also before trying to restore it. It would be racy 
yes but maybe good enough for practical purposes?

Regards,

Tvrtko

> 
>>  From the kernel side, I think it could be done by enabling it on fd
>> open, disabling it on last close.
> 
> Adrian Larumbe
