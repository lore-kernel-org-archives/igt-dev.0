Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 11 Apr 2023 09:19:06 -0700
Message-Id: <168122983958.3152898.432397312184705707.b4-ty@intel.com>
In-Reply-To: <20230404170737.1856619-1-lucas.demarchi@intel.com>
References: <20230404170737.1856619-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t v2] tools: Add tool to dump
 GuC/HuC CSS header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Tue, 04 Apr 2023 10:07:37 -0700, Lucas De Marchi wrote:
> Since we are now using unversioned GuC/HuC, it's useful to be able to
> dump the firmware blob and get that information from the CSS header.
> Add a tool that decodes that information and dumps the raw header.
> 
> Example output:
> 
> 	$ tools/intel-gfx-fw-info /lib/firmware/i915/tgl_guc_70.bin
> 	version: 70.5.1
> 	date: 2022-09-09
> 	raw dump:
> 	00000000  06 00 00 00 a1 00 00 00  00 00 01 00 00 00 00 00   ................
> 	00000010  86 80 00 00 09 09 22 20  71 17 01 00 40 00 00 00   ......" q...@...
> 	00000020  40 00 00 00 01 00 00 00  09 21 45 00 73 79 73 5f   @........!E.sys_
> 	00000030  67 62 73 62 50 43 2d 31  2e 30 2e 33 31 35 30 00   gbsbPC-1.0.3150.
> 	00000040  01 05 46 00 00 00 00 00  00 00 00 00 00 00 00 00   ..F.............
> 	00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ................
> 	00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ................
> 	00000070  00 00 00 00 00 00 00 00  00 10 80 00 00 01 40 00   ..............@.
> 
> [...]

Applied, thanks for the reviews.

[1/1] tools: Add tool to dump GuC/HuC CSS header
      commit: 2da179d399d83a6859a89176d83b7ec1d71fe27a

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
