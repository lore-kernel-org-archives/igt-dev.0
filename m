Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 3 Nov 2022 15:57:10 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Message-ID: <20221103155710.36f29dd3@maurocar-mobl2>
In-Reply-To: <20221103104840.7301df76@maurocar-mobl2>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <20221103104840.7301df76@maurocar-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: davidgow@google.com, magalilemes00@gmail.com, maira.canal@usp.br,
 dlatypov@google.com, n@nfraprado.net, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, tales.aparecida@gmail.com,
 skhan@linuxfoundation.org, andrealmeid@riseup.net, kunit-dev@googlegroups.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 3 Nov 2022 10:48:40 +0100
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Sun, 28 Aug 2022 21:09:19 -0300
> Isabella Basso <isabbasso@riseup.net> wrote:
> 
> > This adds functions for both executing the tests as well as parsing (K)TAP
> > kmsg output, as per the KTAP spec [1].
> > 
> > [1] https://www.kernel.org/doc/html/latest/dev-tools/ktap.html
> > 
> > Signed-off-by: Isabella Basso <isabbasso@riseup.net>  
> 
> Hi Isabella,
> 
> I'm doing some tests here with my i915 KUnit patch series.
> 
> There's a problem with the way it is currently parsing the KTAP logs on
> IGT. It sounds that it is parsing the data only at the end, and not as
> they arrive. That's bad, as if something goes wrong, the previously
> reported data is still useful.
> 
> Also, when there's a crash, the IGT process is getting segmentation
> fault. So, the end result is that nothing is actually reported.
> 
> 	$ sudo ./build/tests/i915_selftest
> 	IGT-Version: 1.26-gbab20eb65 (x86_64) (Linux: 6.1.0-rc2-drm-990037e9984e+ x86_64)
> 	Segmentation fault (core dumped)
> 
> However, the logs are there (see enclosed). In this specific case, there
> was a GPU hang while running one of the tests on a real hardware, which
> is something that it is actually expected at development time.

Btw, if you want to test it, the patches I'm using are at:
	https://patchwork.freedesktop.org/series/110483/

The latest patch there is a workaround that fixes the issue. So, if you
apply patches 1-7 only, skipping (or reverting) patch 8, you'll be able
to reproduce the Kernel crash (which seems to be caused by the way KUnit
is initialized).

Regards,
Mauro
