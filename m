Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A96A10E6A5
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 17:04:06 +0000 (UTC)
Date: Thu, 31 Aug 2023 19:03:59 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Jim Shargo <jshargo@chromium.org>
Message-ID: <20230831190359.25c8c37f@maurocar-mobl2>
In-Reply-To: <20220728175736.1893691-1-jshargo@chromium.org>
References: <YuJA8zCW9wFQh5M6@platvala-desk.ger.corp.intel.com>
 <20220728175736.1893691-1-jshargo@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] tooling: Add linux's .clang-format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 28 Jul 2022 13:57:36 -0400
Jim Shargo <jshargo@chromium.org> wrote:

> As I was authoring my first patchset for IGT, I found myself fighting
> the tooling a bit to get everything right. I had to add a bunch of extra
> command line args to use my linux checkout's formatting rules to get the
> style right.
> 
> I grabbed this from a recent checkout of torvald's repo.
> 
> The commit I used was: e0dccc3b76fb35bb257b4118367a883073d7390e
> 
> To make this discoverable to new contributors, this change also
> updates CONTRIBUTING.md with:
> 
>   - A link to git-clang-format, which is a useful tool for using
>   clang-format from git just on a commit's changes
>   - A link to .editorconfig to make it more discoverable
> 
> Changes made to the linux kernel style:
> 
>   - Reflowing comments, including multi-line comments (ReflowComments)
>   - Support for magic code blocks (ForEachMacros, IfMacros)
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>

This is not a full validation of the results, but, running this with:

	git-clang-format 8c64183a461a

I found several places where the output format is worse than what
we have. Strictly speaking, the results may be following the 
documented Kernel coding style, but for sure they don't follow the usual
Kernel nor IGT practices. Also, checkpatch.pl won't be complaining
about such things as the original code already follows the Kernel
coding style.

Some examples below:

	 #ifndef likely
	-#  ifdef __GNUC__
	-#    define likely(x)   __builtin_expect(!!(x), 1)
	-#    define unlikely(x) __builtin_expect(!!(x), 0)
	-#  else
	-#    define likely(x)   (x)
	-#    define unlikely(x) (x)
	-#  endif
	+#ifdef __GNUC__
	+#define likely(x) __builtin_expect(!!(x), 1)
	+#define unlikely(x) __builtin_expect(!!(x), 0)
	+#else
	+#define likely(x) (x)
	+#define unlikely(x) (x)
	+#endif
	 #endif

The above is a lot worse to read, making reviews harder.

Other defines also are re-formatted in a way that makes harder
to review:

	-#define PIPE_CONTROL_NOWRITE          0x00
	-#define PIPE_CONTROL_WRITEIMMEDIATE   0x01
	-#define PIPE_CONTROL_WRITEDEPTH       0x02
	-#define PIPE_CONTROL_WRITETIMESTAMP   0x03
	+#define PIPE_CONTROL_NOWRITE 0x00
	+#define PIPE_CONTROL_WRITEIMMEDIATE 0x01
	+#define PIPE_CONTROL_WRITEDEPTH 0x02
	+#define PIPE_CONTROL_WRITETIMESTAMP 0x03

Tables are also weird-formatted:

        -static const char * const end_of_thread[2] = {
        -    [0] = "",
        -    [1] = "EOT"
        -};
        -
        +static const char *const end_of_thread[2] = { [0] = "", [1] = "EOT" };

Placing multiple values per line. On a small tame like this, not
a big issue, but on bigger tables, it makes a lot harder to check
if there are gaps at the values.

Looking at function prototypes:

        -static int src_ia1 (FILE *file,
        -                   unsigned type,
        -                   unsigned _reg_file,
        -                   int _addr_imm,
        -                   unsigned _addr_subreg_nr,
        -                   unsigned _negate,
        -                   unsigned __abs,
        -                   unsigned _addr_mode,
        -                   unsigned _horiz_stride,
        -                   unsigned _width,
        -                   unsigned _vert_stride)
        +static int src_ia1(FILE *file, unsigned type, unsigned _reg_file, int _addr_imm,
        +                  unsigned _addr_subreg_nr, unsigned _negate, unsigned __abs,
        +                  unsigned _addr_mode, unsigned _horiz_stride, unsigned _width,
        +                  unsigned _vert_stride)

At least for functions with that many arguments, having one argument
per line makes easier for reviewers and for users.

So, I'd say it is not ready yet for merging.

Regards,
Mauro
