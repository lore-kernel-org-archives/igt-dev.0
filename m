Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230403202437.1816411-1-lucas.demarchi@intel.com>
References: <20230403202437.1816411-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Apr 2023 09:29:51 -0300
Message-ID: <168061139110.5056.15908803129907670095@gjsousa-mobl2>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tools: Add tool to dump GuC/HuC CSS
 header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Lucas
 De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-04-03 17:24:37)
> Since we are now using unversioned GuC/HuC, it's useful to be able to
> dump the firmware blob and get that information from the CSS header.
> Add a tool that decodes that information and dumps the raw header.
>=20
> Example output:
>=20
>         $ tools/intel-gfx-fw-info /lib/firmware/i915/tgl_guc_70.bin
>         version: 70.5.1
>         date: 2022-09-09
>         raw dump:
>         00000000  06 00 00 00 a1 00 00 00  00 00 01 00 00 00 00 00   ....=
............
>         00000010  86 80 00 00 09 09 22 20  71 17 01 00 40 00 00 00   ....=
.." q...@...
>         00000020  40 00 00 00 01 00 00 00  09 21 45 00 73 79 73 5f   @...=
.....!E.sys_
>         00000030  67 62 73 62 50 43 2d 31  2e 30 2e 33 31 35 30 00   gbsb=
PC-1.0.3150.
>         00000040  01 05 46 00 00 00 00 00  00 00 00 00 00 00 00 00   ..F.=
............
>         00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ....=
............
>         00000060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00   ....=
............
>         00000070  00 00 00 00 00 00 00 00  00 10 80 00 00 01 40 00   ....=
..........@.
>=20
>         struct uc_css_header:
>         - module_type: 0x6
>         - header_size_dw: 0xa1
>         - header_version: 0x10000
>         - module_id: 0x0
>         - module_vendor: 0x8086
>         - date: 0x20220909
>         - size_dw: 0x11771
>         - key_size_dw: 0x40
>         - modulus_size_dw: 0x40
>         - exponent_size_dw: 0x1
>         - time: 0x452109
>         - username: b'sys_gbsb'
>         - buildnumber: b'PC-1.0.3150\x00'
>         - sw_version: 0x460501
>         - vf_version: 0x0
>         - reserved0: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
>         - rsvd: <rsvd private_data_size=3D0x801000, reserved1=3D0x801000>
>         - header_info: 0x400100
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tools/intel-gfx-fw-info | 120 ++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build       |   2 +-
>  2 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100755 tools/intel-gfx-fw-info
>=20
> diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
> new file mode 100755
> index 000000000..fc1fafdf5
> --- /dev/null
> +++ b/tools/intel-gfx-fw-info
> @@ -0,0 +1,120 @@
> +#!/usr/bin/env python3
> +# pylint: disable=3DC0301
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +#
> +# Copyright (C) 2023    Intel Corporation
> +
> +import argparse
> +import logging
> +import pprint
> +import sys
> +import typing
> +
> +from dissect import cstruct

Since we are not packaging this tool in a way that dependencies are
automatically installed, I think it is worth to capture an ImportError
here and point the user to the github repository for this dependency.

Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>

