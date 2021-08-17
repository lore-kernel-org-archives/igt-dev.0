Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44116E1C0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 15:27:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lo4so39301106ejb.7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Aug 2021 08:27:20 -0700 (PDT)
References: <20210817134523.1390961-1-mika.kahola@intel.com>
 <YRu/JcN3h88oXvRh@platvala-desk.ger.corp.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <d403f1d1-59d7-277b-9850-d2b4cdcedded@gmail.com>
Date: Tue, 17 Aug 2021 18:27:12 +0300
MIME-Version: 1.0
In-Reply-To: <YRu/JcN3h88oXvRh@platvala-desk.ger.corp.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] tests/kms_plane_*: Reset display
 before execution tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 17.8.2021 16.52, Petri Latvala wrote:
> On Tue, Aug 17, 2021 at 04:45:21PM +0300, Mika Kahola wrote:
>> Reset display before executing tests. This way display state is
>> in known state even if the previous test has failed.
> 
> I was going to suggest having reset in the common display
> initialization but it is there already. When do you see this kind of a
> thing happening for these tests? When running multiple subtests at
> once?
> 

Look like there's bug somewhere with commits hence this attempt fix. Bug 
can be seen if kms_cursor_crc is run after failed kms_plane_alpha_blend, 
alpha will not get reset for kms_cursor_crc and it will fail with crc 
mismatch (plane alpha different on cursor vs primary).

To me it look like if first igt_commit* after igt_display_reset() is 
using legacy api not all committed values go in but if use atomic api 
things will work. I've reliably reproduced this but didn't have time to 
look into why plane alpha will not get reset.

Most kms tests will not care about this because they do crc comparisons 
planeN vs planeN

/Juha-Pekka
