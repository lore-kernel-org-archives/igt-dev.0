Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2089.outbound.protection.outlook.com [40.107.96.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C796E332
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 14:51:10 +0000 (UTC)
References: <20210614164135.1519746-1-markyacoub@chromium.org>
 <YMhtSFZCpdrKFGqk@platvala-desk.ger.corp.intel.com>
 <CAJUqKUpSUevANSt1ddWyTDQKrQsk5dy7J58gKJkY2xXW_qEiiA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <57a3e34e-218c-0e5f-d0ad-256aaef51948@amd.com>
Date: Tue, 15 Jun 2021 16:51:01 +0200
In-Reply-To: <CAJUqKUpSUevANSt1ddWyTDQKrQsk5dy7J58gKJkY2xXW_qEiiA@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_prime: Filter out devices that
 can't import buffers.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Anson Jacob <Anson.Jacob@amd.com>, Sean Paul <seanpaul@chromium.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Am 15.06.21 um 16:46 schrieb Mark Yacoub:
> On Tue, Jun 15, 2021 at 5:03 AM Petri Latvala <petri.latvala@intel.com> wrote:
>> On Mon, Jun 14, 2021 at 12:41:34PM -0400, Mark Yacoub wrote:
>>> Some devices such as amdgpu do not support imported buffers.
>>> Filter out those devices.
>>> Tested on Zork with chromeos-kernel-5_4.
>>>
>>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>>> ---
>>>   tests/kms_prime.c | 14 ++++++++++++--
>>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>>> index 8cb2ca2a..480c7eb4 100644
>>> --- a/tests/kms_prime.c
>>> +++ b/tests/kms_prime.c
>>> @@ -249,6 +249,16 @@ static void test_crc(int exporter_fd, int importer_fd)
>>>        igt_display_fini(&display);
>>>   }
>>>
>>> +/* The test attempts to import the buffer object from one device to another.
>>> + * Filter out devices that aren't capable of doing this.
>>> + */
>>> +bool does_device_support_dmabuf_import(int fd) {
>>> +     /* AMDGPU uses VRAM. Any use of the fb will migrate it to VRAM, which is not sensible for
>>> +      * an imported dma-buf.
>>> +      */
>>> +     return !is_amdgpu_device(fd);
>>> +}
>> How is real (aka non-IGT) userspace supposed to handle this? Will they
>> need to check if the device is an AMD device before deciding whether
>> to import?
>>
>> What happens in this test without this patch?
> amdgpu fails to create a framebuffer if the drm_gem_object has a valid
> `import_attach` property.
>> +Cc Arek. My initial impression for this is that the kernel should
>> take care of the idiosyncracies but I'm lacking the big picture.

Using DMA-buf imported buffer objects as scanout is in general vendor 
specific.

In other words failing to create a framebuffer is the normal reaction here.

Only AMD GPUs in some hardware variants, probably some ARM SOCs and 
maybe i915 can handle that. All other drivers should fail here.

The general approach should be to try to create a framebuffer and if 
that doesn't work use a fallback mechanism.

Regards,
Christian.

>>
>>
>> --
>> Petri Latvala

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