> +
> +# struct definition below should match the one from i915
> +# (drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h) and xe
> +# (drivers/gpu/drm/xe/xe_uc_fw_abi.h).
> +#
> +# For compatibility reasons with dissect.cstruct python module, the foll=
owing
> +# things are changed from the original kernel definition:
> +#
> +#       1) Comments removed
> +#       2) No anonymous union - not compatible with the
> +#          dumpstruct(), give it a name
> +
> +CDEF =3D """
> +typedef uint32 u32;
> +
> +struct uc_css_header {
> +        u32 module_type;
> +        u32 header_size_dw;
> +        u32 header_version;
> +        u32 module_id;
> +        u32 module_vendor;
> +        u32 date;
> +        u32 size_dw;
> +        u32 key_size_dw;
> +        u32 modulus_size_dw;
> +        u32 exponent_size_dw;
> +        u32 time;
> +        char username[8];
> +        char buildnumber[12];
> +        u32 sw_version;
> +        u32 vf_version;
> +        u32 reserved0[12];
> +        union {
> +                u32 private_data_size;
> +                u32 reserved1;
> +        } rsvd;
> +        u32 header_info;
> +};
> +"""
> +
> +logger =3D logging.getLogger(__name__)
> +
> +
> +def ffs(x: int) -> int:
> +    """Returns the index, counting from 0, of the
> +    least significant set bit in `x`.
> +    """
> +    return (x & -x).bit_length() - 1
> +
> +
> +def FIELD_GET(mask: int, value: int) -> int:
> +    return (value & mask) >> ffs(mask)
> +
> +
> +def decode(fw) -> str:
> +    data =3D []
> +
> +    CSS_SW_VERSION_UC_MAJOR =3D 0xFF << 16
> +    CSS_SW_VERSION_UC_MINOR =3D 0xFF << 8
> +    CSS_SW_VERSION_UC_PATCH =3D 0xFF
> +    major =3D FIELD_GET(CSS_SW_VERSION_UC_MAJOR, fw.sw_version)
> +    minor =3D FIELD_GET(CSS_SW_VERSION_UC_MINOR, fw.sw_version)
> +    patch =3D FIELD_GET(CSS_SW_VERSION_UC_PATCH, fw.sw_version)
> +    data +=3D [f"version: {major}.{minor}.{patch}"]
> +
> +    CSS_DATE_DAY =3D 0xFF
> +    CSS_DATE_MONTH =3D 0xFF << 8
> +    CSS_DATE_YEAR =3D 0xFFFF << 16
> +    day =3D FIELD_GET(CSS_DATE_DAY, fw.date)
> +    month =3D FIELD_GET(CSS_DATE_MONTH, fw.date)
> +    year =3D FIELD_GET(CSS_DATE_YEAR, fw.date)
> +    data +=3D [f"date: {year:02x}-{month:02x}-{day:02x}"]
> +
> +    return data
> +
> +
> +def parse_args(argv: typing.List[str]) -> argparse.Namespace:
> +    description =3D "Dump GuC/HuC firmware header"
> +    parser =3D argparse.ArgumentParser(prog=3D"intel-gfx-fw-info", descr=
iption=3Ddescription)
> +
> +    parser.add_argument("filename", help=3D"GuC/HuC firmware file")
> +
> +    return parser.parse_args(argv)
> +
> +
> +def main(argv: typing.List[str]) -> int:
> +    args =3D parse_args(argv)
> +
> +    cparser =3D cstruct.cstruct()
> +    cparser.load(CDEF)
> +
> +    try:
> +        with open(args.filename, mode=3D"rb") as f:
> +            fw =3D cparser.uc_css_header(f)
> +    except FileNotFoundError as e:
> +        logger.fatal(e)
> +        return 1
> +
> +    print(*decode(fw), sep=3D"\n")
> +    print("raw dump:", end=3D"")
> +    cstruct.dumpstruct(fw, color=3Dsys.stdout.isatty())
> +
> +    return 0
> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(main(sys.argv[1:]))
> diff --git a/tools/meson.build b/tools/meson.build
> index 4c45f16b9..88c58adfe 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -81,7 +81,7 @@ executable('intel_reg', sources : intel_reg_src,
>              '-DIGT_DATADIR=3D"@0@"'.format(join_paths(prefix, datadir)),
>            ])
> =20
> -install_data('intel_gpu_abrt', install_dir : bindir)
> +install_data(['intel_gpu_abrt', 'intel-gfx-fw-info'], install_dir : bind=
ir)
> =20
>  install_subdir('registers', install_dir : datadir)
> =20
> --=20
> 2.39.0
>
