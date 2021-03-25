Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 25 Mar 2021 22:09:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFz8Gje1NPcu5ohy@phenom.ffwll.local>
References: <20210325185915.51590-1-arek@hiler.eu>
 <20210325185915.51590-2-arek@hiler.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325185915.51590-2-arek@hiler.eu>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/5] tests: Build
 gem_concurrent_all with meson
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 08:59:12PM +0200, Arkadiusz Hiler wrote:
> ...and add it to test-list-full.txt just like we do when building with
> autotools.
> 
> Signed-off-by: Arkadiusz Hiler <arek@hiler.eu>

tbh it might be time to sunset this. I kinda started it, it grew to
astronomical combinatorial combinations, it's been on the skiplist since
ages, and there's even more stuff on the skiplist. Looking at the history
it started very benign to tests some pwrite/pread vs rendering
synchronization issues. But it's definitely not doing just that anymore.

But maybe in a next patch series.

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/meson.build | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 54a1a3c7..8e3cd390 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -402,6 +402,19 @@ test_list_target = custom_target('testlist',
>  	      install : true,
>  	      install_dir : libexecdir)
>  
> +test_executables += executable('gem_concurrent_all', 'i915/gem_concurrent_all.c',
> +	   dependencies : test_deps + [ libatomic ],
> +	   install_dir : libexecdir,
> +	   install_rpath : libexecdir_rpathdir,
> +	   install : true)
> +test_list += 'gem_concurrent_all'
> +
> +test_list_full_target = custom_target('testlist-full',
> +	      output : 'test-list-full.txt',
> +	      command : [ gen_testlist, '@OUTPUT@', test_list ],
> +	      install : true,
> +	      install_dir : libexecdir)
> +
>  test_script = find_program('igt_command_line.sh')
>  foreach prog : test_list
>  	test('testcase check ' + prog, test_script, args : prog)
> -- 
> 2.31.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
